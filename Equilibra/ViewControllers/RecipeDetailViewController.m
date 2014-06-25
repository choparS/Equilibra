//
//  RecipeDetailViewController.m
//  Equilibra
//
//  Created by Brice LE BAIL on 17/06/2014.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "RecipeDetailViewController.h"

@interface RecipeDetailViewController ()

@end

@implementation RecipeDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // BackgroundColor
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];

    // Do any additional setup after loading the view.
    WebServices *wbs = [[WebServices alloc] init];
    
    NSDictionary *recipe =  [wbs WBSRecipeConsult:[_IdRecipe integerValue]];

    // Set variables to page
    _AuteurLabel.text = [NSString stringWithFormat:@"par %@",recipe[@"author_name"]];
    _PrepaLabel.text = [NSString stringWithFormat:@"%@ min",recipe[@"preparation_time"]];
    _CookingLabel.text = [NSString stringWithFormat:@"%@ min",recipe[@"cooking_time"]];;
    _DateLabel.text = [NSString stringWithFormat:@"le %@",recipe[@"date"]];;
    _ImageDifficulty.image = [UIImage imageNamed:[self recupeImgNoteFromDiffulty: [recipe[@"difficulty"] integerValue]]];
    _ImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@:%@@www.equi-libra.fr/uploads/%@", @"equilibra2015", @"equilibrawebsite2015", recipe[@"image_name"]]]]];

    self.navigationItem.title = recipe[@"title"];

    //WebView Step HTML
    [_webView loadHTMLString:recipe[@"steps"] baseURL:nil];
    [_webView setBackgroundColor:[UIColor clearColor]];
    [_webView setOpaque:NO];

    [_Ingredient loadHTMLString:[self getIngredientFromSQLarray:recipe[@"ingredients"]] baseURL:nil];
    [_Ingredient setBackgroundColor:[UIColor clearColor]];
    [_Ingredient setOpaque:NO];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString*)getIngredientFromSQLarray:(NSString*)strIngredients {
    
    NSArray *ingredientsTmp = [strIngredients componentsSeparatedByString:@"\""];
    NSString *ingredients = [[NSString alloc] init];
    for (int i = 0; i < ingredientsTmp.count; i++) {
        
        if ((i % 2) == 1) {
            
            if (i < 2) {
                
                ingredients = [NSString stringWithFormat:@"- %@", ingredientsTmp[i]];
            } else {
                
                ingredients = [NSString stringWithFormat:@"%@<br>- %@", ingredients, ingredientsTmp[i]];
            }
        }
    }
    return ingredients;
}

- (NSString *)recupeImgNoteFromDiffulty:(NSInteger)difficulty {
    
    NSInteger result;
    NSArray *imgDifficulty = @[@"golden_star_0.png",
                               @"golden_star_0.5.png",
                               @"golden_star_1.png",
                               @"golden_star_1.5.png",
                               @"golden_star_2.png",
                               @"golden_star_2.5.png",
                               @"golden_star_3.png",
                               @"golden_star_3.5.png",
                               @"golden_star_4.png",
                               @"golden_star_4.5.png",
                               @"golden_star_5.png"];
    
    switch(difficulty) {
            
        case 0:
            result = 0;
            break;
        case 1:
            result = 2;
            break;
        case 2:
            result = 4;
            break;
        case 3:
            result = 6;
            break;
        case 4:
            result = 8;
            break;
        case 5:
            result = 10;
            break;
        default:
            return imgDifficulty[0];

    }
    return imgDifficulty[result];
}


@end
