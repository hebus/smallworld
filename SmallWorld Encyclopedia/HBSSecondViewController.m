//
//  HBSFirstViewController.m
//  SmallWorld Encyclopedia
//
//  Created by Olivier on 22/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HBSSecondViewController.h"
#import "Pouvoir+Extensions.h"
#import "Pouvoir.h"
#import "HBSFirstViewDetailController.h"


@interface HBSSecondViewController ()<NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation HBSSecondViewController

@synthesize managedObjectContext = _managedObjectContext;
@synthesize fetchedResultsController = _fetchedResultsController;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = NSLocalizedString(@"Pouvoirs", @"Pouvoirs");
    [Pouvoir importDataToMoc:self.managedObjectContext];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark -
#pragma mark UITableViewDataSource Delegates Methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [[self.fetchedResultsController sections]count];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    id<NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pouvoirCell"];
    Pouvoir *pouvoir = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = pouvoir.name;
    cell.detailTextLabel.text = pouvoir.extension;
    cell.imageView.image = [UIImage imageNamed:pouvoir.imageCard];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo name];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [self.fetchedResultsController sectionIndexTitles];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [self.fetchedResultsController sectionForSectionIndexTitle:title atIndex:index];
}
#pragma mark -
#pragma mark Fetched Results Controller

-(NSFetchedResultsController *)fetchedResultsController{
    if(_fetchedResultsController != nil){
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Pouvoir" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"extension" ascending:YES];
    NSSortDescriptor *sortDescriptorName = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, sortDescriptorName, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    NSFetchedResultsController *frc = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest 
                                                                          managedObjectContext:self.managedObjectContext 
                                                                            sectionNameKeyPath:@"extension" 
                                                                                     cacheName:@"pouvoir"];
    
    frc.delegate = self;
    self.fetchedResultsController = frc;
    
    NSError *error = nil;
    if(![self.fetchedResultsController performFetch:&error]){
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
    }
    
    return _fetchedResultsController;
}
-(void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView reloadData];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetailPouvoir"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Pouvoir *pouvoir = [self.fetchedResultsController objectAtIndexPath:indexPath];
        [[segue destinationViewController] setPower:pouvoir];
    }
}
@end
