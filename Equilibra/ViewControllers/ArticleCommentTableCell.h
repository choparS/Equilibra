//
//  ArticleCommentCell.h
//  Equilibra
//
//  Created by Brice LE BAIL on 21/06/2014.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleCommentTableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *AuthorLabel;
@property (strong, nonatomic) IBOutlet UILabel *DateLabel;
@property (strong, nonatomic) IBOutlet UIWebView *Content;

@end
