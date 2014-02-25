//
//  GroupMenuCell.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/24/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArrowButton.h"

@interface GroupMenuCell : UITableViewCell

@property (strong, nonatomic) IBOutlet ArrowButton *arrowButton;
@property (strong, nonatomic) IBOutlet UIImageView *icon;
@property (strong, nonatomic) IBOutlet UILabel *title;

@end
