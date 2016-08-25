//
//  RemarkViewController.h
//  一个APP
//
//  Created by 梁立彬 on 16/7/13.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol passDelegate <NSObject>

- (void)passValue:(NSString *) string;

@end

@interface RemarkViewController : UIViewController

@property(nonatomic, retain)id<passDelegate>delegate;
@end
