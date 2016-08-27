//
//  Singleton.h
//  Singleton
//
//  Created by dllo on 15/11/2.
//  Copyright (c) 2015年 huyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IPDShowViewDelegate <NSObject>

- (void)showViewWith:(NSString *)string;


@end

@interface Singleton : NSObject
+ (Singleton *)shareSingleton;
@property (nonatomic, assign)id<IPDShowViewDelegate>delegate;
@property (nonatomic, assign)NSInteger pushPage;
@property (nonatomic, assign)NSInteger payType;
@property (nonatomic, assign)BOOL lodingBool;
@property (nonatomic, assign)BOOL AFNBool;
@property (nonatomic, assign)BOOL thirdBool;
- (void)makeShowWith:(NSString *)string;








@end
