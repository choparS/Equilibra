//
//  RecipeCell.h
//  Equilibra
//
//  Created by Brice LE BAIL on 17/06/2014.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeTableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *TitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *UsernameLabel;
@property (strong, nonatomic) IBOutlet UILabel *PrepaTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *CookingTimeLabel;
@property (strong, nonatomic) IBOutlet UIImageView *ThumbImage;
@property (strong, nonatomic) IBOutlet UIImageView *ImageDifficulty;
@property (strong, nonatomic) IBOutlet UILabel *AverageNoteLabel;

- (NSString *)recupeImgNoteFromDiffulty:(NSInteger)difficulty;

@end
