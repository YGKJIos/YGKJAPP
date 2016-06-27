//
//  SearchView.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/9.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "SearchView.h"

@interface SearchView ()<UITextFieldDelegate>

@property (nonatomic, strong)UILabel *placeholder;
@property (nonatomic, strong)UIImageView *searchImageView;
@property (nonatomic, strong)UITextField *textField;
@property (nonatomic, strong)UIView *temporaryView; // 占位用的
@end

@implementation SearchView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(15, 10, self.frame.size.width - 30, 40)];
//        textField.placeholder = @"搜索";
        textField.font = [UIFont systemFontOfSize:15];
        textField.textAlignment = NSTextAlignmentCenter;
        textField.layer.masksToBounds = YES;
        textField.layer.cornerRadius = 8;
        textField.delegate = self;
        [textField setClearButtonMode:UITextFieldViewModeAlways];
        textField.backgroundColor = BGcolor(230, 230, 230);
        [self addSubview:textField];
        _textField = textField;
        
        UIImageView *searchImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width/2-50, 5, 30, 30)];
        searchImageView.width = 30;
        searchImageView.height = 30;
        searchImageView.image = [UIImage imageNamed:@"xiaoxi_sou"];
        searchImageView.contentMode = UIViewContentModeCenter;
//        textField.leftView = searchImageView;
//        textField.leftViewMode = UITextFieldViewModeAlways;
        [textField addSubview:searchImageView];
        _searchImageView = searchImageView;
        _placeholder.text = @"搜索";
        _placeholder = [[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width / 2 -20, 0, 120, 40)];
        _placeholder.font = [UIFont systemFontOfSize:15];
        _placeholder.textColor = BGcolor(86, 86, 91);
        [textField addSubview:_placeholder];
    }
    return self;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.1 animations:^{
        
        _temporaryView = [[UIView alloc]initWithFrame:CGRectMake(0, 5, 30, 30)];
        _searchImageView.frame = CGRectMake(0, 5, 30, 30);
        _textField.textAlignment = NSTextAlignmentLeft;
        _textField.leftView = _temporaryView;
        _textField.leftViewMode = UITextFieldViewModeAlways;
        [_placeholder setHidden:YES];
    }];
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_temporaryView removeFromSuperview];
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if ([textField.text isEqualToString:@""]) {
        [_textField addSubview:_searchImageView];
        [UIView animateWithDuration:0.1 animations:^{
            _searchImageView.frame = CGRectMake(self.frame.size.width/2-50, 5, 30, 30);
            [_placeholder setHidden:NO];
        }];
    }
    return YES;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
