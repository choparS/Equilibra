//
//  UnitTestViewController.h
//  Equilibra
//
//  Created by Brice LE BAIL on 14/03/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UnitTestViewController : UIViewController

//Menu
@property (weak, nonatomic) IBOutlet UILabel    *viewTitle;

- (IBAction)menuButtonTapped:(id)sender;


//Test
@property (strong, nonatomic) IBOutlet UILabel  *testConnexionLabelResult;
@property (strong, nonatomic) IBOutlet UILabel  *testServerConnexionLabelResult;
@property (strong, nonatomic) IBOutlet UILabel  *testInscriptionLabelResult;
@property (strong, nonatomic) IBOutlet UILabel  *testInscriptionEmailErrorConnexionLabelResult;
@property (strong, nonatomic) IBOutlet UILabel  *testInscriptionUsernameErrorLabelResult;

- (IBAction)testConnexionTapped:(id)sender;

@end