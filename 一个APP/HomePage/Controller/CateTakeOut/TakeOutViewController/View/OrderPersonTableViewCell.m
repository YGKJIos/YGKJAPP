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
- (void)setOrderPersonCellStyle:(OrderPersonCell)orderPersonStyle
{
    if (orderPersonStyle == InformationOrderPersonCell) {
        [self addInformationOrderPersonCell];
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
- (void)addInformationOrderPersonCell
{
    self.nameLabel = [UILabel newAutoLayoutView];
    self.nameLabel.text = @"顾小龙";
    self.nameLabel.textColor = BGcolor(78, 78, 78);
    [self.contentView addSubview:self.nameLabel];
    
    self.sexLab = [UILabel newAutoLayoutView];
    self.sexLab.text = @"男";
    self.sexLab.textColor = BGcolor(78, 78, 78);
    [self.contentView addSubview:self.sexLab];
    
    self.phoneNumLab = [UILabel newAutoLayoutView];
    self.phoneNumLab.text = @"1234565432";
    self.phoneNumLab.textColor = BGcolor(78, 78, 78);
    [self.contentView addSubview:self.phoneNumLab];
    
    self.addressLab = [UILabel newAutoLayoutView];
    self.addressLab.text = @"南岗区花园街恒运大厦A座1024";
    self.addressLab.textColor = BGcolor(78, 78, 78);
    [self.contentView addSubview:self.addressLab];
    
    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
    [self.nameLabel autoSetDimensionsToSize:CGSizeMake(100, 20)];
    
    [self.sexLab autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.nameLabel withOffset:15];
    [self.sexLab autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
    [self.sexLab autoSetDimensionsToSize:CGSizeMake(50, 20)];
    
    [self.phoneNumLab autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.sexLab withOffset:15];
    [self.phoneNumLab autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
    [self.phoneNumLab autoSetDimensionsToSize:CGSizeMake(120, 20)];
    
    [self.addressLab autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
    [self.addressLab autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:41];
    [self.addressLab autoSetDimensionsToSize:CGSizeMake(WIDTH, 20)];
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
//    reduceLab.text = @"立减10元";
    reduceLab.textColor = BGcolor(250, 83, 68);
    reduceLab.font = [UIFont systemFontOfSize:14];
    
    UIButton *arriveBtn = [UIButton newAutoLayoutView];
    [self.contentView addSubview:arriveBtn];
    [arriveBtn autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:70];
    [arriveBtn autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [arriveBtn autoSetDimensionsToSize:CGSizeMake(120, 30)];
    
    [arriveBtn setImage:[UIImage imageNamed:@"waimai_dingdan_weixuanzhong"] forState:UIControlStateNormal];
    [arriveBtn setTitle:@"货到付款" forState:UIControlStateNormal];
    arriveBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [arriveBtn setTitleColor:[UIColor colorWithRed:(80)/255. green:(80)/255. blue:(80)/255. alpha:1] forState:UIControlStateNormal];
    [arriveBtn addTarget:self action:@selector(arriveBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.arriveBtn = arriveBtn;
    
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
    UILabel *totalText = [UILabel newAutoLayoutView];
    [self.contentView addSubview:totalText];
    totalText.text = @"订单总计：16";
    totalText.textColor = BGcolor(138, 138, 138);
    totalText.font = [UIFont systemFontOfSize:14];
    [totalText autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
    [totalText autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [totalText autoSetDimensionsToSize:CGSizeMake(150, 20)];
    
    UILabel *waitPayLab = [UILabel newAutoLayoutView];
    [self.contentView addSubview:waitPayLab];
    // 改变字的颜色
    NSString *text = @"待支付：¥6";
    waitPayLab.textAlignment = NSTextAlignmentRight;
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc]initWithString:text];
    NSRange range = [text rangeOfString:@"¥6"];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = BGcolor(250, 83, 68);
    [attributed addAttributes:dic range:range];
    waitPayLab.attributedText = attributed;
    waitPayLab.font = [UIFont systemFontOfSize:14];
    [waitPayLab autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:30];
    [waitPayLab autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [waitPayLab autoSetDimensionsToSize:CGSizeMake(120, 20)];
}
// 确认下单
- (void)addSurePayOrderCell
{
    UILabel *usePayLab = [UILabel newAutoLayoutView];
    [self.contentView addSubview:usePayLab];
    // 改变字的颜色
    NSString *text = @"应支付：¥6";
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc]initWithString:text];
    NSRange range = [text rangeOfString:@"¥6"];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = BGcolor(250, 83, 68);
    [attributed addAttributes:dic range:range];
    usePayLab.attributedText = attributed;
    usePayLab.font = [UIFont systemFontOfSize:19];
    [usePayLab autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:30];
    [usePayLab autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [usePayLab autoSetDimensionsToSize:CGSizeMake(120, 20)];
    
    UIButton *payBtn = [UIButton newAutoLayoutView];
    [self.contentView addSubview:payBtn];
    [payBtn autoPinEdgeToSuperviewEdge:ALEdgeTrailing withInset:0];
    [payBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [payBtn autoSetDimension:ALDimensionWidth toSize:150];
    [payBtn autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [payBtn setTitle:@"确认下单" forState:UIControlStateNormal];
    payBtn.backgroundColor = BGcolor(65, 186, 206);
    [payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [payBtn addTarget:self action:@selector(surePayOrder) forControlEvents:UIControlEventTouchUpInside];
}
- (void)surePayOrder
{
    NSLog(@"lijixiadan");
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
