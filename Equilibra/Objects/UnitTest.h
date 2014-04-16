//
//  UnitTest.h
//  Equilibra
//
//  Created by Brice LE BAIL on 03/04/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UnitTest : NSObject
{
    NSMutableDictionary     *unitTestResult;
    NSString                *email;
    NSString                *password;
}

- (id)init;
- (id)initializer;
- (void)testWebserviceConnexion;
- (void)testConnexion;
- (void)testInscription;

@end
