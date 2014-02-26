//
//  MenuViewController.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "MenuViewController.h"
#import "UIViewController+ECSlidingViewController.h"
#import "AppDelegate.h"
#import "UserData.h"
#import "MenuCell.h"
#import "GroupMenuCell.h"
#import "SubmenuCell.h"
#import "MenuItem.h"

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
    _menuItemsMember = [[NSMutableArray alloc] init];
    [_menuItemsMember addObject:[MenuItem initialize:MENU :@"Home" :@"MenuHomeIcon" :@"png" :-1 :nil]];
    [_menuItemsMember addObject:[MenuItem initialize:GROUP_MENU :@"Account" :@"MenuAccountIcon" :@"png" :-1
                                                    :[[NSMutableArray alloc] initWithObjects:
                                                      [MenuItem initialize:SUBMENU :@"My Profile" :@"MenuProfileIcon" :@"png" :1 :nil],
                                                      [MenuItem initialize:SUBMENU :@"My Follows" :@"MenuFollowsIcon" :@"png" :1 :nil],
                                                      [MenuItem initialize:SUBMENU :@"My Plannings" :@"MenuPlanningsIcon" :@"png" :1 :nil],
                                                      [MenuItem initialize:SUBMENU :@"My Messages" :@"MenuMessagesIcon" :@"png" :1 :nil],
                                                      [MenuItem initialize:SUBMENU :@"My Friends" :@"MenuFriendsIcon" :@"png" :1 :nil],
                                                      [MenuItem initialize:SUBMENU :@"My Favorites" :@"MenuFavoritesIcon" :@"png" :1 :nil],
                                                      [MenuItem initialize:SUBMENU :@"Logout" :@"MenuLogoutIcon" :@"png" :1 :nil], nil]]];
    [_menuItemsMember addObject:[MenuItem initialize:GROUP_MENU :@"Articles" :@"MenuArticlesIcon" :@"png" :-1
                                                    :[[NSMutableArray alloc] initWithObjects:
                                                      [MenuItem initialize:SUBMENU :@"Nutrition" :@"MenuNutritionIcon" :@"png" :2 :nil],
                                                      [MenuItem initialize:SUBMENU :@"Sport" :@"MenuSportIcon" :@"png" :2 :nil],
                                                      [MenuItem initialize:SUBMENU :@"Weight" :@"MenuWeightIcon" :@"png" :2 :nil], nil]]];
    [_menuItemsMember addObject:[MenuItem initialize:MENU :@"Recipes" :@"MenuRecipesIcon" :@"png" :-1 :nil]];
    [_menuItemsMember addObject:[MenuItem initialize:GROUP_MENU :@"Tools" :@"MenuToolsIcon" :@"png" :-1
                                                    :[[NSMutableArray alloc] initWithObjects:
                                                      [MenuItem initialize:SUBMENU :@"Sport Partners Search" :@"MenuSportPartnerIcon" :@"png" :4 :nil],
                                                      [MenuItem initialize:SUBMENU :@"BMI Calculation" :@"MenuBMIIcon" :@"png" :4 :nil],
                                                      [MenuItem initialize:SUBMENU :@"Body Fat Calculation" :@"MenuBodyFatIcon" :@"png" :4 :nil], nil]]];
    [_menuItemsMember addObject:[MenuItem initialize:GROUP_MENU :@"Forum" :@"MenuForumIcon" :@"png" :-1
                                                    :[[NSMutableArray alloc] initWithObjects:
                                                      [MenuItem initialize:SUBMENU :@"Nutrition" :@"MenuNutritionIcon" :@"png" :5 :nil],
                                                      [MenuItem initialize:SUBMENU :@"Sport" :@"MenuSportIcon" :@"png" :5 :nil],
                                                      [MenuItem initialize:SUBMENU :@"Weight" :@"MenuWeightIcon" :@"png" :5 :nil], nil]]];
    [_menuItemsMember addObject:[MenuItem initialize:MENU :@"Settings" :@"MenuSettingsIcon" :@"png" :-1 :nil]];
    return _menuItemsMember;
}

- (NSMutableArray *)menuItemsGuest {
    if (_menuItemsGuest)
        return _menuItemsGuest;
    _menuItemsGuest = [[NSMutableArray alloc] init];
    [_menuItemsGuest addObject:[MenuItem initialize:MENU :@"Home" :@"MenuHomeIcon" :@"png" :-1 :nil]];
    [_menuItemsGuest addObject:[MenuItem initialize:GROUP_MENU :@"Connection" :@"MenuConnectionIcon" :@"png" :-1
                                                    :[[NSMutableArray alloc] initWithObjects:
                                                      [MenuItem initialize:SUBMENU :@"Register" :@"MenuRegisterIcon" :@"png" :1 :nil], nil]]];
    [_menuItemsGuest addObject:[MenuItem initialize:GROUP_MENU :@"Articles" :@"MenuArticlesIcon" :@"png" :-1
                                                    :[[NSMutableArray alloc] initWithObjects:
                                                      [MenuItem initialize:SUBMENU :@"Nutrition" :@"MenuNutritionIcon" :@"png" :2 :nil],
                                                      [MenuItem initialize:SUBMENU :@"Sport" :@"MenuSportIcon" :@"png" :2 :nil],
                                                      [MenuItem initialize:SUBMENU :@"Weight" :@"MenuWeightIcon" :@"png" :2 :nil], nil]]];
    [_menuItemsGuest addObject:[MenuItem initialize:MENU :@"Recipes" :@"MenuRecipesIcon" :@"png" :-1 :nil]];
    [_menuItemsGuest addObject:[MenuItem initialize:GROUP_MENU :@"Tools" :@"MenuToolsIcon" :@"png" :-1
                                                    :[[NSMutableArray alloc] initWithObjects:
                                                      [MenuItem initialize:SUBMENU :@"Sport Partners Search" :@"MenuSportPartnerIcon" :@"png" :4 :nil],
                                                      [MenuItem initialize:SUBMENU :@"BMI Calculator" :@"MenuBMIIcon" :@"png" :4 :nil],
                                                      [MenuItem initialize:SUBMENU :@"Body Fat Calculator" :@"MenuBodyFatIcon" :@"png" :4 :nil], nil]]];
    [_menuItemsGuest addObject:[MenuItem initialize:GROUP_MENU :@"Forum" :@"MenuForumIcon" :@"png" :-1
                                                    :[[NSMutableArray alloc] initWithObjects:
                                                      [MenuItem initialize:SUBMENU :@"Nutrition" :@"MenuNutritionIcon" :@"png" :5 :nil],
                                                      [MenuItem initialize:SUBMENU :@"Sport" :@"MenuSportIcon" :@"png" :5 :nil],
                                                      [MenuItem initialize:SUBMENU :@"Weight" :@"MenuWeightIcon" :@"png" :5 :nil], nil]]];
    [_menuItemsGuest addObject:[MenuItem initialize:MENU :@"Settings" :@"MenuSettingsIcon" :@"png" :-1 :nil]];
    return _menuItemsGuest;
}

#pragma mark - UITableViewDataSource

- (MenuItem*)getItemFromIndex: (NSInteger)index {
    NSMutableArray* menuItems = ([UserData getInstance].connected) ? self.menuItemsMember : self.menuItemsGuest;
    int i = menuItems.count;
    int k = 0;
    
    for (int n = 0; n < i; ++n) {
        MenuItem*   item = (MenuItem*)menuItems[n];

        if (n == index - k)
            return item;
        else if (item.isOpen && item.submenu) {
            int j = item.submenu.count;
                
            for (int m = 0; m < j; ++m) {
                if (n + (m + 1) == index - k)
                    return (MenuItem*)(item.submenu[m]);
            }
            k += j;
        }
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSMutableArray* menuItems = ([UserData getInstance].connected) ? self.menuItemsMember : self.menuItemsGuest;
    int i = (int)menuItems.count;
    int c = i;
        
    for (int n = 0; n < i; ++n) {
        MenuItem *item = (MenuItem*)menuItems[(NSInteger)n];
            
        if (item.isOpen && item.submenu)
            c += item.submenu.count;
    }
    return c;
}

- (IBAction)showSubMenu:(id)sender {
    NSMutableArray* menuItems = ([UserData getInstance].connected) ? self.menuItemsMember : self.menuItemsGuest;
    ArrowButton*    button = (ArrowButton*)sender;
    MenuItem*       item =  (MenuItem*)menuItems[button.indexCell];
    
    if (item.isOpen)
        item.isOpen = FALSE;
    else
        item.isOpen = TRUE;
    
    [self viewWillAppear:FALSE];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray* menuItems = ([UserData getInstance].connected) ? self.menuItemsMember : self.menuItemsGuest;
    MenuItem*       menu = [self getItemFromIndex:indexPath.row];
    
    if (menu.cellType == MENU) {
        MenuCell*   menuCell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell"];
        NSString*   filePath = [[NSBundle mainBundle] pathForResource:menu.iconName ofType:menu.iconType];
        
        [menuCell.icon setImage:[[UIImage alloc] initWithContentsOfFile:filePath]];
        menuCell.title.text = menu.title;
        [menuCell setBackgroundColor:[UIColor clearColor]];
        return menuCell;
    }
    else if (menu.cellType == GROUP_MENU) {
        GroupMenuCell*  groupMenuCell = [tableView dequeueReusableCellWithIdentifier:@"GroupMenuCell"];
        NSString*       filePathIcon = [[NSBundle mainBundle] pathForResource:menu.iconName ofType:menu.iconType];
        NSString*       buttonName = (menu.isOpen) ? @"MenuArrowDown" : @"MenuArrowRight";
        NSString*       filePathButton = [[NSBundle mainBundle] pathForResource:buttonName ofType:@"png"];
        
        [groupMenuCell.icon setImage:[[UIImage alloc] initWithContentsOfFile:filePathIcon]];
        groupMenuCell.arrowButton.indexCell = [menuItems indexOfObject:(id)menu];
        [groupMenuCell.arrowButton setImage:[[UIImage alloc] initWithContentsOfFile:filePathButton] forState:UIControlStateNormal];
        groupMenuCell.title.text = menu.title;
        [groupMenuCell setBackgroundColor:[UIColor clearColor]];
        return groupMenuCell;
    }
    else if (menu.cellType == SUBMENU) {
        MenuItem*   menuParent = menuItems[menu.indexParent];
        
        if (menuParent.isOpen == TRUE) {
            SubmenuCell*    submenuCell = [tableView dequeueReusableCellWithIdentifier:@"SubmenuCell"];
            NSString*       filePath = [[NSBundle mainBundle] pathForResource:menu.iconName ofType:menu.iconType];
        
            [submenuCell.icon setImage:[[UIImage alloc] initWithContentsOfFile:filePath]];
            submenuCell.title.text = menu.title;
            [submenuCell setBackgroundColor:[UIColor clearColor]];
            return submenuCell;
        }
    }
    
    return nil;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MenuItem*       menu = [self getItemFromIndex:indexPath.row];

    self.slidingViewController.topViewController.view.layer.transform = CATransform3DMakeScale(1, 1, 1);
    
    if ([menu.title isEqualToString:@"Home"])
        self.slidingViewController.topViewController = self.homeNavigationController;
    else if ([menu.title isEqualToString:@"Connection"])
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ConnectionNavigation"];
    else if ([menu.title isEqualToString:@"Register"])
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RegisterNavigation"];
    else if ([menu.title isEqualToString:@"Account"])
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AccountNavigation"];
    else if ([menu.title isEqualToString:@"My Profile"])
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MyProfileNavigation"];
    else if ([menu.title isEqualToString:@"My Follows"])
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MyFollowsNavigation"];
    else if ([menu.title isEqualToString:@"My Plannings"])
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MyPlanningsNavigation"];
    else if ([menu.title isEqualToString:@"My Messages"])
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MyMessagesNavigation"];
    else if ([menu.title isEqualToString:@"My Friends"])
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MyFriendsNavigation"];
    else if ([menu.title isEqualToString:@"My Favorites"])
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MyFavoritesNavigation"];
    else if ([menu.title isEqualToString:@"Logout"]) {
        if ([UserData getInstance].accountType == FACEBOOK) {
            if (FBSession.activeSession.state == FBSessionStateOpen || FBSession.activeSession.state == FBSessionStateOpenTokenExtended)
                [FBSession.activeSession closeAndClearTokenInformation];
            else {
                [FBSession openActiveSessionWithReadPermissions:@[@"basic_info", @"email", @"user_birthday"] allowLoginUI:YES
                                              completionHandler:^(FBSession *session, FBSessionState state, NSError *error) {
                                                  AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
                                                  [appDelegate sessionStateChanged:session state:state error:error];
                                              }];
            }
        }
        self.slidingViewController.topViewController = self.homeNavigationController;
    }
    else if ([menu.title isEqualToString:@"Articles"])
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ArticlesNavigation"];
    else if ([menu.title isEqualToString:@"Recipes"])
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RecipesNavigation"];
    else if ([menu.title isEqualToString:@"Tools"])
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ToolsNavigation"];
    else if ([menu.title isEqualToString:@"Forum"])
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ForumNavigation"];
    else if ([menu.title isEqualToString:@"Settings"])
        self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingsNavigation"];
    
    [self.slidingViewController resetTopViewAnimated:YES];
}

@end
