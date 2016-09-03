//
//  TakeOutRightTableCell.m
//  一个APP
//
//  Created by 梁立彬 on 16/7/6.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "TakeOutRightTableCell.h"
//static NSString *bendi = @"http://139.129.209.189/shangcheng";
@implementation TakeOutRightTableCell

- (void)setTakeOutRightTableModel:(MerchantInformationModel *)model
{
    if (model.gwsz.integerValue > 0) {
        NSString *url = [NSString stringWithFormat:@"%@%@",serverAddress,model.shangjiaTouxiang];
        [self.headImage sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
        self.sellNumLab.text = model.waimaishipinYishou;
        self.nameLab.text = model.waimaishipinName;
        self.pirceLab.text = [NSString stringWithFormat:@"¥%@" , model.waimaishipinJiage];
        self.numberLab.text = model.gwsz;
        
    }else{
        NSString *url = [NSString stringWithFormat:@"%@%@",serverAddress,model.shangjiaTouxiang];
        [self.headImage sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
        self.sellNumLab.text = model.waimaishipinYishou;
        self.nameLab.text = model.waimaishipinName;
        self.pirceLab.text = [NSString stringWithFormat:@"¥%@" , model.waimaishipinJiage];
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
