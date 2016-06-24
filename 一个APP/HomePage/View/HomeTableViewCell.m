//
//  HomeTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/17.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "HomeModelView.h"

@implementation HomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}
-(void)setHomeCellModelView:(NSArray *)modelArr
{
    if (self.style == fooderHomeTableViewCell) {
        [self CreateFooderHomeCell:modelArr];
    }else if (self.style == cityHomeTableViewCell){
        [self CreateCityHomeCell:modelArr];
    }else if (self.style == imageHomeTableViewCell){
        [self CreateImageCell:modelArr];
    }
    
}
- (void)CreateFooderHomeCell:(NSArray *)arr{
    for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 2; j++) {
            HomeModelView *view = [[HomeModelView alloc]initWithFrame:CGRectMake(20+i*50+i*20, 20+j*50, 50, 67)];
            [view setModelImageViewName:@"shouye_meishi" title:nil];
            view.backgroundColor = [UIColor redColor];
            [self.contentView addSubview:view];
        }
    }
}
- (void)CreateCityHomeCell:(NSArray *)arr{
    for (int i = 0; i < 3; i++) {
        for (int i = 0; i < 2; i++) {
            HomeModelView *view = [[HomeModelView alloc]initWithFrame:CGRectMake(50+i*50, 15, 50, 67)];
            [self.contentView addSubview:view];
        }
    }
}
- (void)CreateImageCell:(NSArray *)arr{
    for (int i = 0; i < 3; i++) {
        for (int i = 0; i < 2; i++) {
            HomeModelView *view = [[HomeModelView alloc]initWithFrame:CGRectMake(50+i*50, 15, 50, 67)];
            [self.contentView addSubview:view];
        }
    }
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 145, self.contentView.width, 118)];
    imageView.image = [UIImage imageNamed:[arr lastObject]];
    [self.contentView addSubview:imageView];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
