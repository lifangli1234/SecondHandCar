//
//  TacticViewController.m
//  SecondHandCar
//
//  Created by lifangli on 15/8/17.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "TacticViewController.h"
#import "TacticCell.h"

@interface TacticViewController ()

@end

@implementation TacticViewController
{
    UITableView *_allArticleTableView;
    UITableView *_buyCarKnowledgeTableView;
    UITableView *_policyRulesTableView;
    UITableView *_industryInformationTableView;
    NSMutableArray *_newListArr;
    UIView *_titleLineView;
    UIScrollView *_newListScr;
    UIView *_titleView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createTitleView];
    [self createNewListScrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initData
{
    self.titleStr = @"攻略";
    self.hasLeftTitle = NO;
    self.hasRightTitle = NO;
    self.leftBtnImageName = nil;
    self.rightBtnImageName = nil;
}

-(void)createTitleView
{
    _titleView = [Helper view:CGRectMake(0, 64, [Helper screenWidth], 35) backgroundColor:[UIColor whiteColor]];
    _titleView.layer.borderColor = [LINECOLOR CGColor];
    _titleView.layer.borderWidth = 0.5;
    [self.view addSubview:_titleView];
    
    NSArray *titleArr = [[NSArray alloc] initWithObjects:@"全部文章",@"购车常识",@"政策法规",@"行业资讯", nil];
    for (int i=0; i<4; i++) {
        UIButton *titleBtn = [Helper button:titleArr[i] image:nil frame:CGRectMake([Helper screenWidth]/4*i, 0, [Helper screenWidth]/4, 35) target:self action:@selector(titleBtn:) textColor:[UIColor darkGrayColor] textFont:MIDBUTTONFONT tag:TACTICTITLEBTN_TAG+i];
        [titleBtn setTitleColor:BLUE forState:UIControlStateSelected];
        if (i==0) {
            titleBtn.selected = YES;
        }
        [_titleView addSubview:titleBtn];
    }
    
    _titleLineView = [Helper view:CGRectMake(([Helper screenWidth]/4-64)/2, 30, 64, 5) backgroundColor:BLUE];
    [_titleView addSubview:_titleLineView];
}

-(void)createNewListScrollView
{
    _newListScr = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 99, [Helper screenWidth], [Helper screenHeight]-49-99)];
    _newListScr.backgroundColor = [UIColor clearColor];
    _newListScr.contentSize = CGSizeMake([Helper screenWidth]*4, [Helper screenHeight]-49-99);
    _newListScr.showsHorizontalScrollIndicator = NO;
    _newListScr.bounces = NO;
    _newListScr.delegate = self;
    _newListScr.pagingEnabled = YES;
    [self.view addSubview:_newListScr];
    
    _allArticleTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [Helper screenWidth], [Helper screenHeight]-49-99)];
    _allArticleTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _allArticleTableView.delegate = self;
    _allArticleTableView.dataSource = self;
    [_newListScr addSubview:_allArticleTableView];
    
    _buyCarKnowledgeTableView = [[UITableView alloc] initWithFrame:CGRectMake([Helper screenWidth], 0, [Helper screenWidth], [Helper screenHeight]-49-99)];
    _buyCarKnowledgeTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _buyCarKnowledgeTableView.delegate = self;
    _buyCarKnowledgeTableView.dataSource = self;
    [_newListScr addSubview:_buyCarKnowledgeTableView];
    
    _policyRulesTableView = [[UITableView alloc] initWithFrame:CGRectMake([Helper screenWidth]*2, 0, [Helper screenWidth], [Helper screenHeight]-49-99)];
    _policyRulesTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _policyRulesTableView.delegate = self;
    _policyRulesTableView.dataSource = self;
    [_newListScr addSubview:_policyRulesTableView];
    
    _industryInformationTableView = [[UITableView alloc] initWithFrame:CGRectMake([Helper screenWidth]*3, 0, [Helper screenWidth], [Helper screenHeight]-49-99)];
    _industryInformationTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _industryInformationTableView.delegate = self;
    _industryInformationTableView.dataSource = self;
    [_newListScr addSubview:_industryInformationTableView];
}

#pragma ------------titleBtnAction-------------
-(void)titleBtn:(UIButton *)btn
{
    [_newListScr setContentOffset:CGPointMake([Helper screenWidth]*(btn.tag-TACTICTITLEBTN_TAG), 0) animated:YES];
    [UIView animateWithDuration:0.2 animations:^{
        _titleLineView.frame = CGRectMake(([Helper screenWidth]/4-64)/2+[Helper screenWidth]/4*(btn.tag-TACTICTITLEBTN_TAG), 30, 64, 5);
    } completion:^(BOOL finished) {
        nil;
    }];
    for (UIView *view in _titleView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *currBtn = (UIButton *)view;
            if (currBtn.tag == btn.tag) {
                currBtn.selected = YES;
            }
            else{
                currBtn.selected = NO;
            }
        }
    }
}

#pragma ------------scrollViewDelegate---------
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger offset = scrollView.contentOffset.x/[Helper screenWidth];
    [UIView animateWithDuration:0.2 animations:^{
        _titleLineView.frame = CGRectMake(([Helper screenWidth]/4-64)/2+[Helper screenWidth]/4*offset, 30, 64, 5);
    } completion:^(BOOL finished) {
        nil;
    }];
    for (UIView *view in _titleView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *currBtn = (UIButton *)view;
            if (currBtn.tag == TACTICTITLEBTN_TAG+offset) {
                currBtn.selected = YES;
            }
            else{
                currBtn.selected = NO;
            }
        }
    }
}

#pragma ------------tableViewDelegate----------
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _allArticleTableView) {
        return 3;
    }
    else if (tableView == _policyRulesTableView){
        return 4;
    }
    else if (tableView == _buyCarKnowledgeTableView){
        return 5;
    }
    else{
        return 6;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"cell";
    TacticCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TacticCell" owner:self options:nil] lastObject];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0f;
}

@end
