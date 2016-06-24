//
//  HomeModelView.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/17.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    foodModelStyle,  // 美食风格
    ordinaryModelStyle, // 普通风格
    travelModelStyle,  // 畅游周边
    inviteModelStyle  // 热门招聘
    
}ViewStyle;

@interface HomeModelView : UIView


+ (HomeModelView *)foodModelStyleView;  //美食View

+ (HomeModelView *)travelModelStyleView; // 旅游View

+ (HomeModelView *)inviteModelStyleView; //热门招聘

- (void)ordinaryModelStyle;  // 普通风格

+ (HomeModelView *)secondHandModelStyle; //二手置换

- (void)setModelViewStyle:(ViewStyle)style; // 页面的风格
- (void)setModelImageViewName:(NSString *)image title:(NSString *)title;

@end
