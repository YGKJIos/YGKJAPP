//
//  MovieModel.h
//  一个APP
//
//  Created by 远古科技 on 16/7/7.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModel : NSObject

// 旧
//@property (nonatomic, copy) NSString *shangjiaId;
@property (nonatomic, copy) NSString *dianyingName;
@property (nonatomic, copy) NSString *dianyingJianjie;
@property (nonatomic, copy) NSString *dianyingXiaoguo;
@property (nonatomic, copy) NSString *dianyingYuanjia;
@property (nonatomic, copy) NSString *dianyingTejia;
@property (nonatomic, copy) NSString *dianyingTupian;
@property (nonatomic, copy) NSString *dianyingResou;
@property (nonatomic, copy) NSString *dianyingLeixing;
@property (nonatomic, copy) NSString *dianyingRebo;
@property (nonatomic, copy) NSString *dianyingPingfen;
@property (nonatomic, copy) NSString *shangjiaDianhua;


// 新
@property (nonatomic, copy) NSString *shangjiaLeixing;
@property (nonatomic, copy) NSString *shangjiaId;
@property (nonatomic, copy) NSString *tuangoujuanId;
@property (nonatomic, copy) NSString *tuangouName;
@property (nonatomic, copy) NSString *tuangouTejia;
@property (nonatomic, copy) NSString *tuangouShuoming;
@property (nonatomic, copy) NSString *tuangouTouxiang;
@property (nonatomic, copy) NSString *tuangouYuanjia;
@property (nonatomic, copy) NSString *tuangouLeixing;



@end
