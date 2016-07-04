//
//  FirstTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/18.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "FirstTableViewCell.h"

#define width self.width
#define height self.height

@implementation FirstTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    // CGRectMake(width/4-50, 25+i*(67+20), 50, 67)
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        int num = 0;
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 4; j++) {
                UIImageView *imageView = [UIImageView newAutoLayoutView];
                [self.contentView addSubview:imageView];
                
                [imageView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:(30*width/365+(width/4+20*width/365)*j)*width/365];
                [imageView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:(25+i*(67+20))];
                [imageView autoSetDimensionsToSize:CGSizeMake(50, 67)];
                imageView.tag = 1000+(num++);
                [imageView setUserInteractionEnabled:YES];

                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageViewAction:)];
                [imageView addGestureRecognizer:tap];
            }
        }
    }
    return self;
}

- (void)tapImageViewAction:(UITapGestureRecognizer *)tap
{
    UIImageView *imageView = (UIImageView *)tap.view;
    [self.delegate pushViewControllerNum:imageView.tag];

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
