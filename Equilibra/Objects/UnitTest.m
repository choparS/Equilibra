//
//  UnitTest.m
//  Equilibra
//
//  Created by Brice LE BAIL on 03/04/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "UnitTest.h"
#import "WebServices.h"

@implementation UnitTest

- (id)init {
    
    return [self initializer];
}

- (id)initializer {

    unitTestResult = [[NSMutableDictionary alloc] init];
    [unitTestResult setObject: [NSNumber numberWithBool:false] forKey: @"Connexion"];
    [unitTestResult setObject: [NSNumber numberWithBool:false] forKey: @"WSConnexion"];
    [unitTestResult setObject: [NSNumber numberWithBool:false] forKey: @"Inscription"];
    [unitTestResult setObject: [NSNumber numberWithBool:false] forKey: @"InscriptionEmailError"];
    [unitTestResult setObject: [NSNumber numberWithBool:false] forKey: @"InscriptionUsernameError"];

    email = @"test@equi-libra.fr";
    password = @"dRav!8Ev";
    
    return self;
}

- (void)testWebserviceConnexion {
    
    WebServices *wbs = [[WebServices alloc] init];
    BOOL connected = [wbs WBSConnection:email withPassWord:password];

    [unitTestResult setValue:[NSNumber numberWithBool:connected] forKey:@"WSConnexion"];
}


- (void)testInscription {
    
    WebServices *wbs = [[WebServices alloc] init];
    // On crée le dictionnaire avec les données d'inscription
    NSDictionary *answer;
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    
    //Delete le register puis le recrée
    [wbs WBSDeleteUser:email withPassWord:password];

    //Test Register/emailError/UsernameError
    [data setObject:[NSString stringWithFormat:@"%@", @"equilibra"] forKey:@"pseudo"];
    [data setObject:[NSString stringWithFormat:@"%@", email] forKey:@"email"];
    [data setObject:[NSString stringWithFormat:@"%@", password] forKey:@"password"];
    [data setObject:[NSString stringWithFormat:@"%@", @"Equi"] forKey:@"firstName"];
    [data setObject:[NSString stringWithFormat:@"%@", @"Libra"] forKey:@"lastName"];
    [data setObject:[NSString stringWithFormat:@"%@", @"2000-01-01"] forKey:@"dateOfBirth"];
    [data setObject:[NSString stringWithFormat:@"%@", @"female"] forKey:@"gender"];
    [data setObject:[NSString stringWithFormat:@"%@", @"45"] forKey:@"weight"];
    [data setObject:[NSString stringWithFormat:@"%@", @"160"] forKey:@"height"];
    [data setObject:[NSString stringWithFormat:@"%@", @"75001"] forKey:@"zipCode"];
    [data setObject:[NSString stringWithFormat:@"%@", @"goal"] forKey:@"goal"];
    [data setObject:[NSString stringWithFormat:@"%@", @"true"] forKey:@"newsletter"];
    

    //Test Register
    answer = [wbs WBSRegister:data];
    [unitTestResult setValue:[answer valueForKey:@"register"] forKey:@"Inscription"];

    //Test emailError/UsernameError
    answer = [wbs WBSRegister:data];
    [unitTestResult setValue:[answer valueForKey:@"emailError"] forKey:@"InscriptionEmailError"];
    [unitTestResult setValue:[answer valueForKey:@"usernameError"] forKey:@"InscriptionUsernameError"];
}

- (void)testConnexion {
    
    [self testWebserviceConnexion];
    [self testInscription];

    //Si la connexion WebService est OK + Inscription = OK => WebService Connexion = OK
    if ([[unitTestResult valueForKey:@"Inscription"] boolValue] == true
        && [[unitTestResult valueForKey:@"WSConnexion"] boolValue] == true) {
        [unitTestResult setValue: [NSNumber numberWithBool:true] forKey:@"Connexion"];
    }
}

@end
