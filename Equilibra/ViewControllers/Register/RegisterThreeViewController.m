//
//  RegisterThreeViewController.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/17/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "RegisterThreeViewController.h"
#import "RegisterTwoViewController.h"
#import "RegisterFourViewController.h"

@interface RegisterThreeViewController ()

@end

@implementation RegisterThreeViewController

@synthesize data = _data;
@synthesize goals = _goals;

@synthesize goalList = _goalList;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _goals = @[@"Goal #1",
              @"Goal #2",
              @"Goal #3",
              @"Goal #4",
              @"Goal #5"];
    
    [_goalList selectRow:[self getIndexFromTitle:_data.goal] inComponent:0 animated:TRUE];
}

- (NSInteger)getIndexFromTitle:(NSString *)title {
    NSInteger index;
    
    for (index = 0; index < _goals.count; ++index) {
        if ([_goals[index] isEqualToString:title])
            return index;
    }
    return (_goals.count / 2);
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _goals.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return _goals[row];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return 320;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    _data.goal =  _goals[[_goalList selectedRowInComponent:0]];
    if ([[segue identifier] isEqualToString:@"toRegisterTwo"]) {
        RegisterTwoViewController *registerTwo = [segue destinationViewController];
        registerTwo.data = _data;
    }
    else if ([[segue identifier] isEqualToString:@"toRegisterFour"]) {
        RegisterFourViewController *registerFour = [segue destinationViewController];
        registerFour.data = _data;
    }
}

@end
