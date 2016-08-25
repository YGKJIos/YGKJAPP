//
//  ImageAndLabView.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/27.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImageLabViewPushVCDelegate <NSObject>

- (void)imageAndLableViewPush:(UIButton *)btn;

@end

@interface ImageAndLabView : UIView


@property (weak, nonatomic) IBOutlet UIButton *imageBtn;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (nonatomic, assign)id<ImageLabViewPushVCDelegate>delegate;

+ (ImageAndLabView *)createViewNib;

- (void)setImages:(NSString *)image names:(NSString *)name tag:(NSInteger)tag;

@end
