//
//  ConnectionViewController.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConnectionViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UISwitch *rememberMe;

- (IBAction)menuButtonTapped:(id)sender;
- (IBAction)connectButtonTapped:(id)sender;
- (IBAction)facebookButtonTapped:(id)sender;
- (IBAction)twitterButtonTapped:(id)sender;
- (IBAction)googleButtonTapped:(id)sender;

@end
