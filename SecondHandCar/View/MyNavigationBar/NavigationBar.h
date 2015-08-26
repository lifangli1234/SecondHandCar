//
//  NavigationBar.h
//  SecondHandCar
//
//  Created by lifangli on 15/8/13.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NavigationBarDelegate;

@interface NavigationBar : UIView

@property (weak, nonatomic) id<NavigationBarDelegate>delegate;

-(void)CreateMyNavigationBarWithTitleStr:(NSString *)title andRightBtnTitle:(NSString *)rightBtnTitle andLeftBtnTitle:(NSString *)leftBtnTitle andRightBtnImageName:(NSString *)rightBtnImageName andLeftBtnImageName:(NSString *)leftBtnImageName andLeftBtnHasTitle:(BOOL)hasLeft andRightBtnHasTitle:(BOOL)hasRight;

@end

@protocol NavigationBarDelegate <NSObject>

-(void)navigationBarLeftBtnClick:(NavigationBar *)navBar;
-(void)navigationBarRightBtnClick:(NavigationBar *)navBar;

@end