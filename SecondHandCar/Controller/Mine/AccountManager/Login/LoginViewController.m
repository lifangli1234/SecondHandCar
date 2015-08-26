//
//  LoginViewController.m
//  SecondHandCar
//
//  Created by lifangli on 15/8/26.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.loginBtn.layer.cornerRadius = 30/8;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initData
{
    self.titleStr = @"登录";
    self.hasLeftTitle = YES;
    self.leftBtnTitle = @"取消";
    self.hasRightTitle = NO;
    self.leftBtnImageName = nil;
    self.rightBtnImageName = nil;
}

-(void)navigationBarLeftBtnClick:(NavigationBar *)navBar
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)userLogin:(id)sender {
}

- (IBAction)forgetPassword:(id)sender {
}

- (IBAction)userRegister:(id)sender {
}

- (IBAction)serviceCall:(id)sender {
    NSString *phoneNumber = @"tel:01059851369";
    NSURL *phoneURL = [NSURL URLWithString:phoneNumber];
    UIWebView *phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
    [self.view addSubview:phoneCallWebView];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.userNameTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
