//
//  MyPageControl.h
//  SecondHandCar
//
//  Created by lifangli on 15/8/28.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyPageControl : UIPageControl

@property (nonatomic, retain) UIImage *imageControlSateNormal;
@property (nonatomic, retain) UIImage *imageControlSateHilighted;
-(id)initWithFrame:(CGRect)frame;

@end

@interface MyPageControl(private)

-(void)updateDots;

@end