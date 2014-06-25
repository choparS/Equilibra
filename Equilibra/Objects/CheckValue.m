//
//  CheckValue.m
//  Equilibra
//
//  Created by Brice LE BAIL on 24/05/2014.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "CheckValue.h"

@implementation CheckValue

- (id)init {
    
    return [self initializer];
}

- (id)initializer {
    
    error = [[NSMutableDictionary alloc] init];
    return self;
}

-(NSString*)createMsgError:(NSArray*)values {
    
    NSMutableString    *msgError = [NSMutableString string];
    
    for (id object in values)
    {
        [msgError appendFormat:@"%@ - ",[error valueForKeyPath:object]];
    }
    return msgError;
}

-(BOOL)checkUsername:(NSString*)username {
    
    if (username.length <= 3) {
        
        [error setObject: @"Username need to be > 3" forKey: @"username"];
    }

    if ([error valueForKeyPath:@"username"] != nil) {
        
        return FALSE;
    }
    return TRUE;
}

-(BOOL)checkEmail:(NSString*)email {
    
    if ([error valueForKeyPath:@"email"] != nil) {
        
        return FALSE;
    }
    return TRUE;
}

-(BOOL)checkPassword:(NSString*)password {
    
    if (password.length <= 3) {
        
        [error setObject:@"password need to be != of null" forKey:@"password"];
    }
    if ([error valueForKeyPath:@"password"] != nil) {
        
        return FALSE;
    }
    return TRUE;
}

@end
