//
//  MessageTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/7.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MessageModel.h"

@interface MessageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *messagesLab;

- (void)messageModel:(MessageModel *)model;

@end
