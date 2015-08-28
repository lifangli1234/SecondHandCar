//
//  SellCarViewController.m
//  SecondHandCar
//
//  Created by lifangli on 15/8/17.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "SellCarViewController.h"

@interface SellCarViewController ()

@end

@implementation SellCarViewController
{
    RecycleScrollView *_recycleScr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self creteUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initData
{
    self.titleStr = @"卖车";
    self.hasLeftTitle = NO;
    self.hasRightTitle = NO;
    self.leftBtnImageName = nil;
    self.rightBtnImageName = nil;
}

-(void)creteUI
{
    _recycleScr = [[RecycleScrollView alloc] initWithFrame:CGRectMake(0, 64, [Helper screenWidth], [Helper screenHeight]-64-220)];
    [_recycleScr shouldAutoShow:YES];
    _recycleScr.delegate = self;
    _recycleScr.backgroundColor = LIGHTGRAY;
    
    NSMutableArray *tempArr = [[NSMutableArray alloc] init];
    for (int i = 1; i<6; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"image%d.9.png",i]];
        [tempArr addObject:imageView];
    }
    [_recycleScr setImageArr:tempArr];
    //[_recycleScr.pageControl setImageControlSateNormal:[UIImage imageNamed:@"sale_pictureswitch.png"]];
    //[_recycleScr.pageControl setImageControlSateHilighted:[UIImage imageNamed:@"sale_pictureswitch_over.png"]];
    
    [self.view addSubview:_recycleScr];
    
    [self.view addSubview:[Helper label:@"个人卖车" frame:CGRectMake(40, [Helper screenHeight]-100, [Helper screenWidth]-80, 25) font:[UIFont systemFontOfSize:18] textColor:BLUE textAligment:NSTextAlignmentCenter]];
    UIButton *btn = [Helper button:nil image:@"sale_i.png" frame:CGRectMake(0, [Helper screenHeight]-220, [Helper screenWidth], 220) target:self action:@selector(sellCarPersonal) textColor:nil textFont:nil tag:0];
    btn.contentEdgeInsets = UIEdgeInsetsMake(30, ([Helper screenWidth]-80)/2, 110, ([Helper screenWidth]-80)/2);
    [self.view addSubview:btn];
}

-(void)sellCarPersonal
{
    
}

-(void)RecycleScrollView:(RecycleScrollView *)recycleScrollView didClickPageAtIndex:(NSInteger)index
{
    NSLog(@"点击了第%ld页",(long)index);
}

-(void)viewDidDisappear:(BOOL)animated
{
    [_recycleScr shouldAutoShow:NO];
}

@end
