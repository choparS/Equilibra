//
//  ArticleCommentViewController.h
//  Equilibra
//
//  Created by Brice LE BAIL on 21/06/2014.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleCommentTableCell.h"

@interface ArticleCommentViewController : UITableViewController

@property (strong, nonatomic) NSArray *Author;
@property (strong, nonatomic) NSArray *Date;
@property (strong, nonatomic) NSArray *Content;

@property (strong, nonatomic) NSDictionary *comments;

@end
