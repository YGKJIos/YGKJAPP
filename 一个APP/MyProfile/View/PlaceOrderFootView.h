//
//  PlaceOrderFootView.h
//  一个APP
//
//  Created by 远古科技 on 16/8/11.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol PayBtnDelegate <NSObject>



@end

@interface PlaceOrderFootView : UIView

@property (weak, nonatomic) IBOutlet UIButton *payBtn;

+ (PlaceOrderFootView *)createCell;

@property (nonatomic, assign)id<PayBtnDelegate>delegate;

@end
