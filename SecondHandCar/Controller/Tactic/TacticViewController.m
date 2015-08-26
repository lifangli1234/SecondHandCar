//
//  TacticViewController.m
//  SecondHandCar
//
//  Created by lifangli on 15/8/17.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "TacticViewController.h"

@interface TacticViewController ()

@end

@implementation TacticViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initData
{
    self.titleStr = @"攻略";
    self.hasLeftTitle = NO;
    self.hasRightTitle = NO;
    self.leftBtnImageName = nil;
    self.rightBtnImageName = nil;
}

@end
