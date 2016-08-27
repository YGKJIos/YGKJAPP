//
//  ZGP_FBGuangGaoViewController.m
//  一个APP
//
//  Created by Tiny on 16/8/20.
//  Copyright © 2016年 祝高鹏. All rights reserved.
//

#import "ZGP_FBGuangGaoViewController.h"

@interface ZGP_FBGuangGaoViewController ()<UITextViewDelegate>
@property (nonatomic, strong) UITextView *textField;
@property (nonatomic, strong) UILabel *uilabel;
@end

@implementation ZGP_FBGuangGaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我要发布";
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.width = 80;
    button.height = 40;
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:@"发布" forState:UIControlStateNormal];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(10, 40, 10, 0)];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(fabuguanggao) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItme = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightItme;
    // 创建输入框
    [self creatTextField];
}
- (void) creatTextField
{
    self.textField = [[UITextView alloc]initWithFrame:CGRectMake(10, 10, WIDTH - 20, 300)];
    _textField.backgroundColor = BGcolor(235.0, 235.0, 235.0);
    _textField.alpha = 1;
    _textField.textAlignment = NSTextAlignmentLeft;
    self.textField.font
    = [UIFont systemFontOfSize:18];
    _textField.autoresizesSubviews = UIViewAutoresizingFlexibleHeight;
    _textField.delegate = self;
    [_textField.layer setCornerRadius:10];
    [self.view addSubview:_textField];
    self.uilabel = [[UILabel alloc]init];
    _uilabel.frame =CGRectMake(10, 10, WIDTH - 20, 40);
    _uilabel.text = @" 说点什么...";
    _uilabel.enabled = NO;//lable必须设置为不可用
    _uilabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_uilabel];
}
- (void)fabuguanggao
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:[UserInfo shareAccount].accountDict forKey:@"userId"];
    [param setObject:_textField.text forKey:@"guanggaoNeirong"];
    if (_textField.text.length == 0) {
        // 提示弹窗
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"广告内容不能为空" message:@"请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:sure];
        [self presentViewController:alert animated:YES completion:nil];

    }else{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSString *url = @"user/fabuguanggao.action";
            [AFNetWorting postNetWortingWithUrlString:url params:param controller:self success:^(NSURLSessionDataTask *task, id responseObject) {
                if ([responseObject[@"ok"] isEqualToString:@"1"]) {
                    // 提示弹窗
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"发布成功" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                        [self.navigationController popViewControllerAnimated:YES];
                    }];
                    [alert addAction:sure];
                    [self presentViewController:alert animated:YES completion:nil];
                }else{
                    // 提示弹窗
                    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请重新输入" message:@"发布失败" preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                        
                    }];
                    [alert addAction:sure];
                    [self presentViewController:alert animated:YES completion:nil];
                }
                
            } failure:^(NSURLSessionDataTask *task, NSError *error) {
                
            }];
            
        });
    }
}

-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0) {
        _uilabel.text = @"说点什么...";
    }else{
        _uilabel.text = @"";
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
