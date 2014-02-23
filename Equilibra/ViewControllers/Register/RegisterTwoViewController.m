//
//  RegisterTwoViewController.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "RegisterTwoViewController.h"
#import "RegisterViewController.h"
#import "RegisterThreeViewController.h"

@interface RegisterTwoViewController ()

@end

@implementation RegisterTwoViewController

@synthesize data = _data;

@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize dateOfBirth = _dateOfBirth;
@synthesize gender = _gender;
@synthesize weight = _weight;
@synthesize height = _height;
@synthesize zipCode = _zipCode;

- (void)viewDidLoad {
    [super viewDidLoad];

    [_firstName setText:_data.firstName];
    [_lastName setText:_data.lastName];
    [_dateOfBirth setText:_data.birthday];
    [_gender setSelectedSegmentIndex:_data.gender];
    [_weight setText:_data.weight];
    [_height setText:_data.height];
    [_zipCode setText:_data.zipCode];
}

#pragma mark - UITextFieldDelegate

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"toRegister"]) {
        RegisterViewController *registerOne = [segue destinationViewController];
        registerOne.data = _data;
    }
    else if ([[segue identifier] isEqualToString:@"toRegisterThree"]) {
        RegisterThreeViewController *registerThree = [segue destinationViewController];
        registerThree.data = _data;
    }
}

- (BOOL)checkFirstName:(NSString*)firstName {
    return TRUE;
}

- (BOOL)checkLastName:(NSString*)lastName {
    return TRUE;
}

- (BOOL)checkDateOfBirth:(NSString*)dateOfBirth {
    return TRUE;
}

- (BOOL)checkWeight:(NSString*)weight {
    return TRUE;
}

- (BOOL)checkHeight:(NSString*)height {
    return TRUE;
}

- (BOOL)checkZipCode:(NSString*)zipCode {
    return TRUE;
}

- (IBAction)checkInformation:(id)sender {
    BOOL error = FALSE;
    
    if (![self checkFirstName:_firstName.text]) {
        _firstName.backgroundColor = [UIColor redColor];
        error = TRUE;
    }
    
    if (![self checkLastName:_lastName.text]) {
        _lastName.backgroundColor = [UIColor redColor];
        error = TRUE;
    }
    
    if (![self checkDateOfBirth:_dateOfBirth.text]) {
        _dateOfBirth.backgroundColor = [UIColor redColor];
        error = TRUE;
    }
    
    if (![self checkWeight:_weight.text]) {
        _weight.backgroundColor = [UIColor redColor];
        error = TRUE;
    }
    
    if (![self checkHeight:_height.text]) {
        _height.backgroundColor = [UIColor redColor];
        error = TRUE;
    }
    
    if (![self checkZipCode:_zipCode.text]) {
        _zipCode.backgroundColor = [UIColor redColor];
        error = TRUE;
    }

    if (!error) {
        _data.firstName = _firstName.text;
        _data.lastName = _lastName.text;
        _data.birthday = _dateOfBirth.text;
        _data.gender = _gender.selectedSegmentIndex;
        _data.weight = _weight.text;
        _data.height = _height.text;
        _data.zipCode = _zipCode.text;
        [self performSegueWithIdentifier:@"toRegisterThree" sender:self];
    }
}

@end
