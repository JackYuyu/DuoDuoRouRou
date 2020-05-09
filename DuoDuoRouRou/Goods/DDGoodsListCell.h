//
//  DDGoodsListCell.h
//  DuoDuoRouRou
//
//  Created by 林宇 on 2020/4/23.
//  Copyright © 2020 Limzoo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DDGoodsListCell : UICollectionViewCell
@property (nonatomic, strong) UIImageView *iconV;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *priceLab;
@property (nonatomic, strong) UILabel *goodLab;
@property (nonatomic, strong) UILabel *sendStyleLab;
@property (nonatomic, strong) UIImageView *cartIconV;
@end

NS_ASSUME_NONNULL_END
