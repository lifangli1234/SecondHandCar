//
//  DiscorverCarViewController.m
//  SecondHandCar
//
//  Created by lifangli on 15/8/26.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "DiscorverCarViewController.h"

@interface DiscorverCarViewController ()

@end

@implementation DiscorverCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.getTextNumberBtn.layer.cornerRadius = 25/8;
    self.confrimBtn.layer.cornerRadius = 30/8;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initData
{
    self.titleStr = @"手机号查找车辆";
    self.hasLeftTitle = YES;
    self.leftBtnTitle = @"取消";
    self.hasRightTitle = NO;
    self.leftBtnImageName = nil;
    self.rightBtnImageName = nil;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.mobileTF resignFirstResponder];
    [self.textNumberTF resignFirstResponder];
}

-(void)navigationBarLeftBtnClick:(NavigationBar *)navBar
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)getTextNmber:(id)sender {
}

- (IBAction)confrim:(id)sender {
}

- (IBAction)serviceCall:(id)sender {
}
@end
