//
//  GoodsInfoScrollHeadView.h
//  DuoDuoRouRou
//
//  Created by 林宇 on 2020/4/23.
//  Copyright © 2020 Limzoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface GoodsInfoScrollHeadView : UITableViewHeaderFooterView
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
@property(nonatomic,strong) GoodsModel *model;
@end

NS_ASSUME_NONNULL_END
