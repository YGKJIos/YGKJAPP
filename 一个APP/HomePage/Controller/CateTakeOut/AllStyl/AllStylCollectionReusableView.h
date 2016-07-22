//
//  AllStylCollectionReusableView.h
//  一个APP
//
//  Created by 远古科技 on 16/6/29.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllStylCollectionReusableView : UICollectionReusableView

// header厨师的小帽子
@property(nonatomic, retain) UIImageView *headImage;
// 美食label
@property(nonatomic, retain) UILabel *foodLabel;
// 长条label
@property(nonatomic, retain) UILabel *LineLabel;

@end
