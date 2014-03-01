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
#import "Settings.h"

@interface RegisterTwoViewController ()

@end

@implementation RegisterTwoViewController

@synthesize data = _data;
@synthesize viewTitle = _viewTitle;
@synthesize firstNameLabel = _firstNameLabel;
@synthesize firstNameInput = _firstNameInput;
@synthesize lastNameLabel = _lastNameLabel;
@synthesize lastNameInput = _lastNameInput;
@synthesize dateOfBirthLabel = _dateOfBirthLabel;
@synthesize dateOfBirthInput = _dateOfBirthInput;
@synthesize genderLabel = _genderLabel;
@synthesize genderControl = _genderControl;
@synthesize weightLabel = _weightLabel;
@synthesize weightInput = _weightInput;
@synthesize heightLabel = _heightLabel;
@synthesize heightInput = _heightInput;
@synthesize zipCodeLabel = _zipCodeLabel;
@synthesize zipCodeInput = _zipCodeInput;
@synthesize submitButton = _submitButton;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Récupération des données d'inscription
    [_firstNameInput setText:_data.firstName];
    [_lastNameInput setText:_data.lastName];
    [_dateOfBirthInput setText:_data.birthday];
    [_genderControl setSelectedSegmentIndex:_data.gender];
    [_weightInput setText:_data.weight];
    [_heightInput setText:_data.height];
    [_zipCodeInput setText:_data.zipCode];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    Settings*   settings = [Settings getInstance];
    
    // Initialisation du texte dans la langue paramétrée
    [_viewTitle setText:NSLocalizedStringFromTable(@"RegisterViewTitle", settings.language, @"")];
    [_firstNameLabel setText:NSLocalizedStringFromTable(@"RegisterFirstNameLabel", settings.language, @"")];
    [_lastNameLabel setText:NSLocalizedStringFromTable(@"RegisterLastNameLabel", settings.language, @"")];
    [_dateOfBirthLabel setText:NSLocalizedStringFromTable(@"RegisterDateOfBirthLabel", settings.language, @"")];
    [_genderLabel setText:NSLocalizedStringFromTable(@"RegisterGenderLabel", settings.language, @"")];
    [_genderControl setTitle:NSLocalizedStringFromTable(@"RegisterGenderLeftLabel", settings.language, @"") forSegmentAtIndex:0];
    [_genderControl setTitle:NSLocalizedStringFromTable(@"RegisterGenderRightLabel", settings.language, @"") forSegmentAtIndex:1];
    [_weightLabel setText:NSLocalizedStringFromTable(@"RegisterWeightLabel", settings.language, @"")];
    [_heightLabel setText:NSLocalizedStringFromTable(@"RegisterHeightLabel", settings.language, @"")];
    [_zipCodeLabel setText:NSLocalizedStringFromTable(@"RegisterZipCodeLabel", settings.language, @"")];
    [_submitButton setTitle:NSLocalizedStringFromTable(@"RegisterSubmitButtonLabel", settings.language, @"") forState:UIControlStateNormal];
}

#pragma mark - UITextFieldDelegate

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Mise à jour et transfert des données d'inscription vers l'étape précèdente ou suivante
    if ([[segue identifier] isEqualToString:@"toRegister"]) {
        UINavigationController* navigationController = [segue destinationViewController];
        RegisterViewController *registerOne = (RegisterViewController*)navigationController.visibleViewController;
        _data.firstName = _firstNameInput.text;
        _data.lastName = _lastNameInput.text;
        _data.birthday = _dateOfBirthInput.text;
        _data.gender = _genderControl.selectedSegmentIndex;
        _data.weight = _weightInput.text;
        _data.height = _heightInput.text;
        _data.zipCode = _zipCodeInput.text;
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
    
    // Vérification des champs fourni par l'utilisateur
    if (![self checkFirstName:_firstNameInput.text]) {
        _firstNameInput.backgroundColor = [UIColor redColor];
        error = TRUE;
    }
    
    if (![self checkLastName:_lastNameInput.text]) {
        _lastNameInput.backgroundColor = [UIColor redColor];
        error = TRUE;
    }
    
    if (![self checkDateOfBirth:_dateOfBirthInput.text]) {
        _dateOfBirthInput.backgroundColor = [UIColor redColor];
        error = TRUE;
    }
    
    if (![self checkWeight:_weightInput.text]) {
        _weightInput.backgroundColor = [UIColor redColor];
        error = TRUE;
    }
    
    if (![self checkHeight:_heightInput.text]) {
        _heightInput.backgroundColor = [UIColor redColor];
        error = TRUE;
    }
    
    if (![self checkZipCode:_zipCodeInput.text]) {
        _zipCodeInput.backgroundColor = [UIColor redColor];
        error = TRUE;
    }

    // Si il n'y a aucune erreur, on met à jour les données d'inscription puis on redirige l'utilisateur vers l'étape suivante
    if (!error) {
        _data.firstName = _firstNameInput.text;
        _data.lastName = _lastNameInput.text;
        _data.birthday = _dateOfBirthInput.text;
        _data.gender = _genderControl.selectedSegmentIndex;
        _data.weight = _weightInput.text;
        _data.height = _heightInput.text;
        _data.zipCode = _zipCodeInput.text;
        [self performSegueWithIdentifier:@"toRegisterThree" sender:self];
    }
}

@end
