//
//  ConnectionViewController.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "ConnectionViewController.h"
#import "MEDynamicTransition.h"
#import "UIViewController+ECSlidingViewController.h"
#import "AppDelegate.h"
#import "WebServices.h"
#import "Dialog.h"
#import "UserData.h"
#import "Settings.h"

@interface ConnectionViewController ()

@property (nonatomic, strong) UIPanGestureRecognizer*   dynamicTransitionPanGesture;

@end

@implementation ConnectionViewController

@synthesize viewTitle = _viewTitle;
@synthesize usernameLabel = _usernameLabel;
@synthesize usernameInput = _usernameInput;
@synthesize passwordLabel = _passwordLabel;
@synthesize passwordInput = _passwordInput;
@synthesize rememberMeSwitch = _rememberMeSwitch;
@synthesize rememberMeLabel = _rememberMeLabel;
@synthesize connectButton = _connectButton;
@synthesize facebookButton = _facebookButton;
@synthesize twitterButton = _twitterButton;
@synthesize googleButton = _googleButton;
@synthesize registerButton = _registerButton;
@synthesize forgotPasswordButton = _forgotPasswordButton;

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    Settings*   settings = [Settings getInstance];
    
    // Initialisation du texte dans la langue paramétrée
    [_viewTitle setText:NSLocalizedStringFromTable(@"ConnectionViewTitle", settings.language, @"")];
    [_usernameLabel setText:NSLocalizedStringFromTable(@"ConnectionUsernameLabel", settings.language, @"")];
    [_passwordLabel setText:NSLocalizedStringFromTable(@"ConnectionPasswordLabel", settings.language, @"")];
    [_rememberMeLabel setText:NSLocalizedStringFromTable(@"ConnectionRememberMeLabel", settings.language, @"")];
    [_connectButton setTitle:NSLocalizedStringFromTable(@"ConnectionConnectButtonLabel", settings.language, @"") forState:UIControlStateNormal];
    [_connectButton setTitle:NSLocalizedStringFromTable(@"ConnectionConnectButtonLabel", settings.language, @"") forState:UIControlStateNormal];
    [_connectButton setTitle:NSLocalizedStringFromTable(@"ConnectionConnectButtonLabel", settings.language, @"") forState:UIControlStateNormal];
    [_facebookButton setTitle:NSLocalizedStringFromTable(@"ConnectionFacebookButtonLabel", settings.language, @"") forState:UIControlStateNormal];
    [_twitterButton setTitle:NSLocalizedStringFromTable(@"ConnectionTwitterButtonLabel", settings.language, @"") forState:UIControlStateNormal];
    [_googleButton setTitle:NSLocalizedStringFromTable(@"ConnectionGoogleButtonLabel", settings.language, @"") forState:UIControlStateNormal];
    [_registerButton setTitle:NSLocalizedStringFromTable(@"ConnectionRegisterButtonLabel", settings.language, @"") forState:UIControlStateNormal];
    [_forgotPasswordButton setTitle:NSLocalizedStringFromTable(@"ConnectionForgotPasswordButtonLabel", settings.language, @"") forState:UIControlStateNormal];
    
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

- (BOOL)checkUsername :(NSString*)username {
    return TRUE;
}

- (BOOL)checkPassword :(NSString*)password {
    return TRUE;
}

#pragma mark - IBActions

- (IBAction)menuButtonTapped:(id)sender {
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}

- (IBAction)connectButtonTapped:(id)sender {
    // Si l'username et le password est valide
    if ([self checkUsername:_usernameInput.text.lowercaseString] && [self checkPassword:_passwordInput.text.lowercaseString]) {
        // On lance le webservice de connexion et on récupère la réponse du serveur
        WebServices *wbs = [[WebServices alloc] init];
        BOOL connected = [wbs WBSConnection:_usernameInput.text.lowercaseString withPassWord:_passwordInput.text];
    
        // Si la connexion a reussi
        if (connected) {
            // On stocke les informations de l'utilisateur
            UserData*   userData = [UserData getInstance];
            
            userData.connected = TRUE;
            userData.accountType = EQUILIBRA;
            userData.username = _usernameInput.text;
            // On affiche un dialogue
            [Dialog informDialog:@"Connection" :[NSString stringWithFormat:@"You are connected as %@!", userData.username] :nil];
            // On redirige l'utilisateur sur la page d'accueil
            [self performSegueWithIdentifier:@"toHome" sender:self];
        }
        // Si la connexion a échouée, on affiche un dialogue
        else
            [Dialog informDialog:@"Connection" :@"Bad credentials..." :nil];
    }
}

- (IBAction)facebookButtonTapped:(id)sender {
    // Si la session Facebook est déja ouverte, on l'a ferme
    if (FBSession.activeSession.state == FBSessionStateOpen || FBSession.activeSession.state == FBSessionStateOpenTokenExtended)
        [FBSession.activeSession closeAndClearTokenInformation];
    // Sinon on en ouvre une avec les permissions basiques
    else {
        [FBSession openActiveSessionWithReadPermissions:@[@"basic_info", @"email", @"user_birthday"] allowLoginUI:YES
                                      completionHandler:^(FBSession *session, FBSessionState state, NSError *error) {
             AppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
             [appDelegate sessionStateChanged:session state:state error:error];
         }];
    }
    // Puis on redirige l'utilisateur sur la page d'accueil
    [self performSegueWithIdentifier:@"toHome" sender:self];
}

- (IBAction)twitterButtonTapped:(id)sender {
    
}

- (IBAction)googleButtonTapped:(id)sender {
    
}

@end