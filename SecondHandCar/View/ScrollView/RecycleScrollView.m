//
//  RecycleScrollView.m
//  SecondHandCar
//
//  Created by lifangli on 15/8/27.
//  Copyright (c) 2015年 lifangli. All rights reserved.
//

#import "RecycleScrollView.h"

@implementation RecycleScrollView
{
    UIView *_fristView;
    UIView *_midView;
    UIView *_lastView;
    
    CGFloat _viewWidth;
    CGFloat _viewHeight;
    
    NSTimer *_autoScrollTimer;
    
    UITapGestureRecognizer *_tap;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _viewWidth = self.bounds.size.width;
        _viewHeight = self.bounds.size.height;
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, _viewWidth, _viewHeight)];
        self.scrollView.delegate = self;
        self.scrollView.contentSize = CGSizeMake(_viewWidth*3, _viewHeight);
        self.scrollView.pagingEnabled = YES;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.scrollView];
        
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, _viewHeight-30, _viewWidth, 30)];
        self.pageControl.userInteractionEnabled = NO;
        self.pageControl.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.pageControl];
        
        _tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
        _tap.numberOfTapsRequired = 1;
        _tap.numberOfTouchesRequired = 1;
        [_scrollView addGestureRecognizer:_tap];
    }
    return self;
}

-(void)handleTap:(UITapGestureRecognizer *)tap
{
    if ([self.delegate respondsToSelector:@selector(RecycleScrollView:didClickPageAtIndex:)]) {
        [self.delegate RecycleScrollView:self didClickPageAtIndex:self.currentPage + 1];
    }
}

-(void)setImageArr:(NSMutableArray *)imageArr
{
    if (imageArr) {
        _imageArr = imageArr;
        _currentPage = 0;
        _pageControl.numberOfPages = _imageArr.count;
    }
    [self reloadData];
}

-(void)reloadData
{
    [_fristView removeFromSuperview];
    [_midView removeFromSuperview];
    [_lastView removeFromSuperview];
    
    if (_currentPage==0) {
        _fristView = [_imageArr lastObject];
        _midView = [_imageArr objectAtIndex:_currentPage];
        _lastView = [_imageArr objectAtIndex:_currentPage+1];
    }
    else if (_currentPage == _imageArr.count-1)
    {
        _fristView = [_imageArr objectAtIndex:_currentPage-1];
        _midView = [_imageArr objectAtIndex:_currentPage];
        _lastView = [_imageArr firstObject];
    }
    else
    {
        _fristView = [_imageArr objectAtIndex:_currentPage-1];
        _midView = [_imageArr objectAtIndex:_currentPage];
        _lastView = [_imageArr objectAtIndex:_currentPage+1];
    }
    
    _fristView.frame = CGRectMake(0, 0, _viewWidth, _viewWidth);
    _midView.frame = CGRectMake(_viewWidth, 0, _viewWidth, _viewWidth);
    _lastView.frame = CGRectMake(_viewWidth*2, 0, _viewWidth, _viewWidth);
    [_scrollView addSubview:_fristView];
    [_scrollView addSubview:_midView];
    [_scrollView addSubview:_lastView];
    
    _pageControl.currentPage = _currentPage;
    
    _scrollView.contentOffset = CGPointMake(_viewWidth, 0);
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [_autoScrollTimer invalidate];
    _autoScrollTimer = nil;
    _autoScrollTimer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(autoShowNextImage) userInfo:nil repeats:YES];
    
    float x = _scrollView.contentOffset.x;
    if (x<=0) {
        if (_currentPage-1<0) {
            _currentPage = _imageArr.count-1;
        }else{
            _currentPage --;
        }
    }
    if (x>=_viewWidth*2) {
        if (_currentPage==_imageArr.count-1) {
            _currentPage = 0;
        }else{
            _currentPage ++;
        }
    }
    
    [self reloadData];
}

-(void)shouldAutoShow:(BOOL)shouldStart
{
    if (shouldStart)  //开启自动翻页
    {
        if (!_autoScrollTimer) {
            _autoScrollTimer = [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(autoShowNextImage) userInfo:nil repeats:YES];
        }
    }
    else   //关闭自动翻页
    {
        if (_autoScrollTimer.isValid) {
            [_autoScrollTimer invalidate];
            _autoScrollTimer = nil;
        }
    }
}

-(void)autoShowNextImage
{
    if (_currentPage == _imageArr.count-1) {
        _currentPage = 0;
    }else{
        _currentPage ++;
    }
    
    [self reloadData];
}

@end
