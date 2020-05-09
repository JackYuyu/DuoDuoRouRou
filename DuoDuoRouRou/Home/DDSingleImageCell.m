//
//  DDSingleImageCell.m
//  DuoDuoRouRou
//
//  Created by 林宇 on 2020/4/23.
//  Copyright © 2020 Limzoo. All rights reserved.
//

#import "DDSingleImageCell.h"

@implementation DDSingleImageCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self= [super initWithFrame:frame]) {
        [self setUI];
        
    }
    
    return self;
}

- (void)setUI {
    
    
    CGFloat width = (SW-40)/3;
    
    

    UIImageView *muIconV=[UIImageView new];
    muIconV.image=[UIImage imageNamed:@"cell1"];
    muIconV.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:muIconV];
    [muIconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(width, 160));
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.top.mas_equalTo(self).offset(10);
    }];
    
    UIView *bgV = [UIView new];
    [self.contentView addSubview:bgV];
    bgV.backgroundColor = [UIColor colorWithRed:137/255.0 green:179/255.0 blue:178/255.0 alpha:0.6];
    [bgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(muIconV);
        make.center.mas_equalTo(muIconV);
    }];
    
    
    UILabel *muLab = [UILabel new];
    muLab.text = @"优惠不断";
    muLab.textColor = DYWhite;
    muLab.font= [UIFont systemFontOfSize:20 weight:1];
    [self.contentView addSubview:muLab];
    [muLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(muIconV);
    }];
    
    UIImageView *yiIconV=[UIImageView new];
    yiIconV.image=[UIImage imageNamed:@"cell2"];
    yiIconV.contentMode = UIViewContentModeScaleAspectFit;

    [self.contentView addSubview:yiIconV];
    [yiIconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(width, 160));
        make.left.mas_equalTo(muIconV.mas_right).offset(10);
        make.top.mas_equalTo(self).offset(10);
    }];
    
   
    UIImageView *huaIconV=[UIImageView new];
    huaIconV.image=[UIImage imageNamed:@"cell3"];
    huaIconV.contentMode = UIViewContentModeScaleAspectFit;

    [self.contentView addSubview:huaIconV];
    [huaIconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(width, 160));
        make.left.mas_equalTo(yiIconV.mas_right).offset(10);
        make.top.mas_equalTo(self).offset(10);
    }];
    
    muIconV.layer.masksToBounds = YES;
    muIconV.layer.cornerRadius = 10;
    bgV.layer.masksToBounds = YES;
    bgV.layer.cornerRadius = 10;
    yiIconV.layer.masksToBounds = YES;
    yiIconV.layer.cornerRadius = 10;
    huaIconV.layer.masksToBounds = YES;
    huaIconV.layer.cornerRadius = 10;
}
@end
