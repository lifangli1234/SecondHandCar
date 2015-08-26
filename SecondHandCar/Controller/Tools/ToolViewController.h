//
//  ToolViewController.h
//  SecondHandCar
//
//  Created by lifangli on 15/8/17.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
#import "ToolCell.h"

@interface ToolViewController : RootViewController<UITableViewDataSource,UITableViewDelegate,ToolCellDelegate>

@end
