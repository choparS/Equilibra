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

@property (strong, nonatomic) IBOutlet UITextField* pseudo;
@property (strong, nonatomic) IBOutlet UITextField* email;
@property (strong, nonatomic) IBOutlet UITextField* password;
@property (strong, nonatomic) IBOutlet UITextField* confirmPassword;

- (IBAction)menuButtonTapped:(id)sender;
- (IBAction)checkInformation:(id)sender;

@end
