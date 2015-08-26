//
//  BuyCarViewController.m
//  SecondHandCar
//
//  Created by lifangli on 15/8/17.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "BuyCarViewController.h"
#import "DrawerViewController.h"

@interface BuyCarViewController ()

@end

@implementation BuyCarViewController
{
    UIView *_navigtionView;
    UIButton *_leftBtn;
    UIButton *_rightBtn;
    UISearchBar *_searchBar;
    UIView *_drawerView;
    DrawerViewController *_drawerVC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.navigationController.navigationBarHidden = YES;
    
    [self.view addSubview:[Helper view:CGRectMake(0, 0, [Helper screenWidth], 20) backgroundColor:BLUE]];
    [self createNavigationView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createNavigationView
{
    _navigtionView = [Helper view:CGRectMake(0, 20, [Helper screenWidth], 84) backgroundColor:BLUE];
    [self.view addSubview:_navigtionView];
    
    UIView *selectionView = [Helper view:CGRectMake(0, 44, [Helper screenWidth], 40) backgroundColor:[UIColor colorWithRed:243.0/255.0 green:243.0/255.0 blue:243.0/255.0 alpha:1.0]];
    selectionView.layer.borderColor = [LINECOLOR CGColor];
    selectionView.layer.borderWidth = 0.5;
    [_navigtionView addSubview:selectionView];
    
    _leftBtn = [Helper button:@"北京" image:nil frame:CGRectMake(0, 0, 70, 44) target:self action:@selector(selectionBtnClick:) textColor:[UIColor whiteColor] textFont:MIDBUTTONFONT tag:SELECTPROVINCE_TAG];
    [_navigtionView addSubview:_leftBtn];
    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake([Helper screenWidth]/2-100, 7, 200, 30)];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    [_navigtionView addSubview:_searchBar];
    
    _rightBtn = [Helper button:nil image:@"map.png" frame:CGRectMake([Helper screenWidth]-80, 0, 80, 44) target:self action:@selector(navigationRightBtnClick) textColor:nil textFont:nil tag:0];
    _rightBtn.contentEdgeInsets = UIEdgeInsetsMake(12, 46, 12, 14);
    [_navigtionView addSubview:_rightBtn];
    
    [selectionView addSubview:[Helper button:@"筛选" image:nil frame:CGRectMake([Helper screenWidth]-60, 0, 60, 40) target:self action:@selector(filterBtnclick) textColor:[UIColor lightGrayColor] textFont:LITELEBUTTONFONT tag:0]];
    
    UIView *line = [Helper view:CGRectMake([Helper screenWidth]-60, 0, 0.5, 40) backgroundColor:LINECOLOR];
    line.layer.shadowColor = [[UIColor blackColor] CGColor];
    line.layer.shadowOffset = CGSizeMake(-0.5,-0.5);
    line.layer.shadowOpacity = 0.1;
    line.layer.shadowRadius = 0.5;
    [selectionView addSubview:line];
    
    [selectionView addSubview:[Helper button:@"品牌" image:nil frame:CGRectMake(0, 0, ([Helper screenWidth]-63)/4, 40) target:self action:@selector(selectionBtnClick:) textColor:[UIColor lightGrayColor] textFont:LITELEBUTTONFONT tag:BRABD_TAG]];
    
    [selectionView addSubview:[Helper view:CGRectMake(([Helper screenWidth]-63)/4, 10, 1, 20) backgroundColor:LINECOLOR]];
    
    [selectionView addSubview:[Helper button:@"价格" image:nil frame:CGRectMake(([Helper screenWidth]-63)/4+1, 0, ([Helper screenWidth]-63)/4, 40) target:self action:@selector(selectionBtnClick:) textColor:[UIColor lightGrayColor] textFont:LITELEBUTTONFONT tag:PRICE_TAG]];
    
    [selectionView addSubview:[Helper view:CGRectMake(([Helper screenWidth]-63)/2+1, 10, 1, 20) backgroundColor:LINECOLOR]];
    
    [selectionView addSubview:[Helper button:@"里程" image:nil frame:CGRectMake(([Helper screenWidth]-63)/2+2, 0, ([Helper screenWidth]-63)/4, 40) target:self action:@selector(selectionBtnClick:) textColor:[UIColor lightGrayColor] textFont:LITELEBUTTONFONT tag:MILEAGE_TAG]];
    
    [selectionView addSubview:[Helper view:CGRectMake(([Helper screenWidth]-63)/4*3+2, 10, 1, 20) backgroundColor:LINECOLOR]];
    
    [selectionView addSubview:[Helper button:@"默认排序" image:nil frame:CGRectMake(([Helper screenWidth]-63)/4*3+3, 0, ([Helper screenWidth]-63)/4, 40) target:self action:@selector(selectionBtnClick:) textColor:[UIColor lightGrayColor] textFont:LITELEBUTTONFONT tag:TACITLYSORT_TAG]];
}

-(void)createDrawerView
{
    CGFloat drawerViewW = [Helper screenWidth]*0.8;
    _drawerView = [Helper view:CGRectMake(0, 0, [Helper screenWidth], [Helper screenHeight]) backgroundColor:[UIColor whiteColor]];
}

-(void)selectionBtnClick:(UIButton *)btn
{
    switch (btn.tag) {
        case SELECTPROVINCE_TAG:
        case PRICE_TAG:
        case BRABD_TAG:
        case MILEAGE_TAG:
        case TACITLYSORT_TAG:
            break;
        default:
            break;
    }
}

-(void)navigationRightBtnClick
{
    
}

-(void)filterBtnclick
{
    
}

@end
