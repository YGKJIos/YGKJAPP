//
//  ErrorInformationView.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "ErrorInformationView.h"

@implementation ErrorInformationView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *bgImageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [bgImageView setUserInteractionEnabled:YES];
        bgImageView.image = [UIImage imageNamed:@"heisebeijing"];
        [self addSubview:bgImageView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickBgControlAction)];
        [bgImageView addGestureRecognizer:tap];
        
        UIView *whiteView = [UIView newAutoLayoutView];
        [self addSubview:whiteView];
        whiteView.backgroundColor = [UIColor whiteColor];
        [whiteView autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
        [whiteView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [whiteView autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:30];
        [whiteView autoSetDimension:ALDimensionHeight toSize:172];
        
        UILabel *title = [UILabel newAutoLayoutView];
        [whiteView addSubview:title];
        title.textColor = BGcolor(65, 186, 206);
        title.font = [UIFont systemFontOfSize:19];
        title.text = @"反馈商家问题";
        [title autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [title autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
        [title autoSetDimensionsToSize:CGSizeMake(120, 30)];
        
        UIView *lineView = [UIView newAutoLayoutView];
        lineView.backgroundColor = BGcolor(65, 186, 206);
        [whiteView addSubview:lineView];
        [lineView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:title withOffset:15 relation:NSLayoutRelationEqual];
        [lineView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:0];
        [lineView autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:0];
        [lineView autoSetDimension:ALDimensionHeight toSize:2];
        
        UIButton *sureBtn = [UIButton newAutoLayoutView];
        sureBtn.frame = CGRectMake(0, lineView.y+lineView.height, whiteView.width, 57);
        [sureBtn setTitle:@"确认报错" forState:UIControlStateNormal];
        [sureBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [sureBtn addTarget:self action:@selector(clickSureBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [whiteView addSubview:sureBtn];
        [sureBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:lineView withOffset:0 relation:NSLayoutRelationEqual];
        [sureBtn autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:0];
        [sureBtn autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:0];
        [sureBtn autoSetDimension:ALDimensionHeight toSize:55];
        
        UIView *lineView1 = [UIView newAutoLayoutView];
        lineView1.backgroundColor = BGcolor(198, 198 , 198);
        [whiteView addSubview:lineView1];
        [lineView1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:sureBtn withOffset:0 relation:NSLayoutRelationEqual];
        [lineView1 autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:0];
        [lineView1 autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:0];
        [lineView1 autoSetDimension:ALDimensionHeight toSize:1];
        
        UIButton *cancelBtn = [UIButton newAutoLayoutView];
        [cancelBtn setTitle:@"取消报错" forState:UIControlStateNormal];
        [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cancelBtn addTarget:self action:@selector(clickBgControlAction) forControlEvents:UIControlEventTouchUpInside];
        [whiteView addSubview:cancelBtn];
        [cancelBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:lineView1 withOffset:1 relation:NSLayoutRelationEqual];
        [cancelBtn autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:0];
        [cancelBtn autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:0];
        [cancelBtn autoSetDimension:ALDimensionHeight toSize:54];
    
    }
    return self;
}
-(void)showErrorView
{
    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
    [window addSubview:self];
}

- (void)clickBgControlAction
{
    [self removeFromSuperview];
}

- (void)clickSureBtnAction
{
    NSLog(@"确认");
}

@end
