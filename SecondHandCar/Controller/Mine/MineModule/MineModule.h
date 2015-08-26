//
//  MineModule.h
//  SecondHandCar
//
//  Created by lifangli on 15/8/25.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineModule : NSObject

+(MineModule *)sharedMineModule;

-(void)initMyInfoListWithArr:(NSMutableArray *)arr;

@end
