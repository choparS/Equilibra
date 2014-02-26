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

@interface ProfileViewController ()

@property (nonatomic, strong) UIPanGestureRecognizer*   dynamicTransitionPanGesture;

@end

@implementation ProfileViewController

@synthesize profilePictureFB = _profilePictureFB;
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
    else {
        
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
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
