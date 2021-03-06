//
//  ABCDSearchHeadView.m
//  DuoDuoRouRou
//
//  Created by 林宇 on 2020/4/23.
//  Copyright © 2020 Limzoo. All rights reserved.
//

#import "ABCDSearchHeadView.h"

@implementation ABCDSearchHeadView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self  setUI];
    }
    return self;
}


- (void)setUI{
    
    self.iconV = [UIImageView new];
    self.iconV.contentMode =  UIViewContentModeScaleAspectFill;
    self.iconV.clipsToBounds = YES;
    [self addSubview:self.iconV];
    [self.iconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(5);
        make.right.bottom.mas_equalTo(-5);
    }];
    self.iconV.layer.masksToBounds = YES;
    self.iconV.layer.cornerRadius = 10;
    self.iconV.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.iconV.layer.borderWidth = 1;
}
@end
