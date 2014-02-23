//
//  ProfileViewController.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/23/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "ProfileViewController.h"
#import "UserData.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

@synthesize profilePictureFB = _profilePictureFB;
@synthesize username = _username;

- (void)viewDidLoad {
    [super viewDidLoad];

    UserData* data = [UserData getInstance];
    
    if (data.accountType == FACEBOOK) {
        _profilePictureFB.profileID = data.profilePictureFB.profileID;
        _profilePictureFB.hidden = FALSE;
        _profilePictureFB.opaque = TRUE;
        _username.text = [NSString stringWithFormat:@"%@ %@", data.firstName, data.lastName];
    }
    else {
        
    }
}

@end
