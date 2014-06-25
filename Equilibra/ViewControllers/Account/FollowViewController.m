//
//  FollowViewController.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/23/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "FollowViewController.h"

@interface FollowViewController ()

@property (nonatomic, strong) UIPanGestureRecognizer*   dynamicTransitionPanGesture;

@end

@implementation FollowViewController

@synthesize viewTitle = _viewTitle;

@synthesize weightDate = _weightDate;
@synthesize weightType = _weightType;
@synthesize weightValue = _weightValue;

@synthesize sportDate = _sportDate;
@synthesize sportType = _sportType;
@synthesize sportValue = _sportValue;

@synthesize measurementDate = _measurementDate;
@synthesize measurementType = _measurementType;
@synthesize measurementValue = _measurementValue;

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    Settings*   settings = [Settings getInstance];
    
    // Initialisation du texte dans la langue paramétrée
    [_viewTitle setText:NSLocalizedStringFromTable(@"FollowsViewTitle", settings.language, @"")];
    
    if ([(NSObject *)self.slidingViewController.delegate isKindOfClass:[MEDynamicTransition class]]) {
        MEDynamicTransition *dynamicTransition = (MEDynamicTransition *)self.slidingViewController.delegate;
        if (!self.dynamicTransitionPanGesture)
            self.dynamicTransitionPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:dynamicTransition action:@selector(handlePanGesture:)];
        
        [self.navigationController.view removeGestureRecognizer:self.slidingViewController.panGesture];
        [self.navigationController.view addGestureRecognizer:self.dynamicTransitionPanGesture];
    }
    else {
        [self.navigationController.view removeGestureRecognizer:self.dynamicTransitionPanGesture];
        [self.navigationController.view addGestureRecognizer:self.slidingViewController.panGesture];
    }
}

#pragma mark - IBActions

- (IBAction)menuButtonTapped:(id)sender {
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}

- (IBAction)WeightAdd:(id)sender {
    
//    WebServices *wbs = [[WebServices alloc] init];
//    
//    BOOL wAdd = [wbs WBSWeightAdd:_weightDate.text.lowercaseString withWeightValue:_weightValue.text, withWeightType:_weightType];
}

- (IBAction)sportAdd:(id)sender {

    //    WebServices *wbs = [[WebServices alloc] init];
    //
    //    BOOL sAdd = [wbs WBSSportAdd:_sportDate.text.lowercaseString withSportValue:_sportValue.text, withSportType:_sportType];
}


- (IBAction)measurementAdd:(id)sender {

    //    WebServices *wbs = [[WebServices alloc] init];
    //
    //    BOOL mAdd = [wbs WBSMeasurementAdd:_measurementDate.text.lowercaseString withMeasurementValue:_measurementValue.text, withMeasurementType:_measurementType];
}


@end
