//
//  TableViewHeader.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/17.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

// tableViewScetion 的View
@interface TableViewHeader : UIView




@property (nonatomic, strong)UILabel *titleLab;
- (void)setTitleLabText:(NSString *)text;

@end
