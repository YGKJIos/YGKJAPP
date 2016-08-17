//
//  AlipayTableViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/8/12.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectBtnDelegate <NSObject>


@end


@interface AlipayTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;


+ (AlipayTableViewCell *)createCell;

@property (nonatomic, assign) id <SelectBtnDelegate> delegate;

@end
