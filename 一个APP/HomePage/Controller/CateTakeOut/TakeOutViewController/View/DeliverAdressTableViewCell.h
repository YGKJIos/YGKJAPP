//
//  DeliverAdressTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/13.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol modifBtnPushAddressModifVCDelegate <NSObject>

- (void)modifBtnDelegate;

@end

@interface DeliverAdressTableViewCell : UITableViewCell

@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *sexLab;
@property (nonatomic, strong)UILabel *phoneNumLab;
@property (nonatomic, strong)UILabel *addressLab;
@property (nonatomic, strong)UIButton *modifBtn;
@property (nonatomic, strong)UIButton *deleteBtn;
@property (nonatomic, assign)id<modifBtnPushAddressModifVCDelegate>delegate;

@end
