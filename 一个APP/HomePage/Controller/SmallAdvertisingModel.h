//
//  MyModel.h
//  自适应图文排版
//
//  Created by 任鹏 on 16/7/5.
//  Copyright © 2016年 任鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SmallAdvertisingModel : NSObject
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *headImg;
@property (nonatomic, strong)NSString *cont;
@property (nonatomic, strong)NSArray *talkImgArray;
@property (nonatomic, assign)NSInteger h;
@end
