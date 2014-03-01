//
//  RegisterViewController.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataRegister.h"

@interface RegisterViewController : UIViewController

@property (strong, nonatomic) DataRegister*         data;

@property (strong, nonatomic) IBOutlet UILabel*     viewTitle;

@property (strong, nonatomic) IBOutlet UILabel*     pseudoLabel;
@property (strong, nonatomic) IBOutlet UITextField* pseudoInput;

@property (strong, nonatomic) IBOutlet UILabel*     emailLabel;
@property (strong, nonatomic) IBOutlet UITextField* emailInput;

@property (strong, nonatomic) IBOutlet UILabel*     passwordLabel;
@property (strong, nonatomic) IBOutlet UITextField* passwordInput;

@property (strong, nonatomic) IBOutlet UILabel*     confirmPasswordLabel;
@property (strong, nonatomic) IBOutlet UITextField* confirmPasswordInput;

@property (strong, nonatomic) IBOutlet UIButton*    submitButton;
@property (strong, nonatomic) IBOutlet UILabel*     requiredFieldsLabel;

- (IBAction)menuButtonTapped:(id)sender;
- (IBAction)checkInformation:(id)sender;

@end
