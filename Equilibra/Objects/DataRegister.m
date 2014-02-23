//
//  DataRegister.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/23/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "DataRegister.h"

@implementation DataRegister

@synthesize pseudo = _pseudo;
@synthesize email = _email;
@synthesize password = _password;
@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize birthday = _birthday;
@synthesize gender = _gender;
@synthesize weight = _weight;
@synthesize height = _height;
@synthesize zipCode = _zipCode;
@synthesize goal = _goal;
@synthesize newsletter = _newsletter;

+(DataRegister*)initialize {
    DataRegister*   data = [DataRegister new];
    data.pseudo = @"";
    data.email = @"";
    data.password = @"";
    data.firstName = @"";
    data.lastName = @"";
    data.birthday = @"";
    data.gender = 0;
    data.weight = @"";
    data.height = @"";
    data.zipCode = @"";
    data.goal = @"";
    data.newsletter = FALSE;
    return data;
}

@end
