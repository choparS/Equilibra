//
//  WebServices.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/18/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServices : NSObject

- (BOOL)WBSConnection:(NSString*)username withPassWord:(NSString*)password;
- (BOOL)WBSRegisterVerification:(NSString *)pseudo :(NSString*)email;
- (NSDictionary*)WBSRegister:(NSDictionary*)data;
- (NSDictionary*)httpRequest:(NSString*)request withUrl:(NSURL*)url;

@end
