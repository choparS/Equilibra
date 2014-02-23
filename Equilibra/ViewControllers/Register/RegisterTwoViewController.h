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

@property (strong, nonatomic) IBOutlet UITextField*         firstName;
@property (strong, nonatomic) IBOutlet UITextField*         lastName;
@property (strong, nonatomic) IBOutlet UITextField*         dateOfBirth;
@property (strong, nonatomic) IBOutlet UISegmentedControl*  gender;
@property (strong, nonatomic) IBOutlet UITextField*         weight;
@property (strong, nonatomic) IBOutlet UITextField*         height;
@property (strong, nonatomic) IBOutlet UITextField*         zipCode;

- (IBAction)checkInformation:(id)sender;
@end
