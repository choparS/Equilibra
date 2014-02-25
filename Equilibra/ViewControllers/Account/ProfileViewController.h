//
//  ProfileViewController.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/23/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FacebookSDK/FBProfilePictureView.h"

@interface ProfileViewController : UIViewController

@property (strong, nonatomic) IBOutlet FBProfilePictureView *profilePictureFB;
@property (strong, nonatomic) IBOutlet UILabel *username;

- (IBAction)menuButtonTapped:(id)sender;

@end
