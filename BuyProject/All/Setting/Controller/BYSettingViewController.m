//
//  BYSettingViewController.m
//  BuyProject
//
//  Created by hanvon on 16/6/29.
//  Copyright © 2016年 hanvon. All rights reserved.
//

#import "BYSettingViewController.h"
#import "MacroDefine.h"
#import "UIScrollView+TwitterCover.h"
#import "BPUserLoginViewController.h"
@interface BYSettingViewController ()<UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate>
{
    UIView *topView;
}
@property (nonatomic, strong) UITableView *tableViewSetting;
@property (nonatomic, strong) NSMutableArray *mutableArraySettings;

@end
@implementation BYSettingViewController
- (id)init
{
    self = [super init];
    if (self) {
        self.title=@"我";
    }
    return self;
}
- (void)share
{
    
}

- (void)viewDidLoad
{
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"分享" style:UIBarButtonItemStylePlain target:self action:@selector(share)];
    self.mutableArraySettings = [NSMutableArray arrayWithObjects:[NSArray arrayWithObjects:@"我的夺宝记录",@"我的夺宝码",@"获得的商品",@"收货地址 ", nil],[NSArray arrayWithObjects:@"设置",nil], nil];
    
    UITableView *tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN.width, SCREEN.height-self.tabBarController.tabBar.frame.size.height) style:UITableViewStyleGrouped];
    tableView.dataSource=self;
    tableView.delegate=self;
    [self.view addSubview:tableView];
    self.tableViewSetting = tableView;
    
    [self.tableViewSetting addTwitterCoverWithImage:[UIImage imageNamed:@"usr_bg"] withTopView:topView];
    
    self.tableViewSetting.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN.width, CHTwitterCoverViewHeight+topView.bounds.size.height)];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(actionLogin:)];
}
- (void)actionLogin:(UIBarButtonItem *)item
{
    BPUserLoginViewController *userLogin=[[BPUserLoginViewController alloc]init];
    userLogin.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:userLogin animated:YES];
}



#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.mutableArraySettings.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array = self.mutableArraySettings[section];
    return array.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellSettings";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    NSArray *array = self.mutableArraySettings[indexPath.section];
    cell.textLabel.text = array[indexPath.row];
    
    return cell;
}

@end
