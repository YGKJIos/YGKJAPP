//
//  PlaceOrderTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/8/10.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol voucherBtnDelegate <NSObject>

@end

@interface PlaceOrderTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *djqBtn;

+ (PlaceOrderTableViewCell *)createCell;

@property (nonatomic, assign) id<voucherBtnDelegate>delegate;

@end
