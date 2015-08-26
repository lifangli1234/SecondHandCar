//
//  TabBarViewController.m
//  SecondHandCar
//
//  Created by lifangli on 15/8/17.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "TabBarViewController.h"
#import "CustomButton.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController
{
    UIView *_tabBarView;
    CustomButton *_customButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.hidden = YES;
    
    [self createTabBar];
}

-(void)createTabBar
{
    CGFloat tabBarViewY = self.view.frame.size.height - 49;
    
    _tabBarView = [[UIView alloc] initWithFrame:CGRectMake(0, tabBarViewY, self.view.frame.size.width, 49)];
    _tabBarView.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0];
    _tabBarView.layer.borderColor = [[UIColor colorWithRed:215.0/255.0 green:215.0/255.0 blue:215.0/255.0 alpha:1.0] CGColor];
    _tabBarView.layer.borderWidth = 0.5;
    [self.view addSubview:_tabBarView];
    
    [self creatButtonWithNormalName:@"label_buy.png" andSelectName:@"label_buy_pre.png" andTitle:@"买车" andIndex:0];
    [self creatButtonWithNormalName:@"label_sale.png" andSelectName:@"label_sale_pre.png" andTitle:@"卖车" andIndex:1];
    [self creatButtonWithNormalName:@"label_tool.png" andSelectName:@"label_tool_pre.png" andTitle:@"工具" andIndex:2];
    [self creatButtonWithNormalName:@"label_raiders.png" andSelectName:@"label_raiders_pre.png" andTitle:@"攻略" andIndex:3];
    [self creatButtonWithNormalName:@"label_my.png" andSelectName:@"label_my_pre.png" andTitle:@"我的" andIndex:4];
    
    CustomButton *btn = _tabBarView.subviews[0];
    [self changeViewController:btn];
}

- (void)creatButtonWithNormalName:(NSString *)normal andSelectName:(NSString *)selected andTitle:(NSString *)title andIndex:(int)index
{
    CustomButton *customBtn = [CustomButton buttonWithType:UIButtonTypeCustom];
    CGFloat customBtnW = _tabBarView.frame.size.width/5;
    CGFloat customBtnH = _tabBarView.frame.size.height;
    CGFloat customBtnX = customBtnW*index;
    customBtn.frame = CGRectMake(customBtnX, 0, customBtnW, customBtnH);
    customBtn.tag = index;
    [customBtn setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];
    [customBtn setImage:[UIImage imageNamed:selected] forState:UIControlStateDisabled];
    [customBtn setTitle:title forState:UIControlStateNormal];
    [customBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [customBtn setTitleColor:[UIColor colorWithRed:0.0/255.0 green:105.0/255.0 blue:195.0/255.0 alpha:1.0] forState:UIControlStateDisabled];
    [customBtn addTarget:self action:@selector(changeViewController:) forControlEvents:UIControlEventTouchDown];
    customBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    customBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [_tabBarView addSubview:customBtn];
}

-(void)changeViewController:(CustomButton *)btn
{
    self.selectedIndex = btn.tag;
    btn.enabled = NO;
    if (_customButton != btn) {
        _customButton.enabled = YES;
    }
    _customButton = btn;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
