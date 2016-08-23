//
//  FictionTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/22.
//  Copyright © 2016年 llb. All rights reserved.
//

@protocol orderDelegate <NSObject>

- (void) orderDelegate;

@end

@protocol twoBtnDelegate <NSObject>

- (void) twoDelegate;

@end

@protocol thirdBtnDelegate <NSObject>

- (void) thirdDelegate;

@end

#import <UIKit/UIKit.h>
// 我的模块   第一行cell

@interface FictionTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIButton *fictionBnt;
@property (weak, nonatomic) IBOutlet UILabel *numLab;

@property (nonatomic, assign) id<orderDelegate>delegate;

@property (nonatomic, assign) id<twoBtnDelegate>twoDelegate;

@property (nonatomic, assign) id<thirdBtnDelegate>thirdDelegate;

@end
