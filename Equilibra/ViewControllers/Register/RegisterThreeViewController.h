//
//  RegisterThreeViewController.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataRegister.h"

@interface RegisterThreeViewController : UIViewController

@property (strong, nonatomic) DataRegister*             data;
@property (strong, nonatomic) NSArray*                  goals;

@property (strong, nonatomic) IBOutlet UIPickerView*    goalList;

/*
 Fonction qui permet de récupérer l'index d'un élèment de la liste depuis son titre
 
 Parametres:
    - title : le titre de l'élèment de la liste
 Retour:
    L'index de l'élèment de la liste, sinon la valeure médiane de la liste
 */
- (NSInteger)getIndexFromTitle:(NSString *)title;

@end
