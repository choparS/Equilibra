//
//  AccountViewController.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/23/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FacebookSDK/FBProfilePictureView.h"

@interface AccountViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *viewTitle;

@property (strong, nonatomic) IBOutlet UIButton *myProfileButton;
@property (strong, nonatomic) IBOutlet UIButton *myFollowsButton;
@property (strong, nonatomic) IBOutlet UIButton *myPlanningsButton;
@property (strong, nonatomic) IBOutlet UIButton *myMessagesButton;
@property (strong, nonatomic) IBOutlet UIButton *myFriendsButton;
@property (strong, nonatomic) IBOutlet UIButton *myFavoritesButton;
@property (strong, nonatomic) IBOutlet UIButton *logoutButton;

- (IBAction)menuButtonTapped:(id)sender;
- (IBAction)LogoutButtonTapped:(id)sender;

@end
