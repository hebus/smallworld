//
//  Pouvoir.h
//  SmallWorld Encyclopedia
//
//  Created by Olivier on 02/07/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Pouvoir : NSManagedObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *extension ;
@property (nonatomic, retain) NSString *effet ;

@end
