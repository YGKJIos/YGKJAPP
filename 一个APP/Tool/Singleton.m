//
//  Singleton.h
//  Singleton
//
//  Created by dllo on 15/11/2.
//  Copyright (c) 2015年 huyang. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

+ (Singleton *)shareSingleton
{
    static Singleton *single = nil;
    static dispatch_once_t oneToTake;
    dispatch_once(&oneToTake,^{
        single = [[Singleton alloc] init];
    });
    return single;
}

- (void)makeShowWith:(NSString *)string
{
    [self.delegate showViewWith:string];
}

@end
