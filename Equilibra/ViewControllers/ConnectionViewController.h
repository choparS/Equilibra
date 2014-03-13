//
//  ConnectionViewController.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GooglePlus/GooglePlus.h"

@interface ConnectionViewController : UIViewController <GPPSignInDelegate>

@property (strong, nonatomic) IBOutlet UILabel *viewTitle;

@property (strong, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) IBOutlet UITextField *usernameInput;

@property (strong, nonatomic) IBOutlet UILabel *passwordLabel;
@property (strong, nonatomic) IBOutlet UITextField *passwordInput;

@property (strong, nonatomic) IBOutlet UISwitch *rememberMeSwitch;
@property (strong, nonatomic) IBOutlet UILabel *rememberMeLabel;

@property (strong, nonatomic) IBOutlet UIButton *connectButton;
@property (strong, nonatomic) IBOutlet UIButton *facebookButton;
@property (strong, nonatomic) IBOutlet UIButton *twitterButton;
@property (strong, nonatomic) IBOutlet UIButton *googleButton;
@property (strong, nonatomic) IBOutlet GPPSignInButton *googleSignInButton;
@property (strong, nonatomic) IBOutlet UIButton *registerButton;
@property (strong, nonatomic) IBOutlet UIButton *forgotPasswordButton;

- (IBAction)menuButtonTapped:(id)sender;
- (IBAction)connectButtonTapped:(id)sender;
- (IBAction)facebookButtonTapped:(id)sender;
- (IBAction)twitterButtonTapped:(id)sender;
- (IBAction)googleButtonTapped:(id)sender;

@end
