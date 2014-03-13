//
//  AccountViewController.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/23/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "AccountViewController.h"
#import "MEDynamicTransition.h"
#import "UIViewController+ECSlidingViewController.h"
#import "GooglePlus/GooglePlus.h"
#import "AppDelegate.h"
#import "UserData.h"
#import "Settings.h"

@interface AccountViewController ()

@property (nonatomic, strong) UIPanGestureRecognizer*   dynamicTransitionPanGesture;

@end

@implementation AccountViewController

@synthesize viewTitle = _viewTitle;
@synthesize myProfileButton = _myProfileButton;
@synthesize myFollowsButton = _myFollowsButton;
@synthesize myPlanningsButton = _myPlanningsButton;
@synthesize myMessagesButton = _myMessagesButton;
@synthesize myFriendsButton = _myFriendsButton;
@synthesize myFavoritesButton = _myFavoritesButton;
@synthesize logoutButton = _logoutButton;

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    Settings*   settings = [Settings getInstance];
    
    // Initialisation du texte dans la langue paramétrée
    [_viewTitle setText:NSLocalizedStringFromTable(@"AccountViewTitle", settings.language, @"")];
    [_myProfileButton setTitle:NSLocalizedStringFromTable(@"AccountMyProfileButtonLabel", settings.language, @"") forState:UIControlStateNormal];
    [_myFollowsButton setTitle:NSLocalizedStringFromTable(@"AccountMyFollowsButtonLabel", settings.language, @"") forState:UIControlStateNormal];
    [_myPlanningsButton setTitle:NSLocalizedStringFromTable(@"AccountMyPlanningsButtonLabel", settings.language, @"") forState:UIControlStateNormal];
    [_myMessagesButton setTitle:NSLocalizedStringFromTable(@"AccountMyMessagesButtonLabel", settings.language, @"") forState:UIControlStateNormal];
    [_myFriendsButton setTitle:NSLocalizedStringFromTable(@"AccountMyFriendsButtonLabel", settings.language, @"") forState:UIControlStateNormal];
    [_myFavoritesButton setTitle:NSLocalizedStringFromTable(@"AccountMyFavoritesButtonLabel", settings.language, @"") forState:UIControlStateNormal];
    [_logoutButton setTitle:NSLocalizedStringFromTable(@"AccountLogoutButtonLabel", settings.language, @"") forState:UIControlStateNormal];
    
    if ([(NSObject *)self.slidingViewController.delegate isKindOfClass:[MEDynamicTransition class]]) {
        MEDynamicTransition *dynamicTransition = (MEDynamicTransition *)self.slidingViewController.delegate;
        if (!self.dynamicTransitionPanGesture)
            self.dynamicTransitionPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:dynamicTransition action:@selector(handlePanGesture:)];
        
        [self.navigationController.view removeGestureRecognizer:self.slidingViewController.panGesture];
        [self.navigationController.view addGestureRecognizer:self.dynamicTransitionPanGesture];
    }
    else {
        [self.navigationController.view removeGestureRecognizer:self.dynamicTransitionPanGesture];
        [self.navigationController.view addGestureRecognizer:self.slidingViewController.panGesture];
    }
}

#pragma mark - IBActions

- (IBAction)menuButtonTapped:(id)sender {
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}

- (IBAction)LogoutButtonTapped:(id)sender {
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
    else if ([UserData getInstance].accountType == GOOGLE) {
        [[GPPSignIn sharedInstance] signOut];
        if (![[GPPSignIn sharedInstance] authentication]) {
            NSLog(@"Session Google closed");
            UserData*   userData = [UserData getInstance];
            
            userData.connected = FALSE;
            userData.accountType = EQUILIBRA;
        }
    }
    [self performSegueWithIdentifier:@"toHome" sender:self];
}

@end
