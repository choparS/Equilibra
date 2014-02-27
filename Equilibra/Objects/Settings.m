//
//  Settings.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/20/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "Settings.h"

@implementation Settings

@synthesize transitions = _transitions;
@synthesize transitionsIndex = _transitionsIndex;
@synthesize language = _language;

static Settings *instance = nil;

+(Settings*)getInstance {
    @synchronized(self) {
        if (instance == nil) {
            instance = [Settings new];
            instance.transitions = [[Transitions alloc] init];
            instance.transitionsIndex = 0;
            instance.language = @"FR";
        }
    }
    return instance;
}

@end