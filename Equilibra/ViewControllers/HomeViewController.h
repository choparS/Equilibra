//
//  HomeViewController.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"

@interface HomeViewController : UIViewController <ECSlidingViewControllerDelegate>

- (IBAction)menuButtonTapped:(id)sender;

@end
