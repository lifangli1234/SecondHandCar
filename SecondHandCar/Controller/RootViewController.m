//
//  RootViewController.m
//  SecondHandCar
//
//  Created by lifangli on 15/8/15.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.navigationController.navigationBarHidden = YES;
    
    [self initData];
    [self createNavigationBar];
}

-(void)createNavigationBar
{
    NavigationBar *myNav = [[NavigationBar alloc] init];
    myNav.frame = CGRectMake(0, 0, [Helper screenWidth], 64);
    myNav.delegate = self;
    [myNav CreateMyNavigationBarWithTitleStr:_titleStr andRightBtnTitle:_rightBtnTitle andLeftBtnTitle:_leftBtnTitle andRightBtnImageName:_rightBtnImageName andLeftBtnImageName:_leftBtnImageName andLeftBtnHasTitle:_hasLeftTitle andRightBtnHasTitle:_hasRightTitle];
    [self.view addSubview:myNav];
}

-(void)initData
{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
