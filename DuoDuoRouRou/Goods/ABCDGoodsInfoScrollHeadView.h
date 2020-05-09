//
//  ABCDGoodsInfoScrollHeadView.h
//  DuoDuoRouRou
//
//  Created by 林宇 on 2020/4/23.
//  Copyright © 2020 Limzoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABCDGoodsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ABCDGoodsInfoScrollHeadView : UITableViewHeaderFooterView
@property(nonatomic,strong) SDCycleScrollView *scrollView;
//
@property(nonatomic,strong) UILabel *priceLab;
//
@property(nonatomic,strong) UILabel *oldPrice;
//
@property(nonatomic,strong) UILabel *nameLab;
//
@property(nonatomic,strong) UILabel *countLab;
//
@property(nonatomic,strong) ABCDGoodsModel *model;
@end

NS_ASSUME_NONNULL_END
