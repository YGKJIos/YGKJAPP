//
//  ScrollTool.m
//  ScrollView
//
//  Created by 梁立彬 on 16/6/7.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "ScrollTool.h"
#define Width self.frame.size.width

#define Height self.frame.size.height


static NSUInteger currentImage = 1;//记录中间图片的下标,开始总是为1
@interface ScrollTool ()<UIScrollViewDelegate>
@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)NSMutableArray *imageNameArray;
@property (nonatomic, strong)UIPageControl *pageCon;
@property (nonatomic, strong)UIImageView *leftImageView;
@property (nonatomic, strong)UIImageView  *centerImageView;
@property (nonatomic, strong)UIImageView *rightImageView;
@property (nonatomic, assign)BOOL isTimeUp;
@property (nonatomic, strong)NSTimer *moveTime;

@end

@implementation ScrollTool

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(void)imageArray:(NSMutableArray *)imagesArr
{
    self.imageNameArray = imagesArr;
    [self addScrollView];
    [self addPageControl];
    [self addTimer];
}
-(void)addTimer{
    _moveTime = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(imageRollTimer) userInfo:nil repeats:YES];
    _isTimeUp = NO;
    
}
- (void)imageRollTimer
{
    [self.scrollView setContentOffset:CGPointMake(Width *2, 0) animated:YES];
    _isTimeUp = YES;
    [NSTimer scheduledTimerWithTimeInterval:0.4f target:self selector:@selector(scrollViewDidEndDecelerating:) userInfo:nil repeats:NO];
}
- (void)addPageControl
{
    CGFloat x = self.frame.size.width;
    CGFloat y = self.frame.size.height;
    self.pageCon = [[UIPageControl alloc]initWithFrame:CGRectMake(x/2 -(20*_imageNameArray.count/2), y-40, 20*_imageNameArray.count, 40)];
    self.pageCon.enabled = NO;
//    self.pageCon.backgroundColor = [UIColor grayColor];
    self.pageCon.numberOfPages = _imageNameArray.count;
//    [self.pageCon addTarget:self action:@selector(pageAction:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_pageCon];
}
- (void)addScrollView
{
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.scrollView.contentSize = CGSizeMake(3*Width, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.backgroundColor = [UIColor redColor];
    [self addSubview:self.scrollView];
    
    
    _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, Width , Height)];
    _leftImageView.image = [UIImage imageNamed:_imageNameArray[0]];
    [self.scrollView addSubview:_leftImageView];
    
    _centerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(Width, 0, Width, Height)];
    _centerImageView.image = [UIImage imageNamed:_imageNameArray[1]];
    [self.scrollView addSubview:_centerImageView];
    
    _rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(Width*2, 0, Width, Height)];
    _rightImageView.image = [UIImage imageNamed:_imageNameArray[2]];
    [self.scrollView addSubview:_rightImageView];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    if (_scrollView.contentOffset.x == 0)
    {
        currentImage = (currentImage-1)%_imageNameArray.count;
        _pageCon.currentPage = (_pageCon.currentPage - 1)%_imageNameArray.count;
    }
    else if(_scrollView.contentOffset.x == Width * 2)
    {
        currentImage = (currentImage+1)%_imageNameArray.count;
        _pageCon.currentPage = (_pageCon.currentPage +1)%_imageNameArray.count;
    }
    else
    {
        self.pageCon.currentPage = currentImage;
        return;
    }
//    NSLog(@"%ld",(currentImage-1)%_imageNameArray.count);
//    
//    NSLog(@"%ld",(currentImage+1)%_imageNameArray.count);
    _leftImageView.image = [UIImage imageNamed:_imageNameArray[(currentImage-1)%_imageNameArray.count]];
    
    
    _centerImageView.image = [UIImage imageNamed:_imageNameArray[currentImage%_imageNameArray.count]];

    
    _rightImageView.image = [UIImage imageNamed:_imageNameArray[(currentImage+1)%_imageNameArray.count]];
    
    _scrollView.contentOffset = CGPointMake(Width, 0);
    
    if (!_isTimeUp) {
        [_moveTime setFireDate:[NSDate dateWithTimeIntervalSinceNow:3]];
    }
    _isTimeUp = NO;
}



@end
