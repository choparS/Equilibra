//
//  MenuFlag.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/27/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "MenuFlag.h"

@implementation MenuFlag

@synthesize title = _title;
@synthesize code = _code;
@synthesize iconName = _iconName;
@synthesize iconType = _iconType;

+ (MenuFlag*)initialize:(NSString *)title :(NSString *)code :(NSString *)iconName :(NSString *)iconType {
    MenuFlag*   flag = [MenuFlag new];
    
    flag.title = title;
    flag.code = code;
    flag.iconName = iconName;
    flag.iconType = iconType;
    return flag;
}

@end
