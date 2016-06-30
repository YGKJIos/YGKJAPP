//
//  SecondTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/18.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "SecondTableViewCell.h"

@implementation SecondTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        int num = 0;
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 3; j++) {
                UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(58+j*(51+55), 25+i*(58+20), 51, 58)];
                imageView.tag = 1000+(num++);
                [imageView setUserInteractionEnabled:YES];
                //                imageView.backgroundColor = [UIColor redColor];
                [self.contentView addSubview:imageView];
                
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageViewAction:)];
                //                tap.numberOfTapsRequired = 1;
                [imageView addGestureRecognizer:tap];
            }
        }
    }
    return self;
}



- (void)tapImageViewAction:(UITapGestureRecognizer *)tap
{
    UIImageView *image = (UIImageView *)tap.view;
    [self.delegate SecondPushViewControllerNum:image.tag];
    NSLog(@"222");
}

-(void)setSecondCellImage:(NSArray *)images
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
