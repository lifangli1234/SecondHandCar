//
//  CarStateViewController.m
//  SecondHandCar
//
//  Created by lifangli on 15/8/26.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "CarStateViewController.h"
#import "MineModule.h"

@interface CarStateViewController ()

@end

@implementation CarStateViewController
{
    NSMutableArray *_titleArr;
}

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
    _titleArr = [[NSMutableArray alloc] init];
    [[MineModule sharedMineModule] initCarStateWithArr:_titleArr];
    self.titleStr = _titleArr[self.index];
    self.hasLeftTitle = NO;
    self.hasRightTitle = YES;
    self.rightBtnTitle = @"其它";
    self.leftBtnImageName = @"navbar_return.png";
    self.rightBtnImageName = nil;
}

-(void)navigationBarLeftBtnClick:(NavigationBar *)navBar
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
