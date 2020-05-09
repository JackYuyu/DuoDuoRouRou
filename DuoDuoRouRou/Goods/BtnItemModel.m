//
//  BtnItemModel.m
//  DuoDuoRouRou
//
//  Created by 林宇 on 2020/4/23.
//  Copyright © 2020 Limzoo. All rights reserved.
//

#import "BtnItemModel.h"

@implementation BtnItemModel
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"goods":@"GoodsModel"};
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}
@end
