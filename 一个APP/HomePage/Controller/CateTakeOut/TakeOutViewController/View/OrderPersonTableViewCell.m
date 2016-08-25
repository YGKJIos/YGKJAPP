//
//  OrderPersonTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/9.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "OrderPersonTableViewCell.h"

@interface OrderPersonTableViewCell ()
@property (nonatomic, strong)UIButton *onLineBtn;
@property (nonatomic, strong)UIButton *arriveBtn;

@end

@implementation OrderPersonTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
    }
    return self;
}
- (void)setOrderPersonCellStyle:(OrderPersonCell)orderPersonStyle model:(MerchantInformationModel *)model
{
    if (orderPersonStyle == InformationOrderPersonCell) {
        [self addInformationOrderPersonCell:model];
    }else if (orderPersonStyle == PaymentOrderPersonCell)
    {
        [self addPaymentOrderPersonCell];
    }else if (orderPersonStyle == MerchantSnackCell)
    {
        [self addMerchantSnackCell];
    }else if (orderPersonStyle == FavorableCell){ 
        [self addFavorableCell];
    }else if (orderPersonStyle == TotalCell){
        [self addTotalCell];
    }else if (orderPersonStyle == SurePayOrderCell)
    {
        [self addSurePayOrderCell];
    }
}
// 添加订单用户的信息
- (void)addInformationOrderPersonCell:(MerchantInformationModel *)model
{
//    self.nameLabel = [UILabel newAutoLayoutView];
//    self.nameLabel.text = @"顾小龙";
//    self.nameLabel.textColor = BGcolor(78, 78, 78);
//    [self.contentView addSubview:self.nameLabel];
//    
//    self.sexLab = [UILabel newAutoLayoutView];
//    self.sexLab.text = @"男";
//    self.sexLab.textColor = BGcolor(78, 78, 78);
//    [self.contentView addSubview:self.sexLab];
//    
//    self.phoneNumLab = [UILabel newAutoLayoutView];
//    self.phoneNumLab.text = @"1234565432";
//    self.phoneNumLab.textColor = BGcolor(78, 78, 78);
//    [self.contentView addSubview:self.phoneNumLab];
    
    self.addressLab = [UILabel newAutoLayoutView];
    self.addressLab.text = @"请填写地址";
    self.addressLab.textColor = BGcolor(78, 78, 78);
    self.addressLab.font = [UIFont systemFontOfSize:15];
    self.addressLab.numberOfLines = 0;
    [self.addressLab sizeToFit];
    [self.contentView addSubview:self.addressLab];
    if (model != nil) {
        self.addressLab.text = model.shouhuoDizhi;
    }
    
//    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:10];
//    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
//    [self.nameLabel autoSetDimensionsToSize:CGSizeMake(100, 20)];
//    
//    [self.sexLab autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.nameLabel withOffset:15];
//    [self.sexLab autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
//    [self.sexLab autoSetDimensionsToSize:CGSizeMake(50, 20)];
//    
//    [self.phoneNumLab autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.sexLab withOffset:15];
//    [self.phoneNumLab autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
//    [self.phoneNumLab autoSetDimensionsToSize:CGSizeMake(120, 20)];
    
    [self.addressLab autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:15];
    [self.addressLab autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
    [self.addressLab autoSetDimensionsToSize:CGSizeMake(WIDTH-60, 55)];
}
// 订单 选择支付的方式
- (void)addPaymentOrderPersonCell
{
    UIButton *onLineBtn = [UIButton newAutoLayoutView];
    [self.contentView addSubview:onLineBtn];
    [onLineBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30];
    [onLineBtn autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [onLineBtn autoSetDimensionsToSize:CGSizeMake(120, 30)];
    [onLineBtn setImage:[UIImage imageNamed:@"waimai_dingdan_xuanzhong"] forState:UIControlStateNormal];
    [onLineBtn setTitle:@"在线支付" forState:UIControlStateNormal];
    onLineBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [onLineBtn setTitleColor:[UIColor colorWithRed:(80)/255. green:(80)/255. blue:(80)/255. alpha:1] forState:UIControlStateNormal];
    [onLineBtn addTarget:self action:@selector(onLineBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.onLineBtn = onLineBtn;
    
    UILabel *reduceLab = [UILabel newAutoLayoutView];
    [self.contentView addSubview:reduceLab];
    [reduceLab autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:onLineBtn withOffset:0 relation:NSLayoutRelationLessThanOrEqual];
    [reduceLab autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    reduceLab.textColor = BGcolor(250, 83, 68);
    reduceLab.font = [UIFont systemFontOfSize:14];
    
    
#pragma mark - 货到付款
//    UIButton *arriveBtn = [UIButton newAutoLayoutView];
//    [self.contentView addSubview:arriveBtn];
//    [arriveBtn autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:70];
//    [arriveBtn autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
//    [arriveBtn autoSetDimensionsToSize:CGSizeMake(120, 30)];
//    
//    [arriveBtn setImage:[UIImage imageNamed:@"waimai_dingdan_weixuanzhong"] forState:UIControlStateNormal];
//    [arriveBtn setTitle:@"货到付款" forState:UIControlStateNormal];
//    arriveBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
//    [arriveBtn setTitleColor:[UIColor colorWithRed:(80)/255. green:(80)/255. blue:(80)/255. alpha:1] forState:UIControlStateNormal];
//    [arriveBtn addTarget:self action:@selector(arriveBtnAction:) forControlEvents:UIControlEventTouchUpInside];
//    self.arriveBtn = arriveBtn;
    
}
- (void)arriveBtnAction:(UIButton *)btn
{
    [self.onLineBtn setImage:[UIImage imageNamed:@"waimai_dingdan_weixuanzhong"] forState:UIControlStateNormal];
    [self.arriveBtn setImage:[UIImage imageNamed:@"waimai_dingdan_xuanzhong"] forState:UIControlStateNormal];
}
- (void)onLineBtnAction:(UIButton *)btn
{
    [self.onLineBtn setImage:[UIImage imageNamed:@"waimai_dingdan_xuanzhong"] forState:UIControlStateNormal];
    [self.arriveBtn setImage:[UIImage imageNamed:@"waimai_dingdan_weixuanzhong"] forState:UIControlStateNormal];
}
// 快餐订单
- (void)addMerchantSnackCell
{
    UIImageView *snackImage = [UIImageView newAutoLayoutView];
    [self.contentView addSubview:snackImage];
    [snackImage autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
    [snackImage autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [snackImage autoSetDimensionsToSize:CGSizeMake(14, 14)];
    snackImage.image = [UIImage imageNamed:@"waimai_dingdan_shangjia"];
    
    UILabel *shopNameLab = [UILabel newAutoLayoutView];
    [self.contentView addSubview:shopNameLab];
    shopNameLab.text = @"刘记快餐";
    shopNameLab.textColor = BGcolor(65, 186, 206);
    shopNameLab.font = [UIFont systemFontOfSize:14];
    [shopNameLab autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:snackImage withOffset:10 relation:NSLayoutRelationLessThanOrEqual];
    [shopNameLab autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [shopNameLab autoSetDimensionsToSize:CGSizeMake(120, 20)];
    
    UILabel *distributionLab = [UILabel newAutoLayoutView];
    [self.contentView addSubview:distributionLab];
    distributionLab.text = @"商家配送";
    distributionLab.textColor = BGcolor(190, 190, 190);
    distributionLab.font = [UIFont systemFontOfSize:14];
    [distributionLab autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:30];
    distributionLab.textAlignment = NSTextAlignmentRight;
    [distributionLab autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [distributionLab autoSetDimensionsToSize:CGSizeMake(120, 20)];
}
// 优惠立减
- (void)addFavorableCell
{
    UIImageView *snackImage = [UIImageView newAutoLayoutView];
    [self.contentView addSubview:snackImage];
    [snackImage autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
    [snackImage autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [snackImage autoSetDimensionsToSize:CGSizeMake(14, 14)];
    snackImage.image = [UIImage imageNamed:@"waimai_jian2"];
    
    UILabel *shopNameLab = [UILabel newAutoLayoutView];
    [self.contentView addSubview:shopNameLab];
    shopNameLab.text = @"优惠劵";
    shopNameLab.textColor = BGcolor(138, 138, 138);
    shopNameLab.font = [UIFont systemFontOfSize:14];
    [shopNameLab autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:snackImage withOffset:10 relation:NSLayoutRelationLessThanOrEqual];
    [shopNameLab autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [shopNameLab autoSetDimensionsToSize:CGSizeMake(120, 20)];
    
    UILabel *distributionLab = [UILabel newAutoLayoutView];
    [self.contentView addSubview:distributionLab];
    distributionLab.text = @"-¥10";
    distributionLab.textAlignment = NSTextAlignmentRight;
    distributionLab.textColor = BGcolor(84, 84, 84);
    distributionLab.font = [UIFont systemFontOfSize:14];
    [distributionLab autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:30];
    [distributionLab autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [distributionLab autoSetDimensionsToSize:CGSizeMake(120, 20)];
}
// 订单总计
- (void)addTotalCell
{
    self.totalText = [UILabel newAutoLayoutView];
    [self.contentView addSubview:self.totalText];
    self.totalText.text = @"订单总计：16";
    self.totalText.textColor = BGcolor(138, 138, 138);
    self.totalText.font = [UIFont systemFontOfSize:14];
    [self.totalText autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
    [self.totalText autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.totalText autoSetDimensionsToSize:CGSizeMake(150, 20)];
    
    self.waitPayLab = [UILabel newAutoLayoutView];
    [self.contentView addSubview:self.waitPayLab];
    self.waitPayLab.textAlignment = NSTextAlignmentRight;
    
    self.waitPayLab.font = [UIFont systemFontOfSize:14];
    [self.waitPayLab autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:30];
    [self.waitPayLab autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.waitPayLab autoSetDimensionsToSize:CGSizeMake(120, 20)];
}
// 确认下单
- (void)addSurePayOrderCell
{
    self.usePayLab = [UILabel newAutoLayoutView];
    [self.contentView addSubview:self.usePayLab];
        self.usePayLab.font = [UIFont systemFontOfSize:19];
    [self.usePayLab autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
    [self.usePayLab autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.usePayLab autoSetDimensionsToSize:CGSizeMake(120, 20)];
    
    UIButton *payBtn = [UIButton newAutoLayoutView];
    [self.contentView addSubview:payBtn];
    [payBtn autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:0];
    [payBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [payBtn autoSetDimension:ALDimensionWidth toSize:150];
    [payBtn autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [payBtn setTitle:@"确认下单" forState:UIControlStateNormal];
    payBtn.backgroundColor = BGcolor(65, 186, 206);
    [payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.payBtn = payBtn;
}
// 订单统计
- (void)setTotalCell:(NSMutableArray *)selectArr
{
    self.totalText.text = [NSString stringWithFormat:@"订单总计：%ld",selectArr.count];
    
    // 改变字的颜色
    NSString *totalStr = [self totalMoney:selectArr];
    NSString *text = [NSString stringWithFormat:@"待支付：%@",totalStr];
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc]initWithString:text];
    NSRange range = [text rangeOfString:totalStr];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = BGcolor(250, 83, 68);
    [attributed addAttributes:dic range:range];
    self.waitPayLab.attributedText = attributed;
}

- (void)setUsePayCell:(NSMutableArray *)selectArr
{
    NSString *str = [self totalMoney:selectArr];
    // 改变字的颜色
    NSString *text = [NSString stringWithFormat:@"应支付：%@",str];
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc]initWithString:text];
    NSRange range = [text rangeOfString:str];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = BGcolor(250, 83, 68);
    [attributed addAttributes:dic range:range];
    self.usePayLab.attributedText = attributed;

}

// 计算价钱
- (NSString *)totalMoney:(NSMutableArray *)arr
{
    NSInteger totalNum = 0;
    NSString *total = [NSString string];
    for (int i = 0; i < arr.count; i++) {
        MerchantInformationModel *model = arr[i];
        totalNum += model.waimaishipinJiage.integerValue;
        total = [NSString stringWithFormat:@"¥%ld",totalNum];
    }
    return total;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
