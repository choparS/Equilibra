//
//  RegisterFourViewController.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "RegisterFourViewController.h"
#import "RegisterThreeViewController.h"
#import "WebServices.h"

@interface RegisterFourViewController ()

@end

@implementation RegisterFourViewController

@synthesize data = _data;

@synthesize newsletter = _newsletter;
@synthesize termsOfUse = _termsOfUse;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Récupération des données d'inscription
    [_newsletter setOn:_data.newsletter];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Mise à jour et transfert des données d'inscription vers l'étape précédente
    _data.newsletter = _newsletter.on;
    if ([[segue identifier] isEqualToString:@"toRegisterThree"]) {
        RegisterThreeViewController *registerThree = [segue destinationViewController];
        registerThree.data = _data;
    }
}

/*
 NSLog(@"%@", data);
 // Si erreur lors de l'inscription
 if ([data[@"register"] boolValue] == FALSE) {
 
 if ([data[@"emailError"] boolValue] == TRUE) {
 
 self.email.backgroundColor = [UIColor redColor];
 }
 if ([data[@"usernameError"] boolValue] == TRUE) {
 
 self.pseudo.backgroundColor = [UIColor redColor];
 }
 } else {
 //Connexion réussie
 self.email.backgroundColor = [UIColor whiteColor];
 self.pseudo.backgroundColor = [UIColor whiteColor];
 self.msgError.textColor = [UIColor greenColor];
 self.msgError.text = @"Votre compte a été créé avec succès.";
 self.msgError.hidden = FALSE;
 
 */

- (IBAction)registerMe:(id)sender {
    // Si les conditions d'utilisation ont été approuvé
    if (_termsOfUse.on) {
        WebServices *wbs = [[WebServices alloc] init];
        // On crée le dictionnaire avec les données d'inscription
        NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
        
        [data setObject:[NSString stringWithFormat:@"%@", _data.pseudo] forKey:@"pseudo"];
        [data setObject:[NSString stringWithFormat:@"%@", _data.email] forKey:@"email"];
        [data setObject:[NSString stringWithFormat:@"%@", _data.password] forKey:@"password"];
        [data setObject:[NSString stringWithFormat:@"%@", _data.firstName] forKey:@"firstName"];
        [data setObject:[NSString stringWithFormat:@"%@", _data.lastName] forKey:@"lastName"];
        [data setObject:[NSString stringWithFormat:@"%@", _data.birthday] forKey:@"dateOfBirth"];
        [data setObject:[NSString stringWithFormat:@"%@", _data.gender == 0 ? @"male" : @"female"] forKey:@"gender"];
        [data setObject:[NSString stringWithFormat:@"%@", _data.weight] forKey:@"weight"];
        [data setObject:[NSString stringWithFormat:@"%@", _data.height] forKey:@"height"];
        [data setObject:[NSString stringWithFormat:@"%@", _data.zipCode] forKey:@"zipCode"];
        [data setObject:[NSString stringWithFormat:@"%@", _data.goal] forKey:@"goal"];
        [data setObject:[NSString stringWithFormat:@"%@", _newsletter.on ? @"true" : @"false"] forKey:@"newsletter"];
        
        // On envoie les données au webservice d'inscription, puis on récupère la réponse du serveur
        NSDictionary *answer = [wbs WBSRegister:data];
        NSLog(@"%@", answer);
        /////////////////////////////////////////////
        // A FAIRE !!! Le traitement de la réponse //
        /////////////////////////////////////////////
    }
    // Sinon, on affiche un dialogue
    else {
        NSLog(@"Les conditions d'utilisation n'ont pas été lu et approuvé");
    }
    
}

@end
