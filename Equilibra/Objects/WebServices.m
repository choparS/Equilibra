//
//  WebServices.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/18/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "WebServices.h"

@implementation WebServices


/*
 * WebService Utilisateur
 */

- (BOOL)WBSConnection:(NSString *)username withPassWord:(NSString *)password {
    // Creation de la requete a envoyer au serveur
    NSString *post = [NSString stringWithFormat:@"username_email=%@&password=%@", username, password];
    // Formatage de l'url de destination de la requete
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"http://%@:%@@www.equi-libra.fr/ws/login", @"equilibra2015", @"equilibrawebsite2015"]];
    // Execute la requete http et retourne les données JSON
    NSDictionary *answer = [self httpRequest:post withUrl:url];
    
    return [answer[@"connexion"] boolValue];
}

- (NSDictionary*)WBSRegister:(NSDictionary *)data {
    // Creation de la requete a envoye au serveur
    NSString *post = [NSString stringWithFormat:@"username=%@&email=%@&password=%@&firstname=%@&lastname=%@&dateOfBirth=%@&gender=%@&postalCode=%@&newsletter=%@",
                      data[@"pseudo"],
                      data[@"email"],
                      data[@"password"],
                      data[@"firstName"],
                      data[@"lastName"],
                      data[@"dateOfBirth"],
                      data[@"gender"],
                      data[@"zipCode"],
                      data[@"newsletter"]];
    
    // Formatage de l'url de destination de la requete
    NSURL   *url = [NSURL URLWithString: [NSString stringWithFormat:@"http://%@:%@@www.equi-libra.fr/ws/register", @"equilibra2015", @"equilibrawebsite2015"]];
    
    // Execute la requete http et retourne les données JSON
    NSDictionary *answer = [self httpRequest:post withUrl:url];
    
    return answer;
}

- (BOOL)WBSRegisterVerification:(NSString *)type :(NSString*)data {
    // Creation de la requete a envoyer au serveur
    NSString *post = [NSString stringWithFormat:@"type=%@&%@=%@", type, type, data];
    // Formatage de l'url de destination de la requete
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"http://%@:%@@www.equi-libra.fr/ws/register-verification", @"equilibra2015", @"equilibrawebsite2015"]];
    // Execute la requete http et retourne les données JSON
    NSDictionary *answer = [self httpRequest:post withUrl:url];
    
    return [answer[@"verification"] boolValue];
}

- (BOOL)WBSDeleteUser:(NSString *)username withPassWord:(NSString *)password {
    // Creation de la requete a envoyer au serveur
    NSString *post = [NSString stringWithFormat:@"username_email=%@&password=%@", username, password];
    // Formatage de l'url de destination de la requete
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"http://%@:%@@www.equi-libra.fr/ws/delete-user", @"equilibra2015", @"equilibrawebsite2015"]];
    // Execute la requete http et retourne les données JSON
    NSDictionary *answer = [self httpRequest:post withUrl:url];
    
    return [answer[@"DeleteUser"] boolValue];
}
/******************************************************************************/

/*
 * WebService Follow
 */

// Peut etre regrouper toutes les fonctions follow dans la meme fonction
- (BOOL)WBSFollowSportAdd:(NSDate *)date :(NSString*)value :(NSString*)type
{
    // Creation de la requete a envoye au serveur
    NSString *post = [NSString stringWithFormat:@"date=%@&value=%@&type=%@",
                      date,
                      value,
                      type];
    
    // Formatage de l'url de destination de la requete
    NSURL   *url = [NSURL URLWithString: [NSString stringWithFormat:@"http://%@:%@@www.equi-libra.fr/ws/JENESAISPAS", @"equilibra2015", @"equilibrawebsite2015"]];
    
    // Execute la requete http et retourne les données JSON
    NSDictionary *answer = [self httpRequest:post withUrl:url];
    
    return [answer[@"error"] boolValue];
}

- (BOOL)WBSFollowWeightAdd:(NSDate *)date :(NSString*)value :(NSString*)type
{
    // Creation de la requete a envoye au serveur
    NSString *post = [NSString stringWithFormat:@"date=%@&value=%@&type=%@",
                      date,
                      value,
                      type];
    
    // Formatage de l'url de destination de la requete
    NSURL   *url = [NSURL URLWithString: [NSString stringWithFormat:@"http://%@:%@@www.equi-libra.fr/ws/JENESAISPAS", @"equilibra2015", @"equilibrawebsite2015"]];
    
    // Execute la requete http et retourne les données JSON
    NSDictionary *answer = [self httpRequest:post withUrl:url];
    
    return [answer[@"error"] boolValue];
}

- (BOOL)WBSFollowMeasurementAdd:(NSDate *)date :(NSString*)value :(NSString*)type
{
    // Creation de la requete a envoye au serveur
    NSString *post = [NSString stringWithFormat:@"date=%@&value=%@&type=%@",
                      date,
                      value,
                      type];
    
    // Formatage de l'url de destination de la requete
    NSURL   *url = [NSURL URLWithString: [NSString stringWithFormat:@"http://%@:%@@www.equi-libra.fr/ws/JENESAISPAS", @"equilibra2015", @"equilibrawebsite2015"]];
    
    // Execute la requete http et retourne les données JSON
    NSDictionary *answer = [self httpRequest:post withUrl:url];
    
    return [answer[@"error"] boolValue];
}
/******************************************************************************/

/*
 * WebService Recette
 */
- (NSDictionary*)WBSRecipe:(NSInteger)limit {
    
    // Creation de la requete a envoye au serveur
//    NSString *post = [NSString stringWithFormat:@"limit=%d",
//                      limit];
    // Formatage de l'url de destination de la requete
    NSURL   *url = [NSURL URLWithString: [NSString stringWithFormat:@"http://%@:%@@www.equi-libra.fr/ws/get-recipes", @"equilibra2015", @"equilibrawebsite2015"]];
    
    NSDictionary *answer = [self httpRequest:nil withUrl:url];

    return answer[@"recipes"];
}

- (NSDictionary*)WBSRecipeConsult:(NSInteger)identifier {
    
    // Creation de la requete a envoye au serveur
    NSString *post = [NSString stringWithFormat:@"id=%d",
                          identifier];
    // Formatage de l'url de destination de la requete
    NSURL   *url = [NSURL URLWithString: [NSString stringWithFormat:@"http://%@:%@@www.equi-libra.fr/ws/consult-recipe", @"equilibra2015", @"equilibrawebsite2015"]];
    
    NSDictionary *answer = [self httpRequest:post withUrl:url];
    
    return answer[@"recipe"];
}
/******************************************************************************/

/*
 * WebService Article
 */

- (NSDictionary*)WBSArticle:(NSInteger)limit {
    
    // Creation de la requete a envoye au serveur
    //    NSString *post = [NSString stringWithFormat:@"limit=%d",
    //                      limit];
    // Formatage de l'url de destination de la requete
    NSURL   *url = [NSURL URLWithString: [NSString stringWithFormat:@"http://%@:%@@www.equi-libra.fr/ws/get-articles", @"equilibra2015", @"equilibrawebsite2015"]];
    
    NSDictionary *answer = [self httpRequest:nil withUrl:url];
    
    NSLog(@"%@", answer);
    return answer[@"articles"];
}

- (NSDictionary*)WBSArticleConsult:(NSInteger)identifier {
    
    // Creation de la requete a envoye au serveur
    NSString *post = [NSString stringWithFormat:@"id=%d",
                      identifier];
    // Formatage de l'url de destination de la requete
    NSURL   *url = [NSURL URLWithString: [NSString stringWithFormat:@"http://%@:%@@www.equi-libra.fr/ws/consult-article", @"equilibra2015", @"equilibrawebsite2015"]];
    
    NSDictionary *answer = [self httpRequest:post withUrl:url];
    
    return answer;
}


/******************************************************************************/

- (NSDictionary*)httpRequest:(NSString*)request withUrl:(NSURL*)url {
    //Préparation de la requete
    NSMutableURLRequest *httpRequest = [NSMutableURLRequest requestWithURL:url];
    
	[httpRequest setHTTPMethod:@"POST"];
	[httpRequest setHTTPBody:[request dataUsingEncoding:NSUTF8StringEncoding]];
    
    // Récupère la réponse du serveur
    NSData *answer = [NSURLConnection sendSynchronousRequest:httpRequest returningResponse:nil error:nil];
    
    // Parse la réponse sérialisée en JSON
    NSError *error = nil;
    NSDictionary *parsedAnswer = [NSJSONSerialization JSONObjectWithData:answer options:kNilOptions error:&error];
    
    return parsedAnswer;
}

@end
