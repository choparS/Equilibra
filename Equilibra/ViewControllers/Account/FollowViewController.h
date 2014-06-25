//
//  FollowViewController.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/23/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MEDynamicTransition.h"
#import "UIViewController+ECSlidingViewController.h"
#import "Settings.h"
#import "WebServices.h"

@interface FollowViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *viewTitle;

- (IBAction)menuButtonTapped:(id)sender;

- (IBAction)WeightAdd:(id)sender;
- (IBAction)sportAdd:(id)sender;
- (IBAction)measurementAdd:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *weightDate;
@property (weak, nonatomic) IBOutlet UITextField *weightValue;
@property (weak, nonatomic) IBOutlet UITextField *weightType;

@property (weak, nonatomic) IBOutlet UITextField *sportDate;
@property (weak, nonatomic) IBOutlet UITextField *sportType;
@property (weak, nonatomic) IBOutlet UITextField *sportValue;

@property (weak, nonatomic) IBOutlet UITextField *measurementDate;
@property (weak, nonatomic) IBOutlet UITextField *measurementType;
@property (weak, nonatomic) IBOutlet UITextField *measurementValue;

@end
