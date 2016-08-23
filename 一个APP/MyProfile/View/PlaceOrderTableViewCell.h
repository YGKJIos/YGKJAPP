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
// 减少数量按钮
@property (weak, nonatomic) IBOutlet UIButton *reduceBtn;
// 增加数量按钮
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
// 数量
@property (weak, nonatomic) IBOutlet UILabel *numLbl;

@property (nonatomic, assign) id<voucherBtnDelegate>delegate;

@end
