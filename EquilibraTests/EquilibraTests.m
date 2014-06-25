//
//  EquilibraTests.m
//  EquilibraTests
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "WebServices.h"
#import "UnitTest.h"
#import "FacebookSDK/FBProfilePictureView.h"
#import "GoogleOpenSource/GTLPlusPerson.h"

@interface          EquilibraTests : XCTestCase

@end

static NSString     *email      = @"test@equi-libra.fr";
static NSString     *password   = @"dRav!8Ev";

@implementation     EquilibraTests


- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}


- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConnection
{
    WebServices *wbs = [[WebServices alloc] init];
    BOOL connected = [wbs WBSConnection:email withPassWord:password];
    
    XCTAssert([NSNumber numberWithBool:connected], @"True need to be egual to true");
}


//- (void)testDeleteUser {
//    
//    WebServices *wbs = [[WebServices alloc] init];
//    
//    //Delete le register puis le recrée
//    XCTAssert([wbs WBSDeleteUser:email withPassWord:password], @"DeleteUser doesn't work");
//}

- (void)testInscription {
   
    WebServices *wbs = [[WebServices alloc] init];
    // On crée le dictionnaire avec les données d'inscription
    NSDictionary *answer;
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    
    //Delete le register puis le recrée
    NSLog(@"DELETEUSER: %d", [wbs WBSDeleteUser:email withPassWord:password]);
    
    //Test Register/emailError/UsernameError
    [data setObject:[NSString stringWithFormat:@"%@", @"test@equi-libra.fr"] forKey:@"email"];
    [data setObject:[NSString stringWithFormat:@"%@", @"equilibra"] forKey:@"pseudo"];
    [data setObject:[NSString stringWithFormat:@"%@", @"dRav!8Ev"] forKey:@"password"];
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

    XCTAssert([answer valueForKey:@"register"], @"False need to be egual to False");

    
    //Test emailError/UsernameError
    answer = [wbs WBSRegister:data];
    XCTAssert([answer valueForKey:@"emailError"], @"EmailError Failed");
    XCTAssert([answer valueForKey:@"usernameError"], @"UsernameError Failed");
    
}

- (void)testRecipe {
    
    WebServices *wbs = [[WebServices alloc] init];
    
    XCTAssert([[wbs WBSRecipe:0] valueForKey:@"error"], @"Recipe connexion Failed");

    // Verifier que l'id est bien present dans la bdd
//    XCTAssert([[wbs WBSRecipeConsult:8] valueForKey:@"error"], @"RecipeConsult connexion Failed");
}

- (void)testArticle {
    
    WebServices *wbs = [[WebServices alloc] init];
    
    XCTAssert([[wbs WBSArticle:0] valueForKey:@"error"], @"Recipe connexion Failed");
    // Verifier que l'id est bien present dans la bdd
    XCTAssert([[[wbs WBSArticleConsult:0] valueForKey:@"error"] boolValue], @"RecipeConsult connexion Failed");
    
}

@end
