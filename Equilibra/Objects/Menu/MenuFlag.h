//
//  MenuFlag.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/27/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuFlag : NSObject {

    NSString*   title;
    NSString*   code;
    NSString*   iconName;
    NSString*   iconType;

}

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* code;
@property (strong, nonatomic) NSString* iconName;
@property (strong, nonatomic) NSString* iconType;


/*
 Fonction qui permet d'initialiser les données de la classe
 
 Parametres:
 - title : le titre du drapeau
 - code : le code du drapeau
 - iconName : le nom de l'icone représentant le drapeau
 - iconType : l'extension de l'icone représentant le drapeau
 Retour:
    L'instance créée et initialisée
 */
+ (MenuFlag*)initialize:(NSString*)title :(NSString*)code :(NSString*)iconName :(NSString*)iconType;

@end
