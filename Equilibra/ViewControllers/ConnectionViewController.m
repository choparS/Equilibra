//
//  ConnectionViewController.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "ConnectionViewController.h"
#import "MEDynamicTransition.h"
#import "UIViewController+ECSlidingViewController.h"
#import "AppDelegate.h"
#import "WebServices.h"
#import "Dialog.h"

@interface ConnectionViewController ()

@property (nonatomic, strong) UIPanGestureRecognizer*   dynamicTransitionPanGesture;

@end

@implementation ConnectionViewController

@synthesize username = _username;
@synthesize password = _password;
@synthesize rememberMe = _rememberMe;

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
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

#pragma mark - UITextFieldDelegate

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - IBActions

- (IBAction)menuButtonTapped:(id)sender {
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}

- (IBAction)connectButtonTapped:(id)sender {
    WebServices *wbs = [[WebServices alloc] init];
    BOOL connected = [wbs WBSConnection:_username.text.lowercaseString withPassWord:_password.text];
    
    if (connected)
        [Dialog informDialog:@"Connection" :@"You are connected!" :nil];
    else
        [Dialog informDialog:@"Connection" :@"Bad credentials..." :nil];
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

- (IBAction)twitterButtonTapped:(id)sender {
    
}

- (IBAction)googleButtonTapped:(id)sender {
    
}

@end