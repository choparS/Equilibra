//
//  CheckValue.h
//  Equilibra
//
//  Created by Brice LE BAIL on 24/05/2014.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CheckValue : NSObject
{
    NSMutableDictionary *error;
}

-(NSString*)createMsgError:(NSArray*)values;

-(BOOL)checkUsername:(NSString*)username;
-(BOOL)checkPassword:(NSString*)password;
-(BOOL)checkEmail:(NSString*)email;


@end
