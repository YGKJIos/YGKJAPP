//
//  AppDelegate.h
//  一个APP
//
//  Created by 梁立彬 on 16/6/6.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString *appKey = @"506b17dafc827fdf8bbe1cff";
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    BMKMapManager* _mapManager; 
}
@property (strong, nonatomic) UIWindow *window;


@end

