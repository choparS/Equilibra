//
//  Settings.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/20/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Transitions.h"

@interface Settings : NSObject {

    Transitions*    transitions;
    NSInteger*      transitionIndex;

}

@property (nonatomic, strong) Transitions*  transitions;
@property NSInteger*                        transitionsIndex;

+(Settings*)getInstance;

@end