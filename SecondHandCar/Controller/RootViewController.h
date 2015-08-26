//
//  RootViewController.h
//  SecondHandCar
//
//  Created by lifangli on 15/8/15.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationBar.h"

@interface RootViewController : UIViewController<NavigationBarDelegate>

@property (strong, nonatomic) NSString *titleStr;
@property (strong, nonatomic) NSString *rightBtnTitle;
@property (strong, nonatomic) NSString *leftBtnTitle;
@property (strong, nonatomic) NSString *rightBtnImageName;
@property (strong, nonatomic) NSString *leftBtnImageName;
@property (assign, nonatomic) BOOL hasRightTitle;
@property (assign, nonatomic) BOOL hasLeftTitle;

-(void)initData;

@end
