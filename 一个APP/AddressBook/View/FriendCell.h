//
//  FriendCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/11.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendModel.h"

@interface FriendCell : UITableViewCell
// 好友头像
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
// 好友昵称
@property (weak, nonatomic) IBOutlet UILabel *nameLab;

+ (id)createFriendCell;
- (void)setFriendModel:(FriendModel *)model;

@end
