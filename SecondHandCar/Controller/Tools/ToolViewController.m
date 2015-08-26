//
//  ToolViewController.m
//  SecondHandCar
//
//  Created by lifangli on 15/8/17.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "ToolViewController.h"
#import "ToolModule.h"

@interface ToolViewController ()

@end

@implementation ToolViewController
{
    UITableView *_ToolTableView;
    NSMutableArray *_contentList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
    
    _contentList = [[NSMutableArray alloc] init];
    ToolModule *tm = [ToolModule sharedToolModule];
    [tm initToolContentListWithArr:_contentList];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initData
{
    self.titleStr = @"工具";
    self.hasLeftTitle = NO;
    self.hasRightTitle = NO;
    self.leftBtnImageName = nil;
    self.rightBtnImageName = nil;
}

-(void)createUI
{
    UIView *bgView = [[UIView alloc] init];
    bgView.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-49);
    bgView.backgroundColor = [UIColor colorWithRed:230.0/255.0 green:230.0/255.0 blue:230.0/255.0 alpha:1.0];
    [self.view addSubview:bgView];
    
    _ToolTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-49) style:UITableViewStylePlain];
    _ToolTableView.delegate = self;
    _ToolTableView.dataSource = self;
    _ToolTableView.backgroundColor = [UIColor clearColor];
    _ToolTableView.scrollEnabled = NO;
    _ToolTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_ToolTableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ToolCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"ToolCell" owner:self options:nil] lastObject];
    cell.delegate = self;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentLabel.text = [_contentList[0] objectForKey:@"name"];
    cell.contentLabel1.text = [_contentList[1] objectForKey:@"name"];
    cell.contentLabel2.text = [_contentList[2] objectForKey:@"name"];
    cell.contentLabel3.text = [_contentList[3] objectForKey:@"name"];
    cell.contentImage.image = [UIImage imageNamed:[_contentList[0] objectForKey:@"image"]];
    cell.contentImg1.image = [UIImage imageNamed:[_contentList[1] objectForKey:@"image"]];
    cell.contentImg2.image = [UIImage imageNamed:[_contentList[2] objectForKey:@"image"]];
    cell.contentImg3.image = [UIImage imageNamed:[_contentList[3] objectForKey:@"image"]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 218.0f;
}

-(void)ToolCell:(ToolCell *)toolCell affordCarSpeciallyPreferentialClickWithBtn:(UIButton *)btn
{
    
}

-(void)ToolCell:(ToolCell *)toolCell ensureCarIndemnityClickWithBtn:(UIButton *)btn
{
    
}

-(void)ToolCell:(ToolCell *)toolCell limitMoveStandardSearchClickWithBtn:(UIButton *)btn
{
    
}

-(void)ToolCell:(ToolCell *)toolCell reckonCarPriceClickWithBtn:(UIButton *)btn
{
    
}

@end
