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
#import "UserData.h"
#import "AppDelegate.h"

@interface AccountViewController ()

@property (nonatomic, strong) UIPanGestureRecognizer*   dynamicTransitionPanGesture;

@end

@implementation AccountViewController

@synthesize profilePicture = _profilePicture;
@synthesize profilePictureFB = _profilePictureFB;
@synthesize username = _username;

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UserData* data = [UserData getInstance];
    
    if (data.accountType == FACEBOOK) {
        _profilePictureFB.profileID = data.profilePictureFB.profileID;
        _profilePictureFB.hidden = FALSE;
        _profilePictureFB.opaque = TRUE;
        _username.text = [NSString stringWithFormat:@"%@ %@", data.firstName, data.lastName];
    }
    else {
        
    }
    
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

- (IBAction)facebookButtonTapped:(id)sender {
    if (FBSession.activeSession.state == FBSessionStateOpen || FBSession.activeSession.state == FBSessionStateOpenTokenExtended)
        [FBSession.activeSession closeAndClearTokenInformation];
    else {
        [FBSession openActiveSessionWithReadPermissions:@[@"basic_info", @"email", @"user_birthday"] allowLoginUI:YES
                                      completionHandler:^(FBSession *session, FBSessionState state, NSError *error) {
                                          AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
                                          [appDelegate sessionStateChanged:session state:state error:error];
                                      }];
    }
    [self performSegueWithIdentifier:@"toHome" sender:self];
}

@end
