//
//  ProfileViewController.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/23/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "ProfileViewController.h"
#import "MEDynamicTransition.h"
#import "UIViewController+ECSlidingViewController.h"
#import "UserData.h"
#import "Settings.h"

@interface ProfileViewController ()

@property (nonatomic, strong) UIPanGestureRecognizer*   dynamicTransitionPanGesture;

@end

@implementation ProfileViewController

@synthesize viewTitle = _viewTitle;
@synthesize profilePictureFB = _profilePictureFB;
@synthesize profilePicture = _profilePicture;
@synthesize username = _username;

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UserData* data = [UserData getInstance];
    
    // Initialisation des données selon le type de compte
    if (data.accountType == FACEBOOK) {
        _profilePictureFB.profileID = data.profilePictureFB.profileID;
        _profilePictureFB.hidden = FALSE;
        _profilePictureFB.opaque = TRUE;
        _username.text = [NSString stringWithFormat:@"%@ %@", data.firstName, data.lastName];
    }
    else if (data.accountType == GOOGLE) {
        [_profilePicture setImage:data.profilePicture.image];
        _profilePicture.hidden = FALSE;
        _profilePicture.opaque = TRUE;
        _username.text = [NSString stringWithFormat:@"%@ %@", data.firstName, data.lastName];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    
    Settings*   settings = [Settings getInstance];
    
    // Initialisation du texte dans la langue paramétrée
    [_viewTitle setText:NSLocalizedStringFromTable(@"ProfileViewTitle", settings.language, @"")];
    
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

@end
