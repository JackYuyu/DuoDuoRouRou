//
//  GoodsDetailViewController.h
//  DuoDuoRouRou
//
//  Created by 林宇 on 2020/4/23.
//  Copyright © 2020 Limzoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GoodsDetailViewController : UIViewController
@property(nonatomic,strong) GoodsModel *model;
@property (nonatomic, strong) NSArray *dataArr;
@end

NS_ASSUME_NONNULL_END
