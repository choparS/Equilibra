//
//  ArticleCommentCell.m
//  Equilibra
//
//  Created by Brice LE BAIL on 21/06/2014.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "ArticleCommentTableCell.h"

@implementation ArticleCommentTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
