//
//  ABCDHeadReusableView.m
//  DuoDuoRouRou
//
//  Created by 林宇 on 2020/4/23.
//  Copyright © 2020 Limzoo. All rights reserved.
//

#import "ABCDHeadReusableView.h"

@implementation ABCDHeadReusableView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUI];
    }
    return self;
}

- (void)setUI {
    
    self.nameLab = [UILabel new];
    self.nameLab.font = [UIFont systemFontOfSize:20 weight:1];
    self.nameLab.textColor = DYStyleColor;
    [self addSubview:self.nameLab];
    self.nameLab.textAlignment = NSTextAlignmentCenter;
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
    }];
    
    UIView *line = [UIView new];
    line.backgroundColor = DYStyleColor;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.centerX.mas_equalTo(self.nameLab);
        make.top.mas_equalTo(self.nameLab.mas_bottom).offset(5);
        make.width.mas_equalTo(self.nameLab);
    }];
    
    
}
@end
