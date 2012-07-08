//
//  HBSFirstViewDetailController.h
//  SmallWorld Encyclopedia
//
//  Created by Olivier on 24/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Peuple.h"
#import "Pouvoir.h"

@interface HBSFirstViewDetailController : UIViewController

@property (strong, nonatomic) Peuple *peuple;
@property (strong, nonatomic) Pouvoir *power;
@property (strong, nonatomic) IBOutlet UITextView *peupleDescription;
@property (strong,nonatomic) IBOutlet UIImageView *imageView;
@property (strong,nonatomic) IBOutlet UIButton *infoButton;

@end
