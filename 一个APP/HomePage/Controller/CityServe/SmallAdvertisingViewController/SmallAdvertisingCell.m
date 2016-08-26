//
//  SmallAdvertisingCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/16.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "SmallAdvertisingCell.h"

@implementation SmallAdvertisingCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatCell];
    }
    return self;
}

- (void)creatCell
{
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
    [self.contentView addSubview:topView];
    
    _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 0, 0)];
    [topView addSubview:_headImageView];
    _headImageView.layer.cornerRadius = 20;
    _headImageView.layer.masksToBounds = YES;
    
    _userName = [[UILabel alloc] initWithFrame:CGRectMake(_headImageView.frame.size.width  + 30, 0, [UIScreen mainScreen].bounds.size.width - 70, 60)];
    [topView addSubview:_userName];
    _userName.font = [UIFont systemFontOfSize:10];
    
    _phoneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _phoneBtn.origin = CGPointMake(WIDTH-54, topView.size.height/2 - 14);
    _phoneBtn.size = [UIImage imageNamed:@"dianhua"].size;
    [_phoneBtn setImage:[UIImage imageNamed:@"dianhua"] forState:UIControlStateNormal];
    [_phoneBtn addTarget:self action:@selector(phoneBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_phoneBtn];
    
    _contLab = [[UILabel alloc] initWithFrame:CGRectMake(30, topView.frame.size.height + topView.frame.origin.y, [UIScreen mainScreen].bounds.size.width - 50, 20)];
    [self.contentView addSubview:_contLab];
    _contLab.font = [UIFont systemFontOfSize:12];
    _contLab.numberOfLines = 0;
    
    _imgView = [[UIView alloc] initWithFrame:CGRectMake(0, _contLab.frame.size.height + _contLab.frame.origin.y + 10, [UIScreen mainScreen].bounds.size.width, 100)];
    [self.contentView addSubview:_imgView];
#pragma mark - 暂时不需要添加照片
#if 0
    NSInteger wid = ([UIScreen mainScreen].bounds.size.width - 50)/4;
    for (NSInteger i = 0; i < 4; i ++) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(30 + (wid + 3)* i, 0, 72.5, 100)];
        [img setUserInteractionEnabled:YES];
        [_imgView addSubview:img];
        img.tag = 900 + i;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClickAction:)];
        [img addGestureRecognizer:tap];
    }
#endif
}
- (void)setDataForCellWithModel:(SmallAdvertisingModel *)model
{
    _headImageView.image = [UIImage imageNamed:model.headImg];
    _userName.text = model.userName;
    CGRect f = _contLab.frame;
    f.size.height = model.h;
    _contLab.frame = f;
    _contLab.text = model.guanggaoNeirong;
    
    CGRect imgf = _imgView.frame;
    imgf.origin.y = _contLab.frame.size.height + _contLab.frame.origin.y + 10;
    _imgView.frame = imgf;
    
    for (NSInteger i = 0; i < model.talkImgArray.count; i ++)
    {
        UIImageView *img = (UIImageView *)[_imgView viewWithTag:900 + i];
        img.image = [UIImage imageNamed:model.talkImgArray[i]];
    }
}
- (void)tapClickAction:(UITapGestureRecognizer *)tap
{
    
}
- (void)phoneBtnClickAction
{
    NSString *number = @"13734507603";// 此处读入电话号码
    // NSString *num = [[NSString alloc]initWithFormat:@"tel://%@",number]; //number为号码字符串 如果使用这个方法结束电话之后会进入联系人列表
    
    NSString *num = [[NSString alloc]initWithFormat:@"telprompt://%@",number]; //而这个方法则打电话前先弹框 是否打电话 然后打完电话之后回到程序中 网上说这个方法可能不合法 无法通过审核
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]]; //拨号
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
