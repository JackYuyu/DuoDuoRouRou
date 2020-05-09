//
//  OrderDetailViewController.h
//  YanBei
//
//  Created by qq on 2020/3/31.
//  Copyright © 2020 bei. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GoodsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface OrderDetailViewController : UIViewController
@property (nonatomic,strong) GoodsModel *model;
@property (nonatomic, copy) NSString *count;
@property (nonatomic, copy) NSString *createTime;
@end

NS_ASSUME_NONNULL_END
