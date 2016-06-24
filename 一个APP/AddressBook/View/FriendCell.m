//
//  FriendCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/11.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "FriendCell.h"

@implementation FriendCell

+(id)createFriendCell
{
    FriendCell *cell = [[NSBundle mainBundle]loadNibNamed:@"FriendCell" owner:nil options:nil].lastObject;
    return cell;
}

-(void)setFriendModel:(FriendModel *)model
{
//    self.headImage.image = [UIImage imageNamed:model.image];
//    self.nameLab.text = model.name;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
