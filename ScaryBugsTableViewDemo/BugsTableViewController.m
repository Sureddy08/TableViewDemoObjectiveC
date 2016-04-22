//
//  BugsTableViewController.m
//  ScaryBugsTableViewDemo
//
//  Created by VKS on 3/25/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import "BugsTableViewController.h"
#import "BugSection.h"

@interface BugsTableViewController ()

@property (strong, nonatomic) NSMutableArray *bugSections;

@end

@implementation BugsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpBugs];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setUpBugs{
    self.bugSections = [NSMutableArray arrayWithCapacity:5];
    [self.bugSections addObject: [[BugSection alloc] initWithHowScary: ScaryFactorNotScary]];
    [self.bugSections addObject: [[BugSection alloc] initWithHowScary: ScaryFactorALittleScary]];
    [self.bugSections addObject: [[BugSection alloc] initWithHowScary: ScaryFactorAverageScary]];
    [self.bugSections addObject: [[BugSection alloc] initWithHowScary: ScaryFactorQuiteScary]];
    [self.bugSections addObject: [[BugSection alloc] initWithHowScary: ScaryFactorAiiiiieeeee]];
    
    NSMutableArray *bugs = [ScaryBug bugs];
    for(ScaryBug *bug in bugs){
        BugSection *section = self.bugSections[(int) bug.howScary];
        [section.bugs addObject:bug];
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    BugSection *bugSection = self.bugSections[section];
    return [ScaryBug scaryFactorToString:bugSection.howScary];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(editingStyle == UITableViewCellEditingStyleDelete){
        BugSection *bugSection = self.bugSections[indexPath.section];
        [bugSection.bugs removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//warning Incomplete implementation, return the number of sections
    return self.bugSections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//warning Incomplete implementation, return the number of rows
    return [[self.bugSections[section] bugs] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    ScaryBug *bug = [self.bugSections[indexPath.section] bugs][indexPath.row];
    cell.textLabel.text = bug.name;
    cell.imageView.image = bug.image;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
