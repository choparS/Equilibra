//
//  Dialog.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/23/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dialog : NSObject

/*
 Fonction qui permet d'afficher une boite de dialogue de type information ("OK" button)
 
 Parametres:
    - title : le titre de la boite de dialogue
    - message : le message de la boite de dialogue
    - view : la vue dans laquelle est lancée la boite de dialogue
 Retour:
    Aucun
 */
+(void)informDialog:(NSString*)title :(NSString*)message :(id)view;

/*
 Fonction qui permet d'afficher une boite de dialogue de type confirmation ("YES/NO" buttons)
 
 Parametres:
    - title : le titre de la boite de dialogue
    - message : le message de la boite de dialogue
    - view : la vue dans laquelle est lancée la boite de dialogue
 Retour:
    Aucun
 */
+(void)confirmDialog:(NSString*)title :(NSString*)message :(id)view;
        
@end
