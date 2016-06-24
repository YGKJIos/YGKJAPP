//
//  FirstTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/18.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "FirstTableViewCell.h"

#define width self.width /375

@implementation FirstTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        int num = 0;
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 4; j++) {
                UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(25+j*(50+40), 25+i*(67+20), 50, 67)];
                imageView.tag = 1000+(num++);
                [imageView setUserInteractionEnabled:YES];
                
                [self.contentView addSubview:imageView];
                
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageViewAction:)];
                [imageView addGestureRecognizer:tap];
            }
        }
    }
    return self;
}

- (void)tapImageViewAction:(UITapGestureRecognizer *)tap
{
    [self.delegate pushViewController];

    NSLog(@"111");
}

-(void)setFirstCellImage:(NSArray *)images
{
    for (int i = 0; i < images.count; i++) {
        UIImageView *image = [self.contentView viewWithTag:1000+i];
        image.image = [UIImage imageNamed:images[i]];
        
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
