//
//  ImageAndLabView.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/27.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageAndLabView : UIView


@property (weak, nonatomic) IBOutlet UIButton *imageBtn;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;

+ (ImageAndLabView *)createViewNibWithImageArr:(NSArray *)images nameArr:(NSArray *)names;

- (void)setImages:(NSArray *)images names:(NSArray *)names;

@end
