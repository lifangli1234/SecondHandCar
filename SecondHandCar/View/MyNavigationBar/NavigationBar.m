//
//  NavigationBar.m
//  SecondHandCar
//
//  Created by lifangli on 15/8/13.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "NavigationBar.h"

@implementation NavigationBar

-(void)CreateMyNavigationBarWithTitleStr:(NSString *)title andRightBtnTitle:(NSString *)rightBtnTitle andLeftBtnTitle:(NSString *)leftBtnTitle andRightBtnImageName:(NSString *)rightBtnImageName andLeftBtnImageName:(NSString *)leftBtnImageName andLeftBtnHasTitle:(BOOL)hasLeft andRightBtnHasTitle:(BOOL)hasRight
{
    [self CreateTitleView];
    [self createTitleLabelWithTitle:title];
    [self createLeftBtnWithLeftBtnName:leftBtnTitle andLeftBtnImagename:leftBtnImageName andRightBtnName:rightBtnTitle andRightBtnImageName:rightBtnImageName andLeftBtnHasTitle:hasLeft andRightBtnHasTitle:hasRight];
}

-(void)CreateTitleView
{
    UIView *titleView = [[UIView alloc] initWithFrame:self.bounds];
    titleView.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:105.0/255.0 blue:195.0/255.0 alpha:1.0];
    [self addSubview:titleView];
}

-(void)createTitleLabelWithTitle:(NSString *)title
{
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(80, 20, self.frame.size.width-160, 44);
    label.text = title;
    label.font = [UIFont systemFontOfSize:18];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    [self addSubview:label];
}

-(void)createLeftBtnWithLeftBtnName:(NSString *)leftBtnName andLeftBtnImagename:(NSString *)leftBtnImageName andRightBtnName:(NSString *)rightBtnName andRightBtnImageName:(NSString *)rightBtnImageName andLeftBtnHasTitle:(BOOL)hasLeft andRightBtnHasTitle:(BOOL)hasRight
{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 22, 80, 44);
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [leftBtn setImage:[UIImage imageNamed:leftBtnImageName] forState:UIControlStateNormal];
    if (!hasLeft) {
        leftBtn.contentEdgeInsets = UIEdgeInsetsMake(12, 14, 12, 46);
        leftBtnName = nil;
    }
    else{
        [leftBtn setTitle:leftBtnName forState:UIControlStateNormal];
    }
    [leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftBtn];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(self.frame.size.width-80, 22, 80, 44);
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBtn setImage:[UIImage imageNamed:rightBtnImageName] forState:UIControlStateNormal];
    if (!hasRight) {
        rightBtn.contentEdgeInsets = UIEdgeInsetsMake(12, 46, 12, 14);
        rightBtnName = nil;
    }
    else{
        [rightBtn setTitle:rightBtnName forState:UIControlStateNormal];
    }
    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rightBtn];
}

-(void)leftBtnClick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(navigationBarLeftBtnClick:)]) {
        [self.delegate navigationBarLeftBtnClick:self];
    }
}

-(void)rightBtnClick:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(navigationBarRightBtnClick:)]) {
        [self.delegate navigationBarRightBtnClick:self];
    }
}

@end
