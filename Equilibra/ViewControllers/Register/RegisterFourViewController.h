//
//  RegisterFourViewController.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataRegister.h"

@interface RegisterFourViewController : UIViewController

@property (strong, nonatomic) DataRegister*         data;

@property (strong, nonatomic) IBOutlet UILabel *viewTitle;

@property (strong, nonatomic) IBOutlet UISwitch *newsletterSwitch;
@property (strong, nonatomic) IBOutlet UILabel *newsletterLabel;

@property (strong, nonatomic) IBOutlet UISwitch *termsOfUseSwitch;
@property (strong, nonatomic) IBOutlet UILabel *termsOfUseLabel;

@property (strong, nonatomic) IBOutlet UIButton *registerButton;
@property (strong, nonatomic) IBOutlet UILabel *requiredFieldsLabel;


- (IBAction)registerMe:(id)sender;

@end
