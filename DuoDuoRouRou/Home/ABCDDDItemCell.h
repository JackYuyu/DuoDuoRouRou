//
//  ABCDDDItemCell.h
//  DuoDuoRouRou
//
//  Created by 林宇 on 2020/4/23.
//  Copyright © 2020 Limzoo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ABCDDDItemCell : UICollectionViewCell
@property (strong, nonatomic)  UIImageView *iconV;
@property (strong, nonatomic)  UILabel *nameLab;
@property (strong, nonatomic)  UILabel *merPriceLab;
@property (nonatomic, strong) UILabel *soldLab;
@end

NS_ASSUME_NONNULL_END
