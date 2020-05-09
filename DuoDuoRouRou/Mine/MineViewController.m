//
//  MineViewController.m
//  DuoDuoRouRou
//
//  Created by 林宇 on 2020/4/23.
//  Copyright © 2020 Limzoo. All rights reserved.
//
#import "MineViewController.h"
#import "MineCell.h"
#import "DDMineHeadView.h"


#import "OrderViewController.h"
#import "SettingViewController.h"
#import "AddressViewController.h"
@interface MineViewController ()
<UITableViewDelegate,UITableViewDataSource,TZImagePickerControllerDelegate>
{
    NSArray *titles;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *iconBtn;
@property (nonatomic, strong) UILabel *nameLab;
@end

@implementation MineViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSNumber *ID = [[NSUserDefaults standardUserDefaults] valueForKey:@"id"];
    if (ID.integerValue <=0) {
        
        RegistLoginViewController *vc = [RegistLoginViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }else{
        
        NSString *nick = [Userdefaults valueForKey:@"nickName"];
        if (nick.length >0) {
            self.nameLab.text = nick;
        }else {
            self.nameLab.text = @"昵称";
        }
        
        NSData *data = [[NSUserDefaults standardUserDefaults]valueForKey:@"icon"];
        if (data) {
            UIImage *img = [[UIImage alloc]initWithData:data];
            [self.iconBtn setBackgroundImage:img forState:UIControlStateNormal];
        }
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationView.hidden = YES;
    [self setTableView];
    if (@available (iOS 11,*)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    titles = @[@"订单",@"地址",@"设置"];
}


- (void)setTableView {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view);
    }];
    [self.tableView registerNib:[UINib nibWithNibName:@"MineCell" bundle:nil] forCellReuseIdentifier:@"MineCell"];
    [self.tableView registerClass:[DDMineHeadView class] forHeaderFooterViewReuseIdentifier:@"DDMineHeadView"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return titles.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineCell"];
    cell.iconV.image = [UIImage imageNamed:titles[indexPath.row]];
    cell.nameLab.text = titles[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 200;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    DDMineHeadView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"DDMineHeadView"];
    self.iconBtn = view.iconV;
    self.nameLab = view.nameLab;
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    return [[UIView alloc]initWithFrame:CGRectMake(0, 0, SW, 1)];
    
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        
        [self orderBtn:nil];
    }
    if (indexPath.row == 1) {
        [self addressBtn:nil];
    }
    
    if (indexPath.row == 2) {
        [self settingBtn:nil];
    }
}
- (void)addressBtn:(UIButton *) btn {
    AddressViewController *vc = [AddressViewController  new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)orderBtn:(UIButton *) btn {
    OrderViewController *vc = [OrderViewController  new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)settingBtn:(UIButton *) btn {
    SettingViewController *vc = [SettingViewController  new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}



- (void)setImage:(UIButton *)btn {
    
    TZImagePickerController *pickVc = [[TZImagePickerController alloc]initWithMaxImagesCount:1 delegate:self];
    pickVc.allowTakePicture = NO;
    pickVc.allowPickingVideo = NO;
    pickVc.allowCameraLocation = NO;
    [pickVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        [self.iconBtn setBackgroundImage:photos.lastObject forState:UIControlStateNormal];
        NSData *data = UIImagePNGRepresentation(photos.lastObject);
        [Userdefaults setValue:data forKey:@"icon"];
    }];
    
    [self.navigationController presentViewController:pickVc animated:YES completion:nil];
}
 
@end

