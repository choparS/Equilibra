//
//  AppDelegate.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FacebookSDK/FBSession.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/* 
 Fonction qui permet d'interagir en fonction de l'etat de la session facebook
 
 Parametres:
    - session : la session Facebook
    - state : l'etat de la session
    - error : l'erreur si une erreur a été levée
 Retour:
    Aucun
 */
- (void)sessionStateChanged:(FBSession *)session state:(FBSessionState) state error:(NSError *)error;

@end
