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

@property (strong, nonatomic) IBOutlet UISwitch*    newsletter;
@property (strong, nonatomic) IBOutlet UISwitch*    termsOfUse;

- (IBAction)registerMe:(id)sender;

@end
