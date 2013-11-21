//
//  RUDrinkWithViewController.m
//  Drink.io
//
//  Created by Paul Jones on 11/18/13.
//  Copyright (c) 2013 Principles of Informations and Data Management. All rights reserved.
//

#import "RUDrinkWithViewController.h"
#import "RUDBManager.h"

@interface RUDrinkWithViewController () {
    RUDBManager * db;
    NSArray * bestFriends;
}

@end

@implementation RUDrinkWithViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    db = [RUDBManager getSharedInstance];
    bestFriends = [db getBestFriends];
    
    people = [[NSMutableArray alloc ] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view delegate

- (void) tableView: (UITableView *) tableView didSelectRowAtIndexPath: (NSIndexPath *) indexPath
{
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (selectedCell.accessoryType == UITableViewCellAccessoryCheckmark) {
        selectedCell.accessoryType = UITableViewCellAccessoryNone;
        
        // taking out of current excursion
        
    } else if (selectedCell.accessoryType == UITableViewCellAccessoryNone) {
        selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        // the contact is not yet in the DB, so put it in
        
        // the contact is in the DB, so retrieve
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if ([bestFriends count] > 0) {
        return 2;
    } else {
        return 1;
    }
}

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString * titleForHeader;
    
    if (section == 0 && [bestFriends count] > 0) {
        titleForHeader = @"Best Friends";
    } else {
        titleForHeader = @"Contacts";
    }
    
    return titleForHeader;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger numberOfRows;
    
    if (section == 0 && [bestFriends count] > 0) {
        numberOfRows = [bestFriends count];
    } else {
        numberOfRows = [people count];
    }
    
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.section == 0 && [bestFriends count] > 0) {
        cell.textLabel.text = [bestFriends objectAtIndex:indexPath.row];
    } else {
        cell.textLabel.text = [people objectAtIndex:indexPath.row];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
}

#pragma mark - IBActions

- (IBAction) doneTapped: (id) sender
{
    [self performSegueWithIdentifier:@"drink_at" sender:self];
}

@end
