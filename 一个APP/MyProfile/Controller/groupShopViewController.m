//
//  groupShopViewController.m
//  一个APP
//
//  Created by 远古科技 on 16/8/23.
//  Copyright © 2016年 llb. All rights reserved.
//

#import "groupShopViewController.h"

@interface groupShopViewController ()

@end

@implementation groupShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.priceLab.text = @"4元";
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:self.priceLab.text];
    
    [attributeString setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:30]} range:NSMakeRange(0, 1)];
    self.priceLab.attributedText = attributeString;
 
    self.reducePricelab.adjustsFontSizeToFitWidth = YES;// 根据文本宽度改变字体大小
    self.reducePricelab.adjustsFontSizeToFitWidth = YES;//调整基线位置需将此属性设置为YES
    self.reducePricelab.baselineAdjustment = UIBaselineAdjustmentNone ;
    
    self.twoPriceLab.text = @"5元";
    NSMutableAttributedString *twoattributeString = [[NSMutableAttributedString alloc] initWithString:self.twoPriceLab.text];
    [twoattributeString setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:30]} range:NSMakeRange(0, 1)];
    self.twoPriceLab.attributedText = twoattributeString;
    
    self.twoReducPricelab.adjustsFontSizeToFitWidth = YES;// 根据文本宽度改变字体大小
    self.twoReducPricelab.adjustsFontSizeToFitWidth = YES;//调整基线位置需将此属性设置为YES
    self.twoReducPricelab.baselineAdjustment = UIBaselineAdjustmentNone ;
    
    self.thirdPriceLab.text = @"9元";
    NSMutableAttributedString *thirdattributeString = [[NSMutableAttributedString alloc] initWithString:self.thirdPriceLab.text];
    [thirdattributeString setAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:30]} range:NSMakeRange(0, 1)];
    self.thirdPriceLab.attributedText = thirdattributeString;
    
    self.thirdReducePriceLab.adjustsFontSizeToFitWidth = YES;// 根据文本宽度改变字体大小
    self.thirdReducePriceLab.adjustsFontSizeToFitWidth = YES;//调整基线位置需将此属性设置为YES
    self.thirdReducePriceLab.baselineAdjustment = UIBaselineAdjustmentNone ;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
