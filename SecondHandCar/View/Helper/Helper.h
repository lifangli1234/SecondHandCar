//
//  Helper.h
//  FavoriteFree
//
//  Created by leisure on 14-4-22.
//  Copyright (c) 2014年 leisure. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Helper : NSObject

+(NSInteger)screenHeight;
+(NSInteger)screenWidth;

+(UILabel *)label:(NSString *)title frame:(CGRect)frame font:(UIFont *)font textColor:(UIColor *)color textAligment:(NSTextAlignment)alignment;
+(UIImageView *)imageView:(CGRect)frame name:(NSString *)name;
+(UIView *)view:(CGRect)frame backgroundColor:(UIColor *)color;
+(UIButton *)button:(NSString *)title image:(NSString *)image frame:(CGRect)frame target:(id)target action:(SEL)sel textColor:(UIColor *)color textFont:(UIFont *)font tag:(NSInteger)tag;

@end






