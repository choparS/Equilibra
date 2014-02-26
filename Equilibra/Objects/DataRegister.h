//
//  DataRegister.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/23/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataRegister : NSObject {

    NSString*   pseudo;
    NSString*   email;
    NSString*   password;
    NSString*   firstName;
    NSString*   lastName;
    NSString*   birthday;
    NSInteger   gender;
    NSString*   weight;
    NSString*   height;
    NSString*   zipCode;
    NSString*   goal;
    BOOL        newsletter;

}

@property (strong, nonatomic) NSString* pseudo;
@property (strong, nonatomic) NSString* email;
@property (strong, nonatomic) NSString* password;
@property (strong, nonatomic) NSString* firstName;
@property (strong, nonatomic) NSString* lastName;
@property (strong, nonatomic) NSString* birthday;
@property NSInteger                     gender;
@property (strong, nonatomic) NSString* weight;
@property (strong, nonatomic) NSString* height;
@property (strong, nonatomic) NSString* zipCode;
@property (strong, nonatomic) NSString* goal;
@property BOOL                          newsletter;

/*
 Fonction qui permet d'initialiser les données de la classe
 
 Parametres:
    Aucun
 Retour:
    L'instance créée et initialisée
 */
+(DataRegister*)initialize;

@end
