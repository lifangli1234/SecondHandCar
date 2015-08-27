//
//  RecycleScrollView.h
//  SecondHandCar
//
//  Created by lifangli on 15/8/27.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RecycleScrollViewDelegate;

@interface RecycleScrollView : UIView<UIScrollViewDelegate>

@property (weak, nonatomic) id<RecycleScrollViewDelegate>delegate;
@property (assign, nonatomic) NSInteger currentPage;
@property (strong, nonatomic) NSMutableArray *imageArr;
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIPageControl *pageControl;

-(void)shouldAutoShow:(BOOL)shouldStart;

@end

@protocol RecycleScrollViewDelegate <NSObject>

-(void)RecycleScrollView:(RecycleScrollView *)recycleScrollView didClickPageAtIndex:(NSInteger)index;

@end
