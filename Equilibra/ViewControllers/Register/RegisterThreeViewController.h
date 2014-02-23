//
//  RegisterThreeViewController.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataRegister.h"

@interface RegisterThreeViewController : UIViewController

@property (strong, nonatomic) DataRegister*             data;
@property (strong, nonatomic) NSArray*                  goals;

@property (strong, nonatomic) IBOutlet UIPickerView*    goalList;

- (NSInteger)getIndexFromTitle:(NSString *)title;

@end
