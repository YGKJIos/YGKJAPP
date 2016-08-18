//
//  SetNameViewController.h
//  一个APP
//
//  Created by 远古科技 on 16/8/16.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>


// (1).声明一套协议
@protocol SecondViewControllerDelete <NSObject>

- (void)bringStr:(NSString *)str;

@end

@interface SetNameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameField;


// 1.写一个类型相符合的属性,来接受结果
@property(nonatomic, copy)NSString *str;

// (2).设置代理人的属性
@property(nonatomic, assign)id<SecondViewControllerDelete>delegate;


@end
