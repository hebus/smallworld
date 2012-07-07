//
//  HBSFirstViewDetailController.m
//  SmallWorld Encyclopedia
//
//  Created by Olivier on 24/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HBSFirstViewDetailController.h"

@interface HBSFirstViewDetailController ()

@end

@implementation HBSFirstViewDetailController

@synthesize peuple = _peuple;
@synthesize power = _power;
@synthesize peupleDescription = _peupleDescription;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if(_peuple != nil){
        [[self peupleDescription] setText:_peuple.pouvoir];
        self.title = _peuple.name;
    }
    if(_power != nil){
        [[self peupleDescription] setText:_power.effet];
        self.title = _power.name;
    }
}

- (void)viewDidUnload
{
    [self setPeupleDescription:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)setPeuple:(Peuple*)newPeuple
{
    if (_peuple != newPeuple) {
        _peuple = newPeuple;
        _power = nil;
    }
}
-(void)setPouvoir:(Pouvoir *)pouvoir{
    if(_power != pouvoir){
        _power = pouvoir;
        _peuple = nil;
    }
}
@end
