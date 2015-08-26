//
//  MineModule.m
//  SecondHandCar
//
//  Created by lifangli on 15/8/25.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "MineModule.h"

@implementation MineModule

static MineModule *_sharedMineModule;

+(MineModule *)sharedMineModule
{
    if (!_sharedMineModule) {
        _sharedMineModule = [[MineModule alloc] init];
    }
    return _sharedMineModule;
}

-(void)initMyInfoListWithArr:(NSMutableArray *)arr
{
    NSMutableArray *nameArr = [[NSMutableArray alloc] initWithObjects:@"收藏的车", @"订阅的车", @"浏览的车", @"咨询记录", nil];
    NSMutableArray *imageArr = [[NSMutableArray alloc] initWithObjects:@"my_list_collection.png", @"my_list_subscribe.png", @"my_list_browse.png", @"my_list_consultation.png", nil];
    for (int i = 0; i<nameArr.count; i++) {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setValue:nameArr[i] forKey:@"name"];
        [dic setValue:imageArr[i] forKey:@"image"];
        [arr addObject:dic];
    }
}

-(void)initCarStateWithArr:(NSMutableArray *)arr
{
    NSMutableArray *nameArr = [[NSMutableArray alloc] initWithObjects:@"在售车",@"未通过",@"已售车",@"未填写",@"审核中",@"已过期", nil];
    for (NSString *str in nameArr) {
        [arr addObject:str];
    }
}

@end
