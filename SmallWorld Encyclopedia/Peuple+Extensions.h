#import "Peuple.h"

@interface Peuple (Extensions)


+ (void)importDataToMoc:(NSManagedObjectContext *)moc;
- (NSString *)sectionTitle;

@end