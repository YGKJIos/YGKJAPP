//
//  PaymentTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/8/11.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ByValueDelegate <NSObject>


@end


@interface PaymentTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;

@property (nonatomic, copy) NSString *str;// 接收name


@property (nonatomic, assign) id<ByValueDelegate>delegate;

+ (PaymentTableViewCell *)createCell;


@end
