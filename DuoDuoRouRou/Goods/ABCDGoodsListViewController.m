//
//  ABCDGoodsListViewController.m
//  DuoDuoRouRou
//
//  Created by 林宇 on 2020/4/23.
//  Copyright © 2020 Limzoo. All rights reserved.
//
#import "ABCDGoodsListViewController.h"
#import "ABCDDDGoodsListCell.h"
#import "ABCDGoodsDetailViewController.h"
#import "ABCDGoodsModel.h"
@interface ABCDGoodsListViewController ()
<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
//
@property(nonatomic,strong) UICollectionView *collectionView;
@end

@implementation ABCDGoodsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationView.titleLabel.text = self.titles;
    self.navigationView.lineView.hidden = YES;
    self.view.backgroundColor = DYWhite;

    [MBProgressHUD showMessage:@"loading"];

    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collectionView.dataSource =self;
    self.collectionView.delegate = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.navigationView.mas_bottom).offset(5);
    }];
    
    [self.collectionView registerClass:[ABCDDDGoodsListCell class] forCellWithReuseIdentifier:@"ABCDDDGoodsListCell"];
    
    
    
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
    
    return self.dataArr.count;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake((SW-15)/2, (SW-30)/2+120);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeZero;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 5;
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
   return UIEdgeInsetsMake(0, 5, 0, 5);
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ABCDDDGoodsListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ABCDDDGoodsListCell" forIndexPath:indexPath];
    ABCDGoodsModel *model = self.dataArr[indexPath.item];
    cell.nameLab.text = model.name;
    cell.priceLab.text = [NSString stringWithFormat:@"¥ %.f",model.memberPrice.doubleValue];
    
    
    NSString *urls = [NSString stringWithFormat:@"%@",model.smallPic];
    
    [cell.iconV sd_setImageWithURL:[NSURL URLWithString:urls]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ABCDGoodsDetailViewController *vc = [[ABCDGoodsDetailViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    ABCDGoodsModel *model = self.dataArr[indexPath.section];
    
    vc.model = model;
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)setDataArr:(NSArray *)dataArr {
    _dataArr = dataArr;
    
    [self.collectionView reloadData];
}

@end
