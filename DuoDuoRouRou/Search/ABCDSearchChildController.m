//
//  ABCDSearchChildController.m
//  DuoDuoRouRou
//
//  Created by 林宇 on 2020/4/23.
//  Copyright © 2020 Limzoo. All rights reserved.
//

#import "ABCDSearchChildController.h"
#import "ABCDSearchHeadView.h"
#import "ABCDDDSearchCell.h"
#import "ABCDGoodsDetailViewController.h"
#import "ABCDGoodsListViewController.h"
#import "ABCDBtnItemModel.h"
#import "ABCDGoodsModel.h"

@interface ABCDSearchChildController ()
<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation ABCDSearchChildController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    [self http];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
   
    UICollectionViewFlowLayout *layout1 = [UICollectionViewFlowLayout new];
    layout1.minimumLineSpacing = 0;
    layout1.minimumInteritemSpacing = 0;
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout1];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = DYWhite;

    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
    
    
   
    [self.collectionView registerClass:[ABCDDDSearchCell class] forCellWithReuseIdentifier:@"ABCDDDSearchCell"];
    [self.collectionView registerClass:[ABCDSearchHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ABCDSearchHeadView"];
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 3 *TABBARHEIGHT, 0);
    
    if (@available (iOS 11,*)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}



- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    ABCDBtnItemModel *btnModel = self.dataArr[self.index];
       
    return btnModel.goods.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((SW -20) ,130);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 5;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(SW, 0);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    ABCDSearchHeadView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ABCDSearchHeadView" forIndexPath:indexPath];
    ABCDBtnItemModel *model = self.dataArr[self.index];
    NSString *url = [NSString stringWithFormat:@"%@",model.icon];
    [view.iconV sd_setImageWithURL:[NSURL URLWithString:url]];
    
    return view;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ABCDDDSearchCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ABCDDDSearchCell" forIndexPath:indexPath];
    ABCDBtnItemModel *btnModel = self.dataArr[self.index];
    ABCDGoodsModel *model = btnModel.goods[indexPath.item];

    NSString *url = [NSString stringWithFormat:@"%@",model.smallPic];
    [cell.iconV sd_setImageWithURL:[NSURL URLWithString:url]];
    cell.nameLab.text = [NSString stringWithFormat:@"%@",model.name] ;
    cell.priceLab.text = [NSString stringWithFormat:@" %.f",model.memberPrice.doubleValue];
    cell.soldLab.text = [NSString stringWithFormat:@"原价: %.f",model.originalPrice.doubleValue];
    cell.oneLab.text = [NSString stringWithFormat:@"销量: %.f",model.originalPrice.doubleValue +798 ];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ABCDGoodsDetailViewController *vc = [ABCDGoodsDetailViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    ABCDBtnItemModel *model = self.dataArr[self.index];
    ABCDGoodsModel *goodsModel = model.goods[indexPath.item];
    vc.model = goodsModel;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)http {
    
    
    NSMutableDictionary *catrDic = [NSMutableDictionary dictionary];
    [catrDic setValue:ShopKey forKey:@"shopKey"];
    [NetHttpTool Post:CategoaryList paramets:catrDic Succeed:^(id  _Nonnull returnData) {
        
        if (returnData[@"status"] ) {
            
            NSDictionary *data = returnData[@"data"];
            NSArray *shopCircles = data[@"types"];
            if (shopCircles.count>0) {
                NSArray *dataArr =  [ABCDBtnItemModel mj_objectArrayWithKeyValuesArray:shopCircles];
                self.dataArr = dataArr.mutableCopy;
                [self.collectionView reloadData];

            }
        }
        
    } Failure:^(NSError * _Nonnull error) {
        [MBProgressHUD showError:@"网络错误"];
    }];
    
}

@end

