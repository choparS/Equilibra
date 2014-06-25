//
//  ArticleTableCell.h
//  Equilibra
//
//  Created by Brice LE BAIL on 19/06/2014.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleTableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *TitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *AuteurLabel;
@property (strong, nonatomic) IBOutlet UILabel *DateLabel;
@property (strong, nonatomic) IBOutlet UIImageView *ThumbImage;

@end
