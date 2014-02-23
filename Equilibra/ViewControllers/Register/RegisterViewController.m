//
//  RegisterViewController.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "RegisterViewController.h"
#import "UIViewController+ECSlidingViewController.h"
#import "MEDynamicTransition.h"
#import "RegisterTwoViewController.h"
#import "WebServices.h"
#import "Dialog.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize data = _data;

@synthesize pseudo = _pseudo;
@synthesize email = _email;
@synthesize password = _password;
@synthesize confirmPassword = _confirmPassword;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!_data)
        _data = [DataRegister initialize];
    
    [_pseudo setText:_data.pseudo];
    [_email setText:_data.email];
    [_password setText:_data.password];
    [_confirmPassword setText:_data.password];
}

#pragma mark - UITextFieldDelegate

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"toRegisterTwo"]) {
        RegisterTwoViewController *registerTwo = [segue destinationViewController];
        registerTwo.data = _data;
    }
}

- (BOOL)checkPseudo:(NSString*)pseudo {
    //WebServices *wbs = [[WebServices alloc] init];
    
    //NSLog(@"Verification pseudo:%hhd", [wbs WBSRegisterVerification:@"username" :pseudo]);
    return TRUE;
}

- (BOOL)checkEmail:(NSString*)email {
    //WebServices *wbs = [[WebServices alloc] init];
    
    //NSLog(@"Verification email:%hhd", [wbs WBSRegisterVerification:@"email" :email]);
    return TRUE;
}

- (BOOL)checkPassword:(NSString*)Password {
    return TRUE;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0)
        [self performSegueWithIdentifier:@"toConnection" sender:self];
}

-(IBAction)toConnection:(id)sender {
    [Dialog confirmDialog:@"Register" :@"Are you sure to cancel your registration?" :self];
}

-(IBAction)checkInformation:(id)sender {
    BOOL error = FALSE;
    
    if (![self checkPseudo:_pseudo.text]) {
        _pseudo.backgroundColor = [UIColor redColor];
        error = TRUE;
    }
    
    if (![self checkEmail:_email.text]) {
        _email.backgroundColor = [UIColor redColor];
        error = TRUE;
    }
    
    if (![self checkPassword:_password.text]) {
        _password.backgroundColor = [UIColor redColor];
        error = TRUE;
    }

    if (![_confirmPassword.text isEqualToString:_password.text]) {
        _confirmPassword.backgroundColor = [UIColor redColor];
        error = TRUE;
    }
    
    if (!error) {
        _data.pseudo = _pseudo.text;
        _data.email = _email.text;
        _data.password = _password.text;
        [self performSegueWithIdentifier:@"toRegisterTwo" sender:self];
    }
}

@end
