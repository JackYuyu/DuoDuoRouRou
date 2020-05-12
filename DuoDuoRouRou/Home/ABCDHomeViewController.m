//
//  ABCDHomeViewController.m
//  DuoDuoRouRou
//
//  Created by 林宇 on 2020/4/23.
//  Copyright © 2020 Limzoo. All rights reserved.
//

#import "ABCDHomeViewController.h"
#import "ABCDHeadReusableView.h"
#import "ABCDDDItemCell.h"
#import "ABCDDDImageCell.h"
#import "ABCDDDSingleImageCell.h"
#import "ABCDDDCycleCell.h"
#import "ABCDDDBtnItemCell.h"

#import "ABCDGoodsDetailViewController.h"
#import "ABCDGoodsListViewController.h"
#import "ABCDBtnItemModel.h"
#import "ABCDGoodsModel.h"
@interface ABCDHomeViewController ()
<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
//
@property(nonatomic,strong) NSMutableArray *dataArr;
//
@property(nonatomic,strong) NSMutableArray *cricleArr;
//
@property(nonatomic,strong) NSMutableArray *itemModel;
@end

@implementation ABCDHomeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self http];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArr   = [NSMutableArray array];
    self.cricleArr = [NSMutableArray array];
    self.itemModel = [NSMutableArray array];
  
    self.navigationView.lineView.hidden = YES;
   
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.view addSubview:self.collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = DYWhite;
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.navigationView.mas_bottom);
        make.bottom.mas_equalTo(0);
    }];

    [self registCell];
    
    
    if (@available (iOS 11,*)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
   
 
   
}


- (void)registCell {
    
    
    [self.collectionView registerClass:[ABCDDDCycleCell class] forCellWithReuseIdentifier:@"ABCDDDCycleCell"];
    [self.collectionView registerClass:[ABCDDDBtnItemCell class] forCellWithReuseIdentifier:@"ABCDDDBtnItemCell"];
    [self.collectionView registerClass:[ABCDDDImageCell class] forCellWithReuseIdentifier:@"ABCDDDImageCell"];
   [self.collectionView registerClass:[ABCDDDItemCell class] forCellWithReuseIdentifier:@"ABCDDDItemCell"];
    [self.collectionView registerClass:[ABCDDDSingleImageCell class] forCellWithReuseIdentifier:@"ABCDDDSingleImageCell"];

    [self.collectionView registerClass:[ABCDHeadReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ABCDHeadReusableView"];
    
     
   
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
            
        case 1:
            if (self.itemModel.count >7) {
                return 8;
            }
            return 0;
            break;
        case 2:
            
            return 1;
            break;
//        case 3:
//
//            if (self.itemModel.count >1) {
//
//                return  3;
//            }else
//            {
//                return 0;
//            }
//            break;
        case 3:
        {
            if (self.itemModel.count >1) {
                
                ABCDBtnItemModel *model = self.itemModel[1];
                
                return model.goods.count;
            }else
            {
                return 0;
            }
        }
            break;
        case 4:
        {
            if (self.itemModel.count >1) {
                
                
                ABCDBtnItemModel *model = self.itemModel[2];
                
                return model.goods.count;
            }else
            {
                return 0;
            }
        }
            break;
        
        default:
            return 0;
            break;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            return CGSizeMake(SW, 250);
        }
            break;
        case 1:
        {
            return CGSizeMake((SW-23)/4, (SW-23)/4+20);
        }
        case 2:
        {
            return CGSizeMake(SW, 180);
        }
            break;
//        case 3:
//        {
//            return CGSizeMake((SW-20), 200);
//        }
//            break;
        default:
        {
            
            return CGSizeMake((SW-25)/2, (SW-15)/2+100);
        }
            break;
    }
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    switch (section) {
        case 0:
            return 0;
            break;
            
        case 1:
            
            return 1;
        case 2:
            
            return 0;
        
        default:
            return 5;
            break;
    }
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    switch (section) {
        case 0:
            return 0;
            break;
            
        case 1:
            
            return 1;
        case 2:
            
            return 1;
//        case 3:
//
//            return 1;
            
        default:
            return 5;
            break;
    }
    
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section > 0) {
        return UIEdgeInsetsMake(0, 10, 0, 10);
    }else {
        return UIEdgeInsetsZero;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    if (section >1) {
        return CGSizeMake(SW, 50);
    }

    return CGSizeZero;
}




- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 2) {
        ABCDHeadReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ABCDHeadReusableView" forIndexPath:indexPath];
        view.nameLab.text = @"新品折扣";
        return view;
    }
//    else if (indexPath.section == 3) {
//        ABCDHeadReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ABCDHeadReusableView" forIndexPath:indexPath];
//        view.nameLab.text = @"新手入门植物";
//        return view;
//    }
    else if (indexPath.section == 3) {
        ABCDHeadReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ABCDHeadReusableView" forIndexPath:indexPath];
        view.nameLab.text = @"爱好者选择";
        return view;
    }else if (indexPath.section == 4) {
        ABCDHeadReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ABCDHeadReusableView" forIndexPath:indexPath];
        view.nameLab.text = @"资深种植选择";
        return view;
    }else{
        return nil;
    }
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            
            ABCDDDCycleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ABCDDDCycleCell" forIndexPath:indexPath];
            cell.cycleView.imageURLStringsGroup = self.cricleArr;
            cell.cycleView1.imageURLStringsGroup = self.cricleArr;
            return cell;
        }
            break;
        case 1:{
            
            ABCDDDBtnItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ABCDDDBtnItemCell" forIndexPath:indexPath];
            ABCDBtnItemModel *model = self.itemModel[indexPath.row];
            [cell.iconV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",model.icon]]];
            cell.nameLab.text = model.name;
            
            return cell;
        }
        case 2:{
            
            
            ABCDDDSingleImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ABCDDDSingleImageCell" forIndexPath:indexPath];
            
            
            return cell;
            
            
        }
//        case 3:{
//
//
//           ABCDDDImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ABCDDDImageCell" forIndexPath:indexPath];
//
//           ABCDBtnItemModel *model = self.itemModel[0];
//
//           ABCDGoodsModel *goodModel = model.goods[indexPath.row];
//
//            switch (indexPath.row) {
//                case 0:
//                {
//                    [cell.iconV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",goodModel.smallPic]]];
//                    cell.nameLab.text = @"盖亚猪笼草";
//                    cell.infoLab.text = @"驱虫净化空气";
//                    [cell.iconV1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",goodModel.pic1]]];
//                    [cell.iconV2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",goodModel.pic2]]];
//
//                }
//                    break;
//                case 1:
//                {
//                    [cell.iconV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",goodModel.smallPic]]];
//                    cell.nameLab.text = @"大型捕蝇草";
//                    cell.infoLab.text = @"盆栽室内草";
//                    [cell.iconV1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",goodModel.pic1]]];
//                    [cell.iconV2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",goodModel.pic2]]];
//
//                }
//                    break;
//                case 2:
//                {
//                    [cell.iconV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",goodModel.smallPic]]];
//                    cell.nameLab.text = @"杯夹捕蝇草";
//                    cell.infoLab.text = @"十分好养活!";
//                    [cell.iconV1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",goodModel.pic1]]];
//                    [cell.iconV2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",goodModel.pic2]]];
//
//                }
//                    break;
//
//
//                default:
//                    break;
//            }
//           return cell;
//
//
//        }
        case 3:{
            
            ABCDDDItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ABCDDDItemCell" forIndexPath:indexPath];
            ABCDBtnItemModel *model = self.itemModel[1];
            
            ABCDGoodsModel *goodModel = model.goods[indexPath.row];
            [cell.iconV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",goodModel.smallPic]]];
            cell.nameLab.text = goodModel.name;
            
            cell.merPriceLab.text = [NSString stringWithFormat:@"%.2f",goodModel.memberPrice.doubleValue];
            return cell;
                
                
                
            
            
        }
        case 4:{
            
            ABCDDDItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ABCDDDItemCell" forIndexPath:indexPath];
            ABCDBtnItemModel *model = self.itemModel[2];
            
            ABCDGoodsModel *goodModel = model.goods[indexPath.row];
            [cell.iconV sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",goodModel.smallPic]]];
            cell.nameLab.text = goodModel.name;
            
            cell.merPriceLab.text = [NSString stringWithFormat:@"%.2f",goodModel.memberPrice.doubleValue];
            return cell;
            
        }
        
        default:
            return nil;
            break;
    }
    
        
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==1) {
        ABCDBtnItemModel *model = self.itemModel[indexPath.row];
        NSArray *dataArr = model.goods;
        ABCDGoodsListViewController *vc = [ABCDGoodsListViewController new];
        vc.dataArr = dataArr;
        vc.titles = model.name;
        
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section == 2) {
        ABCDBtnItemModel *model = self.itemModel[0];
        NSArray *dataArr = model.goods;
        ABCDGoodsDetailViewController *vc = [ABCDGoodsDetailViewController new];
        vc.model = dataArr[indexPath.row];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
//    if (indexPath.section == 3) {
//        ABCDBtnItemModel *model = self.itemModel[0];
//        NSArray *dataArr = model.goods;
//        ABCDGoodsDetailViewController *vc = [ABCDGoodsDetailViewController new];
//        vc.model = dataArr[indexPath.row];
//        vc.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:vc animated:YES];
//    }
    if (indexPath.section == 3) {
        ABCDBtnItemModel *model = self.itemModel[1];
        NSArray *dataArr = model.goods;
        ABCDGoodsDetailViewController *vc = [ABCDGoodsDetailViewController new];
        vc.model = dataArr[indexPath.row];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if (indexPath.section ==  4) {
        ABCDBtnItemModel *model = self.itemModel[2];
        NSArray *dataArr = model.goods;
        ABCDGoodsDetailViewController *vc = [ABCDGoodsDetailViewController new];
        vc.model = dataArr[indexPath.row];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}


- (void)http {
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    //    [dic setObject:@"true" forKey:@"noPage"];
    [dic setObject:@(0) forKey:@"page"];
    [dic setObject:@(10) forKey:@"pageSize"];
    [dic setObject:ShopKey forKey:@"shopKey"];
    weakSelf(self)
    [NetHttpTool Post:ShopCircle paramets:dic Succeed:^(id  _Nonnull returnData) {
        
        if (returnData[@"status"] ) {
            NSDictionary *data = returnData[@"data"];
            NSArray *shopCircles = data[@"shopCircles"];
            if (shopCircles.count>0) {
                NSMutableArray *imgs = [NSMutableArray array];
                for (NSDictionary *dic in shopCircles) {
                    NSString *cricleImgUrl = [NSString stringWithFormat:@"%@",dic[@"pic"]];
                    [imgs addObject:cricleImgUrl];
                }
                weakself.cricleArr = imgs;
                [weakself.collectionView reloadData];
            }
        }
        
    } Failure:^(NSError * _Nonnull error) {
        [MBProgressHUD showError:@"网络错误，请检查网路"];
    }];
    NSMutableDictionary *catrDic = [NSMutableDictionary dictionary];
    //    [catrDic setValue:@"66" forKey:@"id"];
    [catrDic setValue:ShopKey forKey:@"shopKey"];
    [NetHttpTool Post:CategoaryList paramets:catrDic Succeed:^(id  _Nonnull returnData) {
        
        if (returnData[@"status"] ) {
            NSDictionary *data = returnData[@"data"];
            NSArray *shopCircles = data[@"types"];
            if (shopCircles.count>0) {
                weakself.itemModel =  [ABCDBtnItemModel mj_objectArrayWithKeyValuesArray:shopCircles];

                [weakself.collectionView reloadData];
            }
        }
        
    } Failure:^(NSError * _Nonnull error) {
        [MBProgressHUD showError:@"网络错误，请检查网路"];
    }];
    
}


@end

