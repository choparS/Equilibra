//
//  RecipeViewController.h
//  Equilibra
//
//  Created by Brice LE BAIL on 17/06/2014.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecipeTableCell.h"
#import "RecipeDetailViewController.h"
#import "WebServices.h"
#import "MEDynamicTransition.h"
#import "UIViewController+ECSlidingViewController.h"
#import "Settings.h"


@interface RecipeViewController : UITableViewController

// Menu
@property (strong, nonatomic) IBOutlet UILabel *viewTitle;

- (IBAction)menuButtonTapped:(id)sender;

// Recettes
@property (nonatomic, strong) NSArray *IdRecipes;
@property (nonatomic, strong) NSArray *Title;
@property (nonatomic, strong) NSArray *Auteur;
@property (nonatomic, strong) NSArray *PrepaTime;
@property (nonatomic, strong) NSArray *CookingTime;
@property (nonatomic, strong) NSArray *Difficulty;
@property (nonatomic, strong) NSArray *AverageNote;
@property (nonatomic, strong) NSArray *Images;
@property (nonatomic, strong) NSArray *Steps;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

@end
