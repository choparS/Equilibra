//
//  RegisterTwoViewController.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataRegister.h"

@interface RegisterTwoViewController : UIViewController

@property (strong, nonatomic) DataRegister*                 data;

@property (strong, nonatomic) IBOutlet UILabel *viewTitle;

@property (strong, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (strong, nonatomic) IBOutlet UITextField *firstNameInput;

@property (strong, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (strong, nonatomic) IBOutlet UITextField *lastNameInput;

@property (strong, nonatomic) IBOutlet UILabel *dateOfBirthLabel;
@property (strong, nonatomic) IBOutlet UITextField *dateOfBirthInput;

@property (strong, nonatomic) IBOutlet UILabel *genderLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *genderControl;

@property (strong, nonatomic) IBOutlet UILabel *weightLabel;
@property (strong, nonatomic) IBOutlet UITextField *weightInput;

@property (strong, nonatomic) IBOutlet UILabel *heightLabel;
@property (strong, nonatomic) IBOutlet UITextField *heightInput;

@property (strong, nonatomic) IBOutlet UILabel *zipCodeLabel;
@property (strong, nonatomic) IBOutlet UITextField *zipCodeInput;

@property (strong, nonatomic) IBOutlet UIButton *submitButton;

- (IBAction)checkInformation:(id)sender;
@end
