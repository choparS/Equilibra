//
//  DetailViewController.h
//  Equilibra
//
//  Created by Brice LE BAIL on 17/06/2014.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServices.h"

@interface RecipeDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *AuteurLabel;
@property (strong, nonatomic) IBOutlet UILabel *PrepaLabel;
@property (strong, nonatomic) IBOutlet UILabel *CookingLabel;
@property (strong, nonatomic) IBOutlet UIImageView *ImageDifficulty;
@property (strong, nonatomic) IBOutlet UIImageView *ImageView;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIWebView *Ingredient;
@property (strong, nonatomic) IBOutlet UILabel *AverageLabel;
@property (strong, nonatomic) IBOutlet UILabel *StepLabel;
@property (strong, nonatomic) IBOutlet UILabel *DateLabel;

@property (strong, nonatomic) NSString *IdRecipe;

- (NSString *)recupeImgNoteFromDiffulty:(NSInteger)difficulty;

@end
