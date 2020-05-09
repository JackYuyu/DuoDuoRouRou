//
//  TabBarViewController.m
//  DuoDuoRouRou
//
//  Created by 林宇 on 2020/4/23.
//  Copyright © 2020 Limzoo. All rights reserved.
//
#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *vcs = [NSMutableArray array];
    NSArray *imgs= @[@"首页",@"搜索",@"购物车",@"我的"];
    NSArray *vcName= @[@"ABCDHomeViewController",@"ABCDSearchViewController",@"LZCartViewController",@"ABCDSearchViewController"];
    
    for (int i = 0; i < vcName.count; i++) {
        UIViewController *vc = [[NSClassFromString(vcName[i]) alloc]init];
        EasyNavigationController *nav = [[EasyNavigationController alloc]initWithRootViewController:vc];
        
        NSString *selectImg = [NSString stringWithFormat:@"%@_selected",imgs[i]];
        vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImg] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        
        vc.tabBarItem.image = [[UIImage imageNamed:imgs[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        vc.view.backgroundColor = DYWhite;
        
        vc.tabBarItem.title = imgs[i];
        
        
        [vc.navigationView setNavigationBackgroundColor:DYNAVIBARCOLOR];

        vc.navigationView.titleLabel.text = imgs[i];
        
        [vcs addObject:nav];
    }
    
    
    self.tabBar.tintColor = DYTINCOLOR;
    self.viewControllers = vcs;
    self.tabBar.translucent = NO;
    self.tabBar.barTintColor = DYBARTINCOLOR;
}

@end
