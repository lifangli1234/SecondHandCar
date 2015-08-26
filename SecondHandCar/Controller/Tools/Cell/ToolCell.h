//
//  ToolCell.h
//  SecondHandCar
//
//  Created by lifangli on 15/8/19.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ToolCellDelegate;

@interface ToolCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *contentImage;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel1;
@property (weak, nonatomic) IBOutlet UIImageView *contentImg1;
@property (weak, nonatomic) IBOutlet UIImageView *contentImg2;
@property (weak, nonatomic) IBOutlet UIImageView *contentImg3;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel2;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel3;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;

@property (weak, nonatomic) id<ToolCellDelegate>delegate;

- (IBAction)reckonCarPrice:(id)sender;
- (IBAction)limitMoveStandardSearch:(id)sender;
- (IBAction)ensureCarIndemnity:(id)sender;
- (IBAction)affordCarSpeciallyPreferential:(id)sender;

@end

@protocol ToolCellDelegate <NSObject>

-(void)ToolCell:(ToolCell *)toolCell reckonCarPriceClickWithBtn:(UIButton *)btn;
-(void)ToolCell:(ToolCell *)toolCell limitMoveStandardSearchClickWithBtn:(UIButton *)btn;
-(void)ToolCell:(ToolCell *)toolCell ensureCarIndemnityClickWithBtn:(UIButton *)btn;
-(void)ToolCell:(ToolCell *)toolCell affordCarSpeciallyPreferentialClickWithBtn:(UIButton *)btn;

@end
