//
//  TakeTableViewCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/6/25.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TakeTableViewCell.h"

static NSString *beforeUrl = @"http://192.168.1.88:8080/shangcheng/";

@implementation TakeTableViewCell

+ (TakeTableViewCell *)CreateTakeOutCell
{
    TakeTableViewCell *cell = [[NSBundle mainBundle]loadNibNamed:@"TakeTableViewCell" owner:nil options:nil].lastObject;
    
    [cell.salesLab setNumberOfLines:0];
    [cell.salesLab sizeToFit];
    return cell;
}
- (void)setTakeOutModel:(MerchantInformationModel *)model
{
    if (model) {
        NSString *url = [NSString stringWithFormat:@"%@%@",beforeUrl,model.shangjiaTouxiang];
        [self.foodImageView sd_setImageWithURL:[NSURL URLWithString:url]];
        self.shopName.text = model.shangjiaName;
        self.gradeLab.text = [NSString stringWithFormat:@"%@分", model.shangjiaPingfen];
        self.moneyLab.text = model.waimaiQisongjia;
        self.salesLab.text = model.shangjiaTongzhi;
        
        NSString *sendStr = [NSString stringWithFormat:@"¥%@ 配送费",model.waimaiPeisongfei];
        NSMutableDictionary *strDic = [NSMutableDictionary dictionaryWithObject:[UIFont systemFontOfSize:15] forKey:NSFontAttributeName];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:sendStr];
        [str addAttributes:strDic range:NSMakeRange(1, 1)];
        self.sendLab.attributedText = str;
        NSString *distance = [NSString stringWithFormat:@"%@ m",model.shangjiaJuli];
        self.distanceLab.text = distance;
    }
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
