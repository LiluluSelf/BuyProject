//
//  BYMainTabViewController.m
//  BuyProject
//
//  Created by hanvon on 16/6/29.
//  Copyright © 2016年 hanvon. All rights reserved.
//

#import "BYMainTabViewController.h"
#import "BYMainViewController.h"
#import "BYListViewController.h"
#import "BYSettingViewController.h"
#import "BYPublicNavgationViewController.h"
#import "MacroDefine.h"

@interface BYMainTabViewController ()<UITabBarControllerDelegate>
@end

@implementation BYMainTabViewController

- (id)init
{
    self = [super init];
    if (self) {
       
        BYPublicNavgationViewController *listVC=[[BYPublicNavgationViewController alloc]initWithRootViewController:[[BYListViewController alloc]init]];
        listVC.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"首页" image:[UIImage imageNamed:@"home"] selectedImage:[UIImage imageNamed:@"home"]];
        
        
        BYPublicNavgationViewController *mainVC=[[BYPublicNavgationViewController alloc]initWithRootViewController:[[BYMainViewController alloc]init]];
       mainVC.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"晒单" image:[UIImage imageNamed:@"晒单"] selectedImage:[UIImage imageNamed:@"晒单"]];
        
        BYPublicNavgationViewController *settingVC=[[BYPublicNavgationViewController alloc]initWithRootViewController:[[BYSettingViewController alloc]init]];
        settingVC.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"我" image:[UIImage imageNamed:@"我"] selectedImage:[UIImage imageNamed:@"我"]];
        
        self.tabBar.tintColor=APP_COLOR;
        self.viewControllers=@[listVC,mainVC,settingVC];
        self.delegate=self;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
