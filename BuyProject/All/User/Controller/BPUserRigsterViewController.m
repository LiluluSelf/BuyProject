//
//  BPUserRigsterViewController.m
//  BuyProject
//
//  Created by hanvon on 16/7/7.
//  Copyright © 2016年 hanvon. All rights reserved.
//

#import "BPUserRigsterViewController.h"
#import <GPUImage/GPUImage.h>
//#import "MacroDefine.h"

@interface BPUserRigsterViewController ()
@property (nonatomic, strong) UITextField *username;
@property (nonatomic, strong) UITextField *password;

@end
@implementation BPUserRigsterViewController

- (void)viewDidLoad
{
    self.title=@"注册";
    self.view.backgroundColor=[UIColor yellowColor];
    
    GPUImageGaussianBlurFilter *blurFilter=[[GPUImageGaussianBlurFilter alloc]init];
    blurFilter.blurRadiusInPixels=5.0;
    UIImage *image=[UIImage imageNamed:@"usr_bg"];
    UIImage *blurImage=[blurFilter imageByFilteringImage:image];
    UIImageView *blurImgView=[[UIImageView alloc]initWithImage:blurImage];
    blurImgView.frame=self.view.bounds;
    [self.view addSubview:blurImgView];
    
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
    
    

}
@end
