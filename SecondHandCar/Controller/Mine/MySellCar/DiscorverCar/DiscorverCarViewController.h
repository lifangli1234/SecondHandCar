//
//  DiscorverCarViewController.h
//  SecondHandCar
//
//  Created by lifangli on 15/8/26.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "RootViewController.h"

@interface DiscorverCarViewController : RootViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *mobileTF;
@property (weak, nonatomic) IBOutlet UITextField *textNumberTF;
@property (weak, nonatomic) IBOutlet UIButton *getTextNumberBtn;
@property (weak, nonatomic) IBOutlet UIButton *confrimBtn;
- (IBAction)getTextNmber:(id)sender;
- (IBAction)confrim:(id)sender;
- (IBAction)serviceCall:(id)sender;
@end
