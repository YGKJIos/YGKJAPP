//
//  AllStylCollectionViewCell.h
//  一个APP
//
//  Created by 远古科技 on 16/6/29.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllStylCollectionViewCell : UICollectionViewCell

@property (nonatomic, retain) UIImageView *foodImage;
@property (nonatomic, retain) UILabel *nanmeLabel;

- (void)setImages:(NSString *)image titles:(NSString *)title;


@end
