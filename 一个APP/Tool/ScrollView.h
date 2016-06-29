//
//  ScrollView.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"

@interface ScrollView : UIView

+ (ScrollView *)CreateScrollViewImages:(NSArray *)images;
@property (nonatomic, strong)SDCycleScrollView *scrollView;
- (void)setScrollImage:(NSArray *)images;

@end
