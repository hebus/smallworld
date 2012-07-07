#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Peuple : NSManagedObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *extension;
@property (nonatomic, retain) NSString *pouvoir;
@property (nonatomic, retain) NSString *image;
@property (nonatomic, retain) NSString *imageCard;

@end