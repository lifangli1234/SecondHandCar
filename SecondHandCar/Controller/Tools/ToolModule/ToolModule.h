//
//  ToolModule.h
//  SecondHandCar
//
//  Created by lifangli on 15/8/19.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToolModule : NSObject

+(ToolModule *)sharedToolModule;

-(void)initToolContentListWithArr:(NSMutableArray *)arr;

@end
