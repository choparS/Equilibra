//
//  UserData.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/22/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "UserData.h"

@implementation UserData

@synthesize connected = _connected;

@synthesize accountType = _accountType;
@synthesize username = _username;
@synthesize email = _email;
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize birthday = _birthday;
@synthesize gender = _gender;
@synthesize weight = _weight;
@synthesize height = _height;
@synthesize city = _city;
@synthesize zipCode = _zipCode;
@synthesize goal = _goal;
@synthesize newsletter = _newsletter;

@synthesize profilePicture = _profilePicture;
@synthesize profilePictureFB = _profilePictureFB;

static UserData *instance = nil;

+(UserData*)getInstance {
    @synchronized(self) {
        if (instance == nil) {
            instance = [UserData new];
            instance.connected = FALSE;
            instance.accountType = EQUILIBRA;
            instance.username = @"";
            instance.email = @"";
            instance.firstName = @"";
            instance.lastName = @"";
            instance.birthday = @"";
            instance.gender = @"";
            instance.weight = @"";
            instance.height = @"";
            instance.city = @"";
            instance.zipCode = @"";
            instance.goal = @"";
            instance.newsletter = FALSE;
            instance.profilePicture = nil;
            instance.profilePictureFB = nil;
        }
    }
    return instance;
}

@end
