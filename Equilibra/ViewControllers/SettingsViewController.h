//
//  SettingsViewController.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *viewTitle;

- (IBAction)menuButtonTapped:(id)sender;
- (IBAction)defaultButtonTapped:(id)sender;
- (IBAction)folderButtonTapped:(id)sender;
- (IBAction)zoomButtonTapped:(id)sender;
- (IBAction)dynamicButtonTapped:(id)sender;

@end
