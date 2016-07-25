//
//  PlayerCollectionViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/24.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayerCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *playerImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *voteNum;
@property (weak, nonatomic) IBOutlet UILabel *worksContent;
- (IBAction)voteBtn:(id)sender;

@end
