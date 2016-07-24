//
//  SectionTitleTableViewCell.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/24.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *titleImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;

+ (TitleCellTableViewCell *)createSectionTitleCellNib;
- (void)setTitleImage:(NSString *)image titleLab:(NSString *)text;
@end
