//
//  ABCDGoodsDetailViewController.h
//  DuoDuoRouRou
//
//  Created by 林宇 on 2020/4/23.
//  Copyright © 2020 Limzoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABCDGoodsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ABCDGoodsDetailViewController : UIViewController
@property(nonatomic,strong) ABCDGoodsModel *model;
@property (nonatomic, strong) NSArray *dataArr;
@end

NS_ASSUME_NONNULL_END
