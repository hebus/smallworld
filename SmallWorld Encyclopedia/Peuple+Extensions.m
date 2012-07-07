#import "Peuple+Extensions.h"

@implementation Peuple (Extensions)

+ (void)importDataToMoc:(NSManagedObjectContext *)moc
{
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Peuple"
											  inManagedObjectContext:moc];
	[fetchRequest setEntity:entity];
	NSError *error = nil;
	NSUInteger count = [moc countForFetchRequest:fetchRequest error:&error];
	
	if (count == 0)
	{
		NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"sw_peuples" ofType:@"plist"];
		NSArray *countries = [[NSArray alloc] initWithContentsOfFile:plistPath];
		for (NSDictionary *item in countries)
		{
			Peuple *peuple = [NSEntityDescription insertNewObjectForEntityForName:@"Peuple"
															 inManagedObjectContext:moc];
			peuple.name = [item valueForKey:@"peuple"];
			peuple.extension = [item valueForKey:@"extension"];
			peuple.pouvoir = [item valueForKey:@"pouvoir"];
		}
		
		if (![moc save:&error])
		{
			NSLog(@"failed to import data: %@", [error localizedDescription]);
		}
	}
}

- (NSString *)sectionTitle
{
	return [self.extension substringToIndex:1];
}
@end