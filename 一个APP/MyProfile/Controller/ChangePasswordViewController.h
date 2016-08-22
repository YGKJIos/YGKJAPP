//
//  ChangePasswordViewController.h
//  一个APP
//
//  Created by 远古科技 on 16/8/17.
//  Copyright © 2016年 llb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePasswordViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *passWordField;
@property (weak, nonatomic) IBOutlet UITextField *surePassWordField;
@property (weak, nonatomic) IBOutlet UIButton *submitBtn;

@end
