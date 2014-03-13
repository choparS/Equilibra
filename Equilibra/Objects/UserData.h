//
//  UserData.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/22/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FacebookSDK/FBProfilePictureView.h"
#import "GoogleOpenSource/GTLPlusPerson.h"

@interface UserData : NSObject {

    enum AccountType {
        EQUILIBRA,
        FACEBOOK,
        TWITTER,
        GOOGLE
    };

    BOOL                connected;
    
    enum AccountType    accountType;
    NSString*           username;
    NSString*           email;
    NSString*           firstName;
    NSString*           lastName;
    NSString*           birthday;
    NSString*           gender;
    NSNumber*           weight;
    NSNumber*           height;
    NSString*           city;
    NSString*           zipCode;
    NSString*           goal;
    BOOL                newsletter;
    
    UIImageView*            profilePicture;
    FBProfilePictureView*   profilePictureFB;
    
}

@property BOOL                          connected;

@property enum AccountType              accountType;
@property (strong, nonatomic) NSString* username;
@property (strong, nonatomic) NSString* email;
@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSString* birthday;
@property (strong, nonatomic) NSString* gender;
@property (strong, nonatomic) NSString* weight;
@property (strong, nonatomic) NSString* height;
@property (strong, nonatomic) NSString* city;
@property (strong, nonatomic) NSString* zipCode;
@property (strong, nonatomic) NSString* goal;
@property BOOL                          newsletter;

@property (strong, nonatomic) UIImageView*          profilePicture;
@property (strong, nonatomic) FBProfilePictureView* profilePictureFB;

/*
 Fonction qui permet de récupérer l'unique instance de la classe
 
 Parametres:
    Aucun
 Retour:
    L'instance de la classe
 */
+(UserData*)getInstance;

@end
