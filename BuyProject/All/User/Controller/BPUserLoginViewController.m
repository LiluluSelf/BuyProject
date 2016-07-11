//
//  BPUserLoginViewController.m
//  BuyProject
//
//  Created by hanvon on 16/7/7.
//  Copyright © 2016年 hanvon. All rights reserved.
//

#import "BPUserLoginViewController.h"
#import <GPUImage/GPUImage.h>
#import "MacroDefine.h"
#import <BmobSDK/Bmob.h>
#import "BPUserRigsterViewController.h"
@interface BPUserLoginViewController ()
@property (nonatomic, strong) UITextField *username;
@property (nonatomic, strong) UITextField *password;


@end
@implementation BPUserLoginViewController

- (void)viewDidLoad
{
    self.title=@"登录";
    self.view.backgroundColor=[UIColor orangeColor];
    GPUImageGaussianBlurFilter *blurFilter=[[GPUImageGaussianBlurFilter alloc]init];
    blurFilter.blurRadiusInPixels=5.0;
    UIImage *image=[UIImage imageNamed:@"usr_bg"];
    UIImage *blurImage=[blurFilter imageByFilteringImage:image];
    UIImageView *imageView=[[UIImageView alloc]initWithImage:blurImage];
    imageView.frame=self.view.bounds;
    [self.view addSubview:imageView];
    
    CGFloat height=50;
    
    UITextField *username=[[UITextField alloc]init];
    username.frame=CGRectMake(50, height+64, SCREEN.width-100, 40);
    username.placeholder=@"邮箱";
    username.textAlignment=NSTextAlignmentCenter;
    username.borderStyle=UITextBorderStyleNone;
    username.layer.borderWidth=1.0;
    username.layer.borderColor=[UIColor whiteColor].CGColor;
    username.layer.cornerRadius=20;
    
    [self.view addSubview:username];
    self.username=username;
    
    
    UITextField *password=[[UITextField alloc]init];
    password.frame=CGRectMake(50, height+64+50, SCREEN.width-100, 40);
    password.placeholder=@"密码";
    password.textAlignment=NSTextAlignmentCenter;
    password.borderStyle=UITextBorderStyleNone;
    password.layer.borderWidth=1.0;
    password.layer.borderColor=[UIColor whiteColor].CGColor;
    password.layer.cornerRadius=20;
    password.secureTextEntry=YES;
    [self.view addSubview:password];
    self.password=password;
    
    UIButton *loginBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:loginBtn];
    loginBtn.frame=CGRectMake(50, height+64+100, SCREEN.width-100, 40);
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    loginBtn.backgroundColor=[UIColor orangeColor];
    loginBtn.layer.cornerRadius=20;
    [loginBtn addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    UIButton *RigesterBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:RigesterBtn];
    RigesterBtn.frame=CGRectMake(200, height+64+160, SCREEN.width-240, 40);
    [RigesterBtn setTitle:@"注册" forState:UIControlStateNormal];
    [RigesterBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    RigesterBtn.backgroundColor=[UIColor orangeColor];
    RigesterBtn.layer.cornerRadius=20;
    [RigesterBtn addTarget:self action:@selector(RegisterClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)actionClick:(UIButton *)btn
{
    NSLog(@"正在登录");
    [BmobUser loginInbackgroundWithAccount:_username.text andPassword:_password.text block:^(BmobUser *user, NSError *error) {
        if (user) {
            NSLog(@"登录成功%@ %@",self.username.text,self.password.text);
        }
        if(error){
            NSLog(@"登录失败%@ %@",self.username.text,self.password.text);
            NSLog(@"error %@",error);
        }
    }];
    NSLog(@"11");
}
- (void)RegisterClick:(UIButton *)btn
{
    BPUserRigsterViewController *vc=[[BPUserRigsterViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
