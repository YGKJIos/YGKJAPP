//
//  ScrollView.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "ScrollView.h"



@implementation ScrollView

+ (ScrollView *)CreateScrollViewImages:(NSArray *)images
{
    ScrollView *view = [[ScrollView alloc]init];
    view.frame = CGRectMake(0, 0, WIDTH, 150);
    
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int i = 0; i < images.count; i++) {
        UIImage *image = [UIImage imageNamed:images[i]];
        [arr addObject:image];
    }
    
    
    view.scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, WIDTH, 150) imagesGroup:arr];
    // 是否无限循环
    view.scrollView.infiniteLoop = YES;
    // pageControl样式
    view.scrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    view.scrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    
    // 轮播图上的文字
    //    scrollView.titlesGroup = titles;
    // 分页控件图标
    view.scrollView.dotColor = [UIColor cyanColor];
    
    // 循环时间间隔,默认2.0s
    view.scrollView.autoScrollTimeInterval = 2.0;
    [view addSubview:view.scrollView];
    return view;
}
- (void)setScrollImage:(NSArray *)images
{
    
}


@end
