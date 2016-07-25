//
//  PlayerCollectionViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/24.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "PlayerCollectionViewCell.h"

@implementation PlayerCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)voteBtn:(id)sender {
    [sender setBackgroundImage:[UIImage imageNamed:@"learn_selectVote"] forState:UIControlStateNormal];
}
@end
