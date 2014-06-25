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

@synthesize flagButton = _flagButton;
@synthesize flagIcon = _flagIcon;
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
    [_menuFlags addObject:[MenuFlag initialize:@"France" :@"FR" :@"menuFlagFR" :@"png"]];
    [_menuFlags addObject:[MenuFlag initialize:@"United Kingdom" :@"UK" :@"menuFlagUK" :@"png"]];
    return _menuFlags;
}

- (NSMutableArray *)menuItemsMember {
    // Création des menus pour un utilisateur membre
    if (_menuItemsMember)
        return _menuItemsMember;
    
    Settings*   settings = [Settings getInstance];
    
    _menuItemsMember = [[NSMutableArray alloc] init];
    [_menuItemsMember addObject:[MenuItem initialize:MENU :NSLocalizedStringFromTable(@"MenuHome", settings.language, @"") :@"menuHomeIcon" :@"png" :-1 :nil]];
    [_menuItemsMember addObject:[MenuItem initialize:GROUP_MENU :NSLocalizedStringFromTable(@"MenuAccount", settings.language, @"") :@"menuMyAccountIcon" :@"png" :-1
                                                    :[[NSMutableArray alloc] initWithObjects:
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuMyProfile", settings.language, @"") :@"menuMyProfileIcon" :@"png" :1 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuMyFollows", settings.language, @"") :@"menuMyFollowsIcon" :@"png" :1 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuMyPlannings", settings.language, @"") :@"menuMyPlanningsIcon" :@"png" :1 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuMyMessages", settings.language, @"") :@"menuMyMessagesIcon" :@"png" :1 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuMyFriends", settings.language, @"") :@"menuMyFriendsIcon" :@"png" :1 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuMyFavorites", settings.language, @"") :@"menuMyFavoritesIcon" :@"png" :1 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuLogout", settings.language, @"") :@"menuLogoutIcon" :@"png" :1 :nil], nil]]];
    [_menuItemsMember addObject:[MenuItem initialize:GROUP_MENU :NSLocalizedStringFromTable(@"MenuArticles", settings.language, @"") :@"menuArticlesIcon" :@"png" :-1
                                                   :[[NSMutableArray alloc] initWithObjects:
                                                     [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuNutrition", settings.language, @"") :@"menuNutritionIcon" :@"png" :2 :nil],
                                                     [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuSport", settings.language, @"") :@"menuSportIcon" :@"png" :2 :nil],
                                                     [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuWeight", settings.language, @"") :@"menuWeightIcon" :@"png" :2 :nil], nil]]];
    [_menuItemsMember addObject:[MenuItem initialize:MENU :NSLocalizedStringFromTable(@"MenuRecipes", settings.language, @"") :@"menuRecipesIcon" :@"png" :-1 :nil]];
    [_menuItemsMember addObject:[MenuItem initialize:GROUP_MENU :NSLocalizedStringFromTable(@"MenuTools", settings.language, @"") :@"menuToolsIcon" :@"png" :-1
                                                   :[[NSMutableArray alloc] initWithObjects:
                                                     [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuSportPartner", settings.language, @"") :@"menuSportPartnerIcon" :@"png" :4 :nil],
                                                     [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuBMI", settings.language, @"") :@"menuBMIIcon" :@"png" :4 :nil],
                                                     [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuBodyFat", settings.language, @"") :@"menuBodyFatIcon" :@"png" :4 :nil], nil]]];
    [_menuItemsMember addObject:[MenuItem initialize:GROUP_MENU :NSLocalizedStringFromTable(@"MenuForum", settings.language, @"") :@"menuForumIcon" :@"png" :-1
                                                    :[[NSMutableArray alloc] initWithObjects:
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuNutrition", settings.language, @"") :@"menuNutritionIcon" :@"png" :5 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuSport", settings.language, @"") :@"menuSportIcon" :@"png" :5 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuWeight", settings.language, @"") :@"menuWeightIcon" :@"png" :5 :nil], nil]]];
    [_menuItemsMember addObject:[MenuItem initialize:MENU :NSLocalizedStringFromTable(@"MenuSettings", settings.language, @"") :@"menuSettingsIcon" :@"png" :-1 :nil]];

    return _menuItemsMember;
}

- (NSMutableArray *)menuItemsGuest {
    // Création des menus pour un utilisateur invité
    if (_menuItemsGuest)
        return _menuItemsGuest;
    
    Settings*   settings = [Settings getInstance];
    
    _menuItemsGuest = [[NSMutableArray alloc] init];
    [_menuItemsGuest addObject:[MenuItem initialize:MENU :NSLocalizedStringFromTable(@"MenuHome", settings.language, @"") :@"menuHomeIcon" :@"png" :-1 :nil]];
    [_menuItemsGuest addObject:[MenuItem initialize:GROUP_MENU :NSLocalizedStringFromTable(@"MenuConnection", settings.language, @"") :@"menuConnectionIcon" :@"png" :-1
                                                    :[[NSMutableArray alloc] initWithObjects:
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuRegister", settings.language, @"") :@"menuRegisterIcon" :@"png" :1 :nil], nil]]];
    [_menuItemsGuest addObject:[MenuItem initialize:GROUP_MENU :NSLocalizedStringFromTable(@"MenuArticles", settings.language, @"") :@"menuArticlesIcon" :@"png" :-1
                                                    :[[NSMutableArray alloc] initWithObjects:
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuNutrition", settings.language, @"") :@"menuNutritionIcon" :@"png" :2 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuSport", settings.language, @"") :@"menuSportIcon" :@"png" :2 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuWeight", settings.language, @"") :@"menuWeightIcon" :@"png" :2 :nil], nil]]];
    [_menuItemsGuest addObject:[MenuItem initialize:MENU :NSLocalizedStringFromTable(@"MenuRecipes", settings.language, @"") :@"menuRecipesIcon" :@"png" :-1 :nil]];
    [_menuItemsGuest addObject:[MenuItem initialize:GROUP_MENU :NSLocalizedStringFromTable(@"MenuTools", settings.language, @"") :@"menuToolsIcon" :@"png" :-1
                                                    :[[NSMutableArray alloc] initWithObjects:
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuSportPartner", settings.language, @"") :@"menuSportPartnerIcon" :@"png" :4 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuBMI", settings.language, @"") :@"menuBMIIcon" :@"png" :4 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuBodyFat", settings.language, @"") :@"menuBodyFatIcon" :@"png" :4 :nil], nil]]];
    [_menuItemsGuest addObject:[MenuItem initialize:GROUP_MENU :NSLocalizedStringFromTable(@"MenuForum", settings.language, @"") :@"menuForumIcon" :@"png" :-1
                                                    :[[NSMutableArray alloc] initWithObjects:
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuNutrition", settings.language, @"") :@"menuNutritionIcon" :@"png" :5 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuSport", settings.language, @"") :@"menuSportIcon" :@"png" :5 :nil],
                                                      [MenuItem initialize:SUBMENU :NSLocalizedStringFromTable(@"MenuWeight", settings.language, @"") :@"menuWeightIcon" :@"png" :5 :nil], nil]]];
    [_menuItemsGuest addObject:[MenuItem initialize:MENU :NSLocalizedStringFromTable(@"MenuSettings", settings.language, @"") :@"menuSettingsIcon" :@"png" :-1 :nil]];

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
            NSString*       buttonName = (menu.isOpen) ? @"menuArrowDown" : @"menuArrowRight";
            NSString*       filePathButton = [[NSBundle mainBundle] pathForResource:buttonName ofType:@"png"];
        
            [groupMenuCell.icon setImage:[[UIImage alloc] initWithContentsOfFile:filePathIcon]];
            groupMenuCell.arrowButton.indexCell = [menuItems indexOfObject:(id)menu];
            [groupMenuCell.arrowIcon setImage:[[UIImage alloc] initWithContentsOfFile:filePathButton]];
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
    Settings*   settings = [Settings getInstance];
    
    if (_menuFlagOpen) {
        MenuFlag*   flag = self.menuFlags[indexPath.row];
        
        if (settings.language != flag.code) {
            NSString*  filePath = [[NSBundle mainBundle] pathForResource:flag.iconName ofType:flag.iconType];
            
            settings.language = flag.code;
            [_flagIcon setImage:[[UIImage alloc] initWithContentsOfFile:filePath]];
            _menuItemsGuest = nil;
            _menuItemsMember = nil;
        }
        _menuFlagOpen = FALSE;
        [self viewWillAppear:FALSE];
        [self.slidingViewController.topViewController viewWillAppear:FALSE];
    }
    else {
        MenuItem*   menu = [self getItemFromIndex:indexPath.row];
        
        self.slidingViewController.topViewController.view.layer.transform = CATransform3DMakeScale(1, 1, 1);
        
        // On redirige l'utilisateur selon la cellule selectionnée
        if ([menu.title isEqualToString:NSLocalizedStringFromTable(@"MenuHome", settings.language, @"")])
            self.slidingViewController.topViewController = self.homeNavigationController;
        else if ([menu.title isEqualToString:NSLocalizedStringFromTable(@"MenuConnection", settings.language, @"")])
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ConnectionNavigation"];
        else if ([menu.title isEqualToString:NSLocalizedStringFromTable(@"MenuRegister", settings.language, @"")])
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RegisterNavigation"];
        else if ([menu.title isEqualToString:NSLocalizedStringFromTable(@"MenuAccount", settings.language, @"")])
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"AccountNavigation"];
        else if ([menu.title isEqualToString:NSLocalizedStringFromTable(@"MenuMyProfile", settings.language, @"")])
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MyProfileNavigation"];
        else if ([menu.title isEqualToString:NSLocalizedStringFromTable(@"MenuMyFollows", settings.language, @"")])
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MyFollowsNavigation"];
        else if ([menu.title isEqualToString:NSLocalizedStringFromTable(@"MenuMyPlannings", settings.language, @"")])
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MyPlanningsNavigation"];
        else if ([menu.title isEqualToString:NSLocalizedStringFromTable(@"MenuMyMessages", settings.language, @"")])
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MyMessagesNavigation"];
        else if ([menu.title isEqualToString:NSLocalizedStringFromTable(@"MenuMyFriends", settings.language, @"")])
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MyFriendsNavigation"];
        else if ([menu.title isEqualToString:NSLocalizedStringFromTable(@"MenuMyFavorites", settings.language, @"")])
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MyFavoritesNavigation"];
        else if ([menu.title isEqualToString:NSLocalizedStringFromTable(@"MenuLogout", settings.language, @"")]) {
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
        else if ([menu.title isEqualToString:NSLocalizedStringFromTable(@"MenuArticles", settings.language, @"")])
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ArticlesNavigation"];
        else if ([menu.title isEqualToString:NSLocalizedStringFromTable(@"MenuRecipes", settings.language, @"")])
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RecipesNavigation"];
        else if ([menu.title isEqualToString:NSLocalizedStringFromTable(@"MenuTools", settings.language, @"")])
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ToolsNavigation"];
        else if ([menu.title isEqualToString:NSLocalizedStringFromTable(@"MenuForum", settings.language, @"")])
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ForumNavigation"];
        else if ([menu.title isEqualToString:NSLocalizedStringFromTable(@"MenuSettings", settings.language, @"")])
            self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingsNavigation"];
        
        [self.slidingViewController resetTopViewAnimated:YES];
    }
}

@end
