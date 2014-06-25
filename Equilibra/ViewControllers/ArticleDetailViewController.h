//
//  ArticleDetailViewController.h
//  Equilibra
//
//  Created by Brice LE BAIL on 19/06/2014.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServices.h"
#import "ArticleCommentViewController.h"

@interface ArticleDetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *TitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *AuteurLabel;
@property (strong, nonatomic) IBOutlet UILabel *DateLabel;
@property (strong, nonatomic) IBOutlet UIImageView *ImageView;
@property (strong, nonatomic) IBOutlet UIWebView *Content;

@property (strong, nonatomic) NSString *idArticle;

@property (nonatomic, strong) NSDictionary *comments;

@end
