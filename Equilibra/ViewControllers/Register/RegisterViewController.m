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
#import "Settings.h"

@interface RegisterViewController ()

@property (nonatomic, strong) UIPanGestureRecognizer*   dynamicTransitionPanGesture;

@end

@implementation RegisterViewController

@synthesize data = _data;
@synthesize viewTitle = _viewTitle;
@synthesize pseudoLabel = _pseudoLabel;
@synthesize pseudoInput = _pseudoInput;
@synthesize emailLabel = _emailLabel;
@synthesize emailInput = _emailInput;
@synthesize passwordLabel = _passwordLabel;
@synthesize passwordInput = _passwordInput;
@synthesize confirmPasswordLabel = _confirmPasswordLabel;
@synthesize confirmPasswordInput = _confirmPasswordInput;
@synthesize submitButton = _submitButton;
@synthesize requiredFieldsLabel = _requiredFieldsLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Creation des données d'inscription
    if (!_data)
        _data = [DataRegister initialize];
    
    // Récupération des données d'inscription
    [_pseudoInput setText:_data.pseudo];
    [_emailInput setText:_data.email];
    [_passwordInput setText:_data.password];
    [_confirmPasswordInput setText:_data.password];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    Settings*   settings = [Settings getInstance];
    
    // Initialisation du texte dans la langue paramétrée
    [_viewTitle setText:NSLocalizedStringFromTable(@"RegisterViewTitle", settings.language, @"")];
    [_pseudoLabel setText:NSLocalizedStringFromTable(@"RegisterPseudoLabel", settings.language, @"")];
    [_emailLabel setText:NSLocalizedStringFromTable(@"RegisterEmailLabel", settings.language, @"")];
    [_passwordLabel setText:NSLocalizedStringFromTable(@"RegisterPasswordLabel", settings.language, @"")];
    [_confirmPasswordLabel setText:NSLocalizedStringFromTable(@"RegisterConfirmPasswordLabel", settings.language, @"")];
    [_submitButton setTitle:NSLocalizedStringFromTable(@"RegisterSubmitButtonLabel", settings.language, @"") forState:UIControlStateNormal];
    [_requiredFieldsLabel setText:NSLocalizedStringFromTable(@"RegisterRequiredFieldsLabel", settings.language, @"")];
    
    // Initialisation de la transition et du contrôle gestuel permettant d'ouvrir le menu en glissant le doigt de gauche à droite
    if ([(NSObject *)self.slidingViewController.delegate isKindOfClass:[MEDynamicTransition class]]) {
        MEDynamicTransition *dynamicTransition = (MEDynamicTransition *)self.slidingViewController.delegate;
        if (!self.dynamicTransitionPanGesture)
            self.dynamicTransitionPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:dynamicTransition action:@selector(handlePanGesture:)];
        
        [self.navigationController.view removeGestureRecognizer:self.slidingViewController.panGesture];
        [self.navigationController.view addGestureRecognizer:self.dynamicTransitionPanGesture];
    }
    else {
        [self.navigationController.view removeGestureRecognizer:self.dynamicTransitionPanGesture];
        [self.navigationController.view addGestureRecognizer:self.slidingViewController.panGesture];
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Transfert des données d'inscription à l'étape suivante
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

- (IBAction)menuButtonTapped:(id)sender {
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}

-(IBAction)checkInformation:(id)sender {
    BOOL error = FALSE;
    
    // Vérification des champs fourni par l'utilisateur
    if (![self checkPseudo:_pseudoInput.text]) {
        _pseudoInput.backgroundColor = [UIColor redColor];
        error = TRUE;
    }
    
    if (![self checkEmail:_emailInput.text]) {
        _emailInput.backgroundColor = [UIColor redColor];
        error = TRUE;
    }
    
    if (![self checkPassword:_passwordInput.text]) {
        _passwordInput.backgroundColor = [UIColor redColor];
        error = TRUE;
    }

    if (![_confirmPasswordInput.text isEqualToString:_passwordInput.text]) {
        _confirmPasswordInput.backgroundColor = [UIColor redColor];
        error = TRUE;
    }
    
    // Si il n'y a aucune erreur, on met à jour les données d'inscription puis on redirige l'utilisateur vers l'étape suivante
    if (!error) {
        _data.pseudo = _pseudoInput.text;
        _data.email = _emailInput.text;
        _data.password = _passwordInput.text;
        [self performSegueWithIdentifier:@"toRegisterTwo" sender:self];
    }
}

@end
