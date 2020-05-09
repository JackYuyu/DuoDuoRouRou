//
//  ABCDDDImageCell.h
//  DuoDuoRouRou
//
//  Created by 林宇 on 2020/4/23.
//  Copyright © 2020 Limzoo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ABCDDDImageCell : UICollectionViewCell
@property (strong, nonatomic)  UIImageView *iconV;
@property (strong, nonatomic)  UILabel *nameLab;
@property (strong, nonatomic)  UILabel *priceLab;
@property (nonatomic, strong) UILabel *infoLab;
@property (nonatomic, strong) UILabel *twoLab;
@property (nonatomic, strong) UILabel *threeLab;
@property (nonatomic, strong) UIImageView *iconV1;
@property (nonatomic, strong) UIImageView *iconV2;
@end

NS_ASSUME_NONNULL_END
