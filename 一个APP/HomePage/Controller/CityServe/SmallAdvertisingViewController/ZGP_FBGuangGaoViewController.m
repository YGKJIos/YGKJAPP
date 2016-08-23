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
@property (nonatomic, strong) UITextView *placeholderLabel;
@end

@implementation ZGP_FBGuangGaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"我要发布";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"发布" style:UIBarButtonItemStylePlain target:self action:@selector(fabuguanggao)];
    // 创建输入框
    [self creatTextField];
}
- (void) creatTextField
{
    self.placeholderLabel = [[UITextView alloc]initWithFrame:CGRectMake(10, 10, WIDTH - 20, 300)];
    _placeholderLabel.backgroundColor = BGcolor(255.0, 255.0, 255.0);
    _placeholderLabel.textAlignment = NSTextAlignmentLeft;
    self.placeholderLabel.font
    = [UIFont fontWithName:@"Arial"size:18.0];
    [_placeholderLabel setEditable:NO];
    _placeholderLabel.autoresizesSubviews = UIViewAutoresizingFlexibleHeight;
    _placeholderLabel.text = @"说点什么...";
    _placeholderLabel.textColor = [UIColor lightGrayColor];
    _placeholderLabel.delegate = self;
    [self.view addSubview:_placeholderLabel];
    

    self.textField = [[UITextView alloc]initWithFrame:CGRectMake(10, 10, WIDTH - 20, 300)];
//    _textField.backgroundColor = BGcolor(245.0, 245.0, 245.0);
    _textField.textAlignment = NSTextAlignmentLeft;
    self.textField.font
    = [UIFont fontWithName:@"Arial"size:18.0];
    _textField.autoresizesSubviews = UIViewAutoresizingFlexibleHeight;
    _textField.delegate = self;
    [self.placeholderLabel addSubview:_textField];
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

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (![text isEqualToString:@""]){
        
        _placeholderLabel.hidden = YES;
        
    }
    
    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1)
        
    {
        
        _placeholderLabel.hidden = NO;
        
    }
    
    return YES;
    
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
