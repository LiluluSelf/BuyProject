//
//  BYPublicViewController.m
//  BuyProject
//
//  Created by hanvon on 16/6/29.
//  Copyright © 2016年 hanvon. All rights reserved.
//

#import "BYPublicViewController.h"
#import "MacroDefine.h"
@interface BYPublicViewController ()

@end

@implementation BYPublicViewController


- (NSString *)tabTitle
{
    return self.title;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   //设置navBar的title部分的字体，字体颜色，半透明
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.barTintColor = APP_COLOR;
    self.view.backgroundColor=COLOR(248, 248, 248);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
