//
//  ToolCell.m
//  SecondHandCar
//
//  Created by lifangli on 15/8/19.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "ToolCell.h"

@implementation ToolCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)reckonCarPrice:(id)sender {
    if ([self.delegate respondsToSelector:@selector(ToolCell:reckonCarPriceClickWithBtn:)]) {
        [self.delegate ToolCell:self reckonCarPriceClickWithBtn:self.btn];
    }
}

- (IBAction)limitMoveStandardSearch:(id)sender {
    if ([self.delegate respondsToSelector:@selector(ToolCell:limitMoveStandardSearchClickWithBtn:)]) {
        [self.delegate ToolCell:self limitMoveStandardSearchClickWithBtn:self.btn1];
    }
}

- (IBAction)ensureCarIndemnity:(id)sender {
    if ([self.delegate respondsToSelector:@selector(ToolCell:ensureCarIndemnityClickWithBtn:)]) {
        [self.delegate ToolCell:self ensureCarIndemnityClickWithBtn:self.btn2];
    }
}

- (IBAction)affordCarSpeciallyPreferential:(id)sender {
    if ([self.delegate respondsToSelector:@selector(ToolCell:affordCarSpeciallyPreferentialClickWithBtn:)]) {
        [self.delegate ToolCell:self affordCarSpeciallyPreferentialClickWithBtn:self.btn3];
    }
}
@end
