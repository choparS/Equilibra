//
//  WebServices.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/18/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebServices : NSObject

/*
 Fonction qui permet de lancer la connection via un webservice
 
 Parametres:
 - username : l'username (pseudo ou email) fourni par l'utilisateur
 - password : le mot de passe fourni par l'utilisateur
 Retour:
    True en cas de succès, sinon False
 */
- (BOOL)WBSConnection:(NSString*)username withPassWord:(NSString*)password;

/*
 Fonction qui permet de vérifier la disponibilité de l'username et du mot de passe via un webservice
 
 Parametres:
 - type : le type du champ à vérifier (pseudo ou email)
 - data : la donnée du champ à vérifier
 Retour:
    True si le champ est disponible, sinon False
 */
- (BOOL)WBSRegisterVerification:(NSString *)type :(NSString*)data;

/*
 Fonction qui permet d'enregistrer un utilisateur
 
 Parametres:
 - data : un dictionnaire qui contient les champs d'inscription
 Retour:
    Un dictionnaire qui contient l'état de l'inscription (avec les erreurs éventuelles)
 */
- (NSDictionary*)WBSRegister:(NSDictionary*)data;

/*
 Fonction qui permet de lancer une requête HTTP
 
 Parametres:
 - request : la requête à envoyer
 - url : l'url ou la requête doit être envoyé
 Retour:
    Un dictionnaire contenant la réponse du serveur
 */
- (NSDictionary*)httpRequest:(NSString*)request withUrl:(NSURL*)url;

@end
