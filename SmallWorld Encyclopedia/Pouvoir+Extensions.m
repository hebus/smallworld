#import "Pouvoir+Extensions.h"

@implementation Pouvoir (Extensions)

+ (void)importDataToMoc:(NSManagedObjectContext *)moc
{
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Pouvoir"
											  inManagedObjectContext:moc];
	[fetchRequest setEntity:entity];
	NSError *error = nil;
	NSUInteger count = [moc countForFetchRequest:fetchRequest error:&error];
	
	if (count == 0)
	{
		NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"sw_pouvoirs" ofType:@"plist"];
		NSArray *countries = [[NSArray alloc] initWithContentsOfFile:plistPath];
		for (NSDictionary *item in countries)
		{
			Pouvoir *pouvoir = [NSEntityDescription insertNewObjectForEntityForName:@"Pouvoir"
															 inManagedObjectContext:moc];
			pouvoir.name = [item valueForKey:@"pouvoir"];
			pouvoir.extension = [item valueForKey:@"extension"];
			pouvoir.effet = [item valueForKey:@"effet"];
            pouvoir.imageCard = [[item valueForKey:@"image"] stringByAppendingString:@"Card.png"];
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