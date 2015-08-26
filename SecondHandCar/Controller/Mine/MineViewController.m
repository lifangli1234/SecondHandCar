//
//  MineViewController.m
//  SecondHandCar
//
//  Created by lifangli on 15/8/17.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "MineViewController.h"
#import "MineModule.h"
#import "MyInfoCell.h"
#import "LoginViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController
{
    UITableView *_myInfoTableView;
    NSMutableArray *_myInfoListArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _myInfoListArr = [[NSMutableArray alloc] init];
    [[MineModule sharedMineModule] initMyInfoListWithArr:_myInfoListArr];
    [self crateTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initData
{
    self.titleStr = @"我的";
    self.hasLeftTitle = NO;
    self.hasRightTitle = NO;
    self.leftBtnImageName = nil;
    self.rightBtnImageName = @"my_set.png";
}

-(void)crateTableView
{
    _myInfoTableView = [[UITableView alloc] init];
    _myInfoTableView.frame = CGRectMake(0, 64, [Helper screenWidth], [Helper screenHeight]-49-64);
    _myInfoTableView.delegate = self;
    _myInfoTableView.dataSource = self;
    [self.view addSubview:_myInfoTableView];
    
    _myInfoTableView.tableHeaderView = [self tableViewHeaderView];
    _myInfoTableView.tableFooterView = [self tableViewFooterView];
}

-(UIView *)tableViewHeaderView
{
    UIView *headerView = [Helper view:CGRectMake(0, 0, [Helper screenWidth], 140) backgroundColor:LIGHTGRAY];
    
    UIView *loginView = [Helper view:CGRectMake(0, 0, [Helper screenWidth], 120) backgroundColor:[UIColor whiteColor]];
    
    [loginView addSubview:[Helper imageView:CGRectMake(22, 20, 80, 80) name:@"i_notlogin.png"]];
    
    [loginView addSubview:[Helper imageView:CGRectMake([Helper screenWidth]-32, 51, 18, 18) name:@"salecar_arrow.png"]];
    
    [loginView addSubview:[Helper label:@"个人登录" frame:CGRectMake(114, 30, 100, 25) font:[UIFont systemFontOfSize:16] textColor:[UIColor blackColor] textAligment:NSTextAlignmentLeft]];
    
    UILabel *detail = [Helper label:@"收藏、订阅与网站同步信息，发布车源不丢失" frame:CGRectMake(114, 55, 110, 40) font:[UIFont systemFontOfSize:11] textColor:[UIColor lightGrayColor] textAligment:NSTextAlignmentLeft];
    detail.numberOfLines = 2;
    detail.lineBreakMode = NSLineBreakByWordWrapping;
    [loginView addSubview:detail];
    
    [loginView addSubview:[Helper view:CGRectMake(0, 120, [Helper screenWidth], 0.5) backgroundColor:LINECOLOR]];
    
    [loginView addSubview:[Helper view:CGRectMake(0, 139.5, [Helper screenWidth], 0.5) backgroundColor:LINECOLOR]];
    
    [headerView addSubview:loginView];
    
    [headerView addSubview:[Helper button:nil image:nil frame:CGRectMake(0, 0, [Helper screenWidth], 140) target:self action:@selector(myListBtnClick:) textColor:nil textFont:nil tag:USERLOGIN_TAG]];
    
    return headerView;
}

-(UIView *)tableViewFooterView
{
    CGFloat footerViewHeight = 20;
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = LIGHTGRAY;
    
    UIView *mySaleCarView = [Helper view:CGRectMake(0, footerViewHeight, [Helper screenWidth], 176) backgroundColor:[UIColor whiteColor]];
    mySaleCarView.layer.borderColor = [LINECOLOR CGColor];
    mySaleCarView.layer.borderWidth = 0.5;
    [mySaleCarView addSubview:[Helper imageView:CGRectMake(17, 12, 20, 20) name:@"my_list_salecar.png"]];
    [mySaleCarView addSubview:[Helper label:@"我卖的车" frame:CGRectMake(46, 0, 100, 44) font:LITELEBUTTONFONT textColor:[UIColor darkGrayColor] textAligment:NSTextAlignmentLeft]];
    [mySaleCarView addSubview:[Helper view:CGRectMake([Helper screenWidth]-100.5, 8, 0.5, 28) backgroundColor:LINECOLOR]];
    [mySaleCarView addSubview:[Helper button:@"手机找车" image:nil frame:CGRectMake([Helper screenWidth]-100, 0, 100, 44) target:self action:@selector(myListBtnClick:) textColor:BLUE textFont:LITELEBUTTONFONT tag:DISCOVERCARBYPHONE_TAG]];
    [mySaleCarView addSubview:[Helper view:CGRectMake(0, 43.5, [Helper screenWidth], 0.5) backgroundColor:LINECOLOR]];
    CGFloat y = 44.0;
    NSInteger index = 0;
    NSMutableArray *nameArr = [[NSMutableArray alloc] initWithObjects:@"在售车",@"未通过",@"已售车",@"未填写",@"审核中",@"已过期", nil];
    NSMutableArray *tagArr = [[NSMutableArray alloc] initWithObjects:[NSString stringWithFormat:@"%d",ONSALECAR_TAG],[NSString stringWithFormat:@"%d",NOTPASSCAR_TAG],[NSString stringWithFormat:@"%d",HASSALECAR_TAG],[NSString stringWithFormat:@"%d",NOTWRITECOMPLETELY_TAG],[NSString stringWithFormat:@"%d",ONCHECKCAR_TAG],[NSString stringWithFormat:@"%d",OUTDATECAR_TAG],nil];
    for (int i= 0; i<3; i++) {
        CGFloat buttonX = 0;
        CGFloat numberX = [Helper screenWidth]/2-60;
        CGFloat nameX = 17.0;
        for (int j= 0; j<2; j++) {
            [mySaleCarView addSubview:[Helper label:nameArr[index] frame:CGRectMake(nameX, y, 80, 44) font:LITELEBUTTONFONT textColor:[UIColor darkGrayColor] textAligment:NSTextAlignmentLeft]];
            [mySaleCarView addSubview:[Helper label:@"0" frame:CGRectMake(numberX, y, 43, 44) font:LITELEBUTTONFONT textColor:[UIColor darkGrayColor] textAligment:NSTextAlignmentRight]];
            [mySaleCarView addSubview:[Helper button:nil image:nil frame:CGRectMake(buttonX, y, [Helper screenWidth]/2, 44) target:self action:@selector(carSate:) textColor:nil textFont:nil tag:[[tagArr objectAtIndex:index] integerValue]]];
            buttonX = buttonX + [Helper screenWidth]/2;
            nameX = nameX + [Helper screenWidth]/2;
            numberX = numberX + [Helper screenWidth]/2;
            index ++;
        }
        y = y + 44;
    }
    [mySaleCarView addSubview:[Helper view:CGRectMake(0, 87.5, [Helper screenWidth], 0.5) backgroundColor:LINECOLOR]];
    [mySaleCarView addSubview:[Helper view:CGRectMake(0, 131.5, [Helper screenWidth], 0.5) backgroundColor:LINECOLOR]];
    [mySaleCarView addSubview:[Helper view:CGRectMake([Helper screenWidth]/2, 44, 0.5, 132) backgroundColor:LINECOLOR]];
    [footerView addSubview:mySaleCarView];
    
    footerViewHeight = footerViewHeight + 196;
    
    UIView *feedBackView = [Helper view:CGRectMake(0, footerViewHeight, [Helper screenWidth], 44) backgroundColor:[UIColor whiteColor]];
    feedBackView.layer.borderColor = [LIGHTGRAY CGColor];
    feedBackView.layer.borderWidth = 0.5;
    [feedBackView addSubview:[Helper imageView:CGRectMake(17, 12, 20, 20) name:@"my_list_feedback.png"]];
    [feedBackView addSubview:[Helper label:@"用户反馈" frame:CGRectMake(46, 0, 100, 44) font:LITELEBUTTONFONT textColor:[UIColor darkGrayColor] textAligment:NSTextAlignmentLeft]];
    [feedBackView addSubview:[Helper imageView:CGRectMake([Helper screenWidth]-30, 14, 16, 16) name:@"salecar_arrow.png"]];
    [feedBackView addSubview:[Helper button:nil image:nil frame:CGRectMake(0, 0, [Helper screenWidth], 44) target:self action:@selector(myListBtnClick:) textColor:nil textFont:nil tag:USERFEEDBACK_TAG]];
    [footerView addSubview:feedBackView];
    
    footerViewHeight = footerViewHeight + 64;
    
    UIView *callView = [Helper view:CGRectMake(0, footerViewHeight, [Helper screenWidth], 60) backgroundColor:[UIColor whiteColor]];
    callView.layer.borderColor = [LIGHTGRAY CGColor];
    callView.layer.borderWidth = 0.5;
    [callView addSubview:[Helper imageView:CGRectMake(17, 15, 90, 30) name:@"my_jj_logo.png"]];
    UILabel *number = [Helper label:@"查看家家好车订单信息请拔打联系电话：400-868-9998" frame:CGRectMake(118, 0, 145, 60) font:[UIFont systemFontOfSize:11] textColor:[UIColor blackColor] textAligment:NSTextAlignmentLeft];
    number.numberOfLines = 2;
    number.lineBreakMode = NSLineBreakByWordWrapping;
    [callView addSubview:number];
    [callView addSubview:[Helper imageView:CGRectMake([Helper screenWidth]-43, 20, 20, 20) name:@"my_list_phone.png"]];
    [callView addSubview:[Helper button:nil image:nil frame:CGRectMake(0, 0, [Helper screenWidth], 60) target:self action:@selector(myListBtnClick:) textColor:nil textFont:nil tag:MAKEPHONECALL_TAG]];
    [footerView addSubview:callView];
    
    footerViewHeight = footerViewHeight + 80;
    
    UIView *ownerView = [Helper view:CGRectMake(0, footerViewHeight, [Helper screenWidth], 44) backgroundColor:[UIColor whiteColor]];
    ownerView.layer.borderColor = [LIGHTGRAY CGColor];
    ownerView.layer.borderWidth = 0.5;
    [ownerView addSubview:[Helper imageView:CGRectMake(17, 12, 20, 20) name:@"my_list_business.png"]];
    [ownerView addSubview:[Helper label:@"我是商家" frame:CGRectMake(46, 0, 100, 44) font:LITELEBUTTONFONT textColor:[UIColor darkGrayColor] textAligment:NSTextAlignmentLeft]];
    [ownerView addSubview:[Helper label:@"收车多，卖车快，轻松赚钱" frame:CGRectMake([Helper screenWidth]-180, 0, 136, 44) font:[UIFont systemFontOfSize:11] textColor:[UIColor darkGrayColor] textAligment:NSTextAlignmentRight]];
    [ownerView addSubview:[Helper imageView:CGRectMake([Helper screenWidth]-30, 14, 16, 16) name:@"salecar_arrow.png"]];
    [ownerView addSubview:[Helper button:nil image:nil frame:CGRectMake(0, 0, [Helper screenWidth], 44) target:self action:@selector(myListBtnClick:) textColor:nil textFont:nil tag:BUSINESS_TAG]];
    [footerView addSubview:ownerView];
    
    footerViewHeight = footerViewHeight + 44;
    
    [footerView addSubview:[Helper label:@"如有任何问题请在8:30-17:30联系" frame:CGRectMake(20, footerViewHeight +22, 160, 20) font:[UIFont systemFontOfSize:10] textColor:[UIColor lightGrayColor] textAligment:NSTextAlignmentLeft]];
    [footerView addSubview:[Helper label:@"二手车之家服务电话：010-59851369" frame:CGRectMake(20, footerViewHeight +38, 180, 20) font:[UIFont systemFontOfSize:10] textColor:[UIColor blackColor] textAligment:NSTextAlignmentLeft]];
    [footerView addSubview:[Helper view:CGRectMake([Helper screenWidth]-80, footerViewHeight +20, 0.5, 40) backgroundColor:LINECOLOR]];
    UIButton *serviceBtn = [Helper button:nil image:@"merchant_home_tel_btn_icon.png" frame:CGRectMake([Helper screenWidth]-80, footerViewHeight, 80, 80) target:self action:@selector(myListBtnClick:) textColor:nil textFont:nil tag:MAKESERVICECALL_TAG];
    serviceBtn.contentEdgeInsets = UIEdgeInsetsMake(22, 22, 22, 22);
    [footerView addSubview:serviceBtn];
    
    footerViewHeight = footerViewHeight +80;
    
    footerView.frame = CGRectMake(0, 0, [Helper screenWidth], footerViewHeight);
    return footerView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _myInfoListArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyInfoCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"MyInfoCell" owner:self options:nil] lastObject];
    cell.infoImg.image = [UIImage imageNamed:[[_myInfoListArr objectAtIndex:indexPath.row] objectForKey:@"image"]];
    cell.unfoLabel.text = [[_myInfoListArr objectAtIndex:indexPath.row] objectForKey:@"name"];
    if (indexPath.row == 0) {
        cell.infoDetailLabel.hidden = NO;
        cell.infoDetailLabel.text = @"0";
    }
    else{
        cell.infoDetailLabel.hidden = YES;
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

-(void)carSate:(UIButton *)btn
{
    
}

-(void)myListBtnClick:(UIButton *)btn
{
    switch (btn.tag) {
        case MAKESERVICECALL_TAG:
        case MAKEPHONECALL_TAG:
        {
            NSString *phoneNumber = btn.tag == MAKEPHONECALL_TAG?@"tel:4008689998":@"tel:01059851369";
            NSURL *phoneURL = [NSURL URLWithString:phoneNumber];
            UIWebView *phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
            [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
            [self.view addSubview:phoneCallWebView];
        }
            break;
        case USERLOGIN_TAG:
            [self presentViewController:[[LoginViewController alloc] init] animated:YES completion:nil];
            break;
        case DISCOVERCARBYPHONE_TAG:{
            
        }
            break;
        case USERFEEDBACK_TAG:{
            
        }
            break;
        case BUSINESS_TAG:{
            
        }
            break;
        default:
            break;
    }
}

@end
