//
//  ArticleViewController.h
//  Equilibra
//
//  Created by Brice LE BAIL on 19/06/2014.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServices.h"
#import "MEDynamicTransition.h"
#import "UIViewController+ECSlidingViewController.h"
#import "Settings.h"
#import "ArticleTableCell.h"
#import "ArticleDetailViewController.h"

@interface ArticleViewController : UITableViewController


@property (strong, nonatomic) IBOutlet UILabel *viewTitle;

- (IBAction)menuButtonTapped:(id)sender;

// Recettes
@property (nonatomic, strong) NSArray *Title;
@property (nonatomic, strong) NSArray *Images;
@property (nonatomic, strong) NSArray *IdArticle;
@property (nonatomic, strong) NSArray *Auteur;
@property (nonatomic, strong) NSArray *Date;

@end
