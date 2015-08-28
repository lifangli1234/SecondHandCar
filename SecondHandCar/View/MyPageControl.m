//
//  MyPageControl.m
//  SecondHandCar
//
//  Created by lifangli on 15/8/28.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "MyPageControl.h"

@implementation MyPageControl

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    return self;
}

-(void)setImageControlSateHilighted:(UIImage *)imageControlSateHilighted
{
    _imageControlSateHilighted = imageControlSateHilighted;
    [self updateDots];
}

-(void)setImageControlSateNormal:(UIImage *)imageControlSateNormal
{
    _imageControlSateNormal = imageControlSateNormal;
    [self updateDots];
}

-(void)setCurrentPage:(NSInteger)currentPage
{
    [super setCurrentPage:currentPage];
    [self updateDots];
}

-(void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    [super endTrackingWithTouch:touch withEvent:event];
    [self updateDots];
}

-(void)updateDots
{
    if (_imageControlSateNormal || _imageControlSateHilighted) {
        NSArray *subviews = self.subviews;
        for (int i=0; i<subviews.count; i++) {
            UIImageView *dot = ((UIImageView *)[subviews objectAtIndex:i]);
            dot.image = self.currentPage == i?_imageControlSateNormal:_imageControlSateHilighted;
        }
    }
}

@end
