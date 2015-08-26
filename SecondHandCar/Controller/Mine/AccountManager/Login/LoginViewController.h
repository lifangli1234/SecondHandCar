//
//  LoginViewController.h
//  SecondHandCar
//
//  Created by lifangli on 15/8/26.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "RootViewController.h"

@interface LoginViewController : RootViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *userNameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)userLogin:(id)sender;
- (IBAction)forgetPassword:(id)sender;
- (IBAction)userRegister:(id)sender;
- (IBAction)serviceCall:(id)sender;
@end
