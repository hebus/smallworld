#import "Pouvoir.h"

@interface Pouvoir (Extensions)

+ (void)importDataToMoc:(NSManagedObjectContext *)moc;
- (NSString *)sectionTitle;

@end