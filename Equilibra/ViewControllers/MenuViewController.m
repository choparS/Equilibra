//
//  MenuViewController.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "MenuViewController.h"
#import "UIViewController+ECSlidingViewController.h"
#import "UserData.h"

@interface MenuViewController ()

@property (nonatomic, strong) NSMutableArray*           menuItemsGuest;
@property (nonatomic, strong) NSMutableArray*           menuItemsMember;
@property (nonatomic, strong) UINavigationController*   homeNavigationController;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.menuItemsGuest = nil;
    self.menuItemsMember = nil;
    self.homeNavigationController = (UINavigationController *)self.slidingViewController.topViewController;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:false];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

#pragma mark - Properties

- (NSMutableArray *)menuItemsMember {
    if (_menuItemsMember)
        return _menuItemsMember;
    else
        _menuItemsMember = [NSMutableArray arrayWithObjects:@"Home", @"Account", @"Settings", nil];
    return _menuItemsMember;
}

- (NSMutableArray *)menuItemsGuest {
    if (_menuItemsGuest)
        return _menuItemsGuest;
    else
        _menuItemsGuest = [NSMutableArray arrayWithObjects:@"Home", @"Connection", @"Settings", nil];
    return _menuItemsGuest;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([UserData getInstance].connected)
        return self.menuItemsMember.count;
    else
        return self.menuItemsGuest.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"MenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    NSString *menuItem;
    
    if ([UserData getInstance].connected)
        menuItem = self.menuItemsMember[indexPath.row];
    else
        menuItem = self.menuItemsGuest[indexPath.row];
    
    cell.textLabel.text = menuItem;
    [cell setBackgroundColor:[UIColor clearColor]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *menuItem;
    
    if ([UserData getInstance].connected)
        menuItem = self.menuItemsMember[indexPath.row];
    else
        menuItem = self.menuItemsGuest[indexPath.row];

    self.slidingViewController.topViewController.view.layer.transform = CATransform3DMakeScale(1, 1, 1);
    
    if ([menuItem isEqualToString:@"Home"])
        self.slidingViewController.topViewController = self.homeNavigationController;
    else if ([menuItem isEqualToString:@"Account"])
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AccountNavigation"];
    else if ([menuItem isEqualToString:@"Connection"])
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ConnectionNavigation"];
    else if ([menuItem isEqualToString:@"Settings"])
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingsNavigation"];
    
    [self.slidingViewController resetTopViewAnimated:YES];
}

@end

