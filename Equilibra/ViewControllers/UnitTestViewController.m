//
//  UnitTestViewController.m
//  Equilibra
//
//  Created by Brice LE BAIL on 14/03/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//


#import "UnitTestViewController.h"
#import "MEDynamicTransition.h"
#import "UIViewController+ECSlidingViewController.h"
#import "Settings.h"
#import "UnitTest.h"

@interface UnitTestViewController ()

@property (nonatomic, strong) UIPanGestureRecognizer*   dynamicTransitionPanGesture;

@end

@implementation UnitTestViewController

@synthesize viewTitle = _viewTitle;

#pragma mark - UIViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    Settings*   settings = [Settings getInstance];
    
    // Initialisation du texte dans la langue paramétrée
    [_viewTitle setText:NSLocalizedStringFromTable(@"UnitTestViewTitle", settings.language, @"")];
    
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

#pragma mark - IBActions

- (IBAction)menuButtonTapped:(id)sender {
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}

- (IBAction)testConnexionTapped:(id)sender {
    
    UnitTest    *test= [[UnitTest alloc] init];

    [test testConnexion];
    NSLog(@"%@", [test valueForKey:@"unitTestResult"]);
    // Test si la WSconnexion est True
    if ([[[test valueForKey:@"unitTestResult"] valueForKey:@"WSConnexion"] boolValue] == true) {
        
        self.testServerConnexionLabelResult.text = @"Ok";
        self.testServerConnexionLabelResult.textColor = [UIColor greenColor];
    } else {
        
        self.testServerConnexionLabelResult.text = @"Ko";
        self.testServerConnexionLabelResult.textColor = [UIColor redColor];
    }

    // Test si Register est True
    if ([[[test valueForKey:@"unitTestResult"] valueForKey:@"Inscription"] boolValue] == true) {
        
        self.testInscriptionLabelResult.text = @"Ok";
        self.testInscriptionLabelResult.textColor = [UIColor greenColor];
    } else {
        
        self.testInscriptionLabelResult.text = @"Ko";
        self.testInscriptionLabelResult.textColor = [UIColor redColor];
    }
    // Test si Register EmailError est True
    if ([[[test valueForKey:@"unitTestResult"] valueForKey:@"InscriptionEmailError"] boolValue] == true) {
        
        self.testInscriptionEmailErrorConnexionLabelResult.text = @"Ok";
        self.testInscriptionEmailErrorConnexionLabelResult.textColor = [UIColor greenColor];
    } else {
        
        self.testInscriptionEmailErrorConnexionLabelResult.text = @"Ko";
        self.testInscriptionEmailErrorConnexionLabelResult.textColor = [UIColor redColor];
    }

    // Test si Register UsernameError est True
    if ([[[test valueForKey:@"unitTestResult"] valueForKey:@"InscriptionUsernameError"] boolValue] == true) {
        
        self.testInscriptionUsernameErrorLabelResult.text = @"Ok";
        self.testInscriptionUsernameErrorLabelResult.textColor = [UIColor greenColor];
    } else {
        
        self.testInscriptionUsernameErrorLabelResult.text = @"Ko";
        self.testInscriptionUsernameErrorLabelResult.textColor = [UIColor redColor];
    }
    // Test si Connexion est True
    if ([[[test valueForKey:@"unitTestResult"] valueForKey:@"Connexion"] boolValue] == true) {
        
        self.testConnexionLabelResult.text = @"Ok";
        self.testConnexionLabelResult.textColor = [UIColor greenColor];
    } else {
        
        self.testConnexionLabelResult.text = @"Ko";
        self.testConnexionLabelResult.textColor = [UIColor redColor];
    }

}
@end
