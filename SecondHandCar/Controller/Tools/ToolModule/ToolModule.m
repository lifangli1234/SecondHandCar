//
//  ToolModule.m
//  SecondHandCar
//
//  Created by lifangli on 15/8/19.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "ToolModule.h"

@implementation ToolModule

static ToolModule *_sharedToolModule;

+(ToolModule *)sharedToolModule
{
    if (!_sharedToolModule) {
        _sharedToolModule = [[ToolModule alloc] init];
    }
    return _sharedToolModule;
}

-(void)initToolContentListWithArr:(NSMutableArray *)arr
{
    NSMutableArray *nameArr = [[NSMutableArray alloc] initWithObjects:@"车辆估价", @"限迁标准查询", @"保障车索赔", @"养车特惠(仅限北京)", nil];
    NSMutableArray *imageArr = [[NSMutableArray alloc] initWithObjects:@"tool_evaluation.png", @"tool_limit.png", @"tool_claimdemage.png", @"z_15197.png", nil];
    for (int i = 0; i<nameArr.count; i++) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setValue:nameArr[i] forKey:@"name"];
        [dic setValue:imageArr[i] forKey:@"image"];
        [arr addObject:dic];
    }
}

@end
