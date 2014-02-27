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
#import "MenuCell.h"
#import "GroupMenuCell.h"
#import "SubmenuCell.h"
#import "FlagCell.h"
#import "MenuItem.h"
#import "MenuFlag.h"
#import "UserData.h"
#import "Settings.h"

@interface MenuViewController ()

@property (nonatomic, strong) NSMutableArray*           menuItemsGuest;
@property (nonatomic, strong) NSMutableArray*           menuItemsMember;
@property (nonatomic, strong) NSMutableArray*           menuFlags;
@property (nonatomic, strong) UINavigationController*   homeNavigationController;

@end

@implementation MenuViewController

@synthesize flag = _flag;
@synthesize tableView = _tableView;
@synthesize menuFlagOpen = _menuFlagOpen;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.menuItemsGuest = nil;
    self.menuItemsMember = nil;
    self.homeNavigationController = (UINavigationController *)self.slidingViewController.topViewController;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // On met à jour les données du menu
    [_tableView reloadData];
    // On déselectionne la cellule précédemment sélectionnée
    [_tableView deselectRowAtIndexPath:[_tableView indexPathForSelectedRow] animated:FALSE];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

#pragma mark - Properties

- (NSMutableArray *)menuFlags {
    // Création des flags
    if (_menuFlags)
        return _menuFlags;
    _menuFlags = [[NSMutableArray alloc] init];
    [_menuFlags addObject:[MenuFlag initialize:@"English" :@"EN" :@"MenuFlagEN" :@"png"]];
    [_menuFlags addObject:[MenuFlag initialize:@"France" :@"FR" :@"MenuFlagFR" :@"png"]];
    return _menuFlags;
}

- (NSMutableArray *)menuItemsMember {
    // Création des menus pour un utilisateur membre
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
    // Création des menus pour un utilisateur invité
    if (_menuItemsGuest)
        return _menuItemsGuest;
    
    Settings*   settings = [Settings getInstance];
    
    _menuItemsGuest = [[NSMutableArray alloc] init];
    [_menuItemsGuest addObject:[MenuItem initialize:MENU :NSLocalizedStringFromTable(@"MenuHome", settings.language, @"") :@"MenuHomeIcon" :@"png" :-1 :nil]];
    [_menuItemsGuest addObject:[MenuItem initialize:GROUP_MENU :NSLocalizedStringFromTable(@"MenuConnection", settings.language, @"") :@"MenuConnectionIcon" :@"png" :-1
                                                    :[[NSMutableArray alloc] initWithObjects:
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuRegister", settings.language, @"") :@"MenuRegisterIcon" :@"png" :1 :nil], nil]]];
    [_menuItemsGuest addObject:[MenuItem initialize:GROUP_MENU :NSLocalizedStringFromTable(@"MenuArticles", settings.language, @"") :@"MenuArticlesIcon" :@"png" :-1
                                                    :[[NSMutableArray alloc] initWithObjects:
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuNutrition", settings.language, @"") :@"MenuNutritionIcon" :@"png" :2 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuSport", settings.language, @"") :@"MenuSportIcon" :@"png" :2 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuWeight", settings.language, @"") :@"MenuWeightIcon" :@"png" :2 :nil], nil]]];
    [_menuItemsGuest addObject:[MenuItem initialize:MENU :NSLocalizedStringFromTable(@"MenuRecipes", settings.language, @"") :@"MenuRecipesIcon" :@"png" :-1 :nil]];
    [_menuItemsGuest addObject:[MenuItem initialize:GROUP_MENU :NSLocalizedStringFromTable(@"MenuTools", settings.language, @"") :@"MenuToolsIcon" :@"png" :-1
                                                    :[[NSMutableArray alloc] initWithObjects:
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuSportPartner", settings.language, @"") :@"MenuSportPartnerIcon" :@"png" :4 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuBMI", settings.language, @"") :@"MenuBMIIcon" :@"png" :4 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuBodyFat", settings.language, @"") :@"MenuBodyFatIcon" :@"png" :4 :nil], nil]]];
    [_menuItemsGuest addObject:[MenuItem initialize:GROUP_MENU :NSLocalizedStringFromTable(@"MenuForum", settings.language, @"") :@"MenuForumIcon" :@"png" :-1
                                                    :[[NSMutableArray alloc] initWithObjects:
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuNutrition", settings.language, @"") :@"MenuNutritionIcon" :@"png" :5 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuSport", settings.language, @"") :@"MenuSportIcon" :@"png" :5 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuWeight", settings.language, @"") :@"MenuWeightIcon" :@"png" :5 :nil], nil]]];
    [_menuItemsGuest addObject:[MenuItem initialize:MENU :NSLocalizedStringFromTable(@"MenuSettings", settings.language, @"") :@"MenuSettingsIcon" :@"png" :-1 :nil]];
    return _menuItemsGuest;
}

// Fonction qui permet de récupérer un item depuis son index
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
    if (_menuFlagOpen)
        return self.menuFlags.count;
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

// Fonction appelée lorsqu'lon clique sur le drapeau
- (IBAction)showFlag:(id)sender {
    if (_menuFlagOpen)
        _menuFlagOpen = FALSE;
    else
        _menuFlagOpen = TRUE;
    
    [self viewWillAppear:FALSE];
}

// Fonction appelée lorsque l'on clique sur la flèche pour montrer ou cacher les sous-menus
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

// Fonction appelé lorsque la UITableView se charge, elle permet d'initialiser les cellules
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_menuFlagOpen) {
        MenuFlag*   flag = self.menuFlags[indexPath.row];
        FlagCell*   flagCell = [tableView dequeueReusableCellWithIdentifier:@"FlagCell"];
        NSString*   filePath = [[NSBundle mainBundle] pathForResource:flag.iconName ofType:flag.iconType];
        
        [flagCell.icon setImage:[[UIImage alloc] initWithContentsOfFile:filePath]];
        flagCell.title.text = flag.title;
        [flagCell setBackgroundColor:[UIColor clearColor]];
        return flagCell;
    }
    else {
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
    }
    return nil;
}

#pragma mark - UITableViewDelegate

// Fonction appelée lorsque l'utilisateur selectionne une cellule
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_menuFlagOpen) {
        MenuFlag*   flag = self.menuFlags[indexPath.row];
        Settings*   settings = [Settings getInstance];
        
        if (settings.language != flag.code) {
            NSString*  filePath = [[NSBundle mainBundle] pathForResource:flag.iconName ofType:flag.iconType];
            
            settings.language = flag.code;
            [_flag setImage:[[UIImage alloc] initWithContentsOfFile:filePath] forState:UIControlStateNormal];
            _menuItemsGuest = nil;
            _menuItemsMember = nil;
        }
        _menuFlagOpen = FALSE;
        [self viewWillAppear:FALSE];
    }
    else {
        MenuItem*   menu = [self getItemFromIndex:indexPath.row];
        
        self.slidingViewController.topViewController.view.layer.transform = CATransform3DMakeScale(1, 1, 1);
        
        // On redirige l'utilisateur selon la cellule selectionnée
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
}

@end
