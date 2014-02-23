//
//  Dialog.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/23/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "Dialog.h"

@implementation Dialog

+(void)informDialog:(NSString*)title :(NSString*)message :(id)view {
    [[[UIAlertView alloc] initWithTitle:title message:message delegate:view cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}

+(void)confirmDialog:(NSString*)title :(NSString*)message :(id)view {
    UIAlertView *alert = [[UIAlertView alloc] init];
    
    [alert setTitle:title];
    [alert setMessage:message];
    [alert setDelegate:view];
    [alert addButtonWithTitle:@"Yes"];
    [alert addButtonWithTitle:@"No"];
    [alert show];
}

@end
