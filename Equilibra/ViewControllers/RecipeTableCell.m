//
//  RecipeCell.m
//  Equilibra
//
//  Created by Brice LE BAIL on 17/06/2014.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "RecipeTableCell.h"

@implementation RecipeTableCell

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
