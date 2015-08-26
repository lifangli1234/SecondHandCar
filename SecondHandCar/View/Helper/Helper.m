//
//  Helper.m
//  FavoriteFree
//
//  Created by leisure on 14-4-22.
//  Copyright (c) 2014年 leisure. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+(NSInteger)screenHeight
{
    return [[UIScreen mainScreen] bounds].size.height;
}

+(NSInteger)screenWidth
{
    return [[UIScreen mainScreen] bounds].size.width;
}

+(UILabel*)label:(NSString *)title frame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)color textAligment:(NSTextAlignment)alignment
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = font;
    label.text = title;
    label.textAlignment = alignment;
    label.textColor = color;
    return label;
}

+(UIImageView*)imageView:(CGRect)frame name:(NSString *)name
{
    UIImageView * imageView=nil;
    if (name) {
        imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:name]];
        imageView.frame=frame;
    }
    else{
        imageView=[[UIImageView alloc] initWithFrame:frame];
    }
    
    return imageView;
}

+(UIView *)view:(CGRect)frame backgroundColor:(UIColor *)color
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    return view;
}

+(UIButton *)button:(NSString *)title image:(NSString *)image frame:(CGRect)frame target:(id)target action:(SEL)sel textColor:(UIColor *)color textFont:(UIFont *)font tag:(NSInteger)tag
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    button.titleLabel.font = font;
    button.tag = tag;
    [button addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    return  button;
}

@end






