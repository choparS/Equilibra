//
//  MenuViewController.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton*    flag;
@property (weak, nonatomic) IBOutlet UITableView*   tableView;

@property BOOL  menuFlagOpen;

- (IBAction)showFlag:(id)sender;
- (IBAction)showSubMenu:(id)sender;

@end