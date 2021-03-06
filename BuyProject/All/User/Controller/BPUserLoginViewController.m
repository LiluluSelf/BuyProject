;//
//  BPUserLoginViewController.m
//  BuyProject
//
//  Created by hanvon on 16/7/7.
//  Copyright © 2016年 hanvon. All rights reserved.
//

#import "BPUserLoginViewController.h"
#import "BPUserRigsterViewController.h"
#import "BPUserSearchPwdViewController.h"

#define Button_Base_Tag 100
@interface BPUserLoginViewController ()
@property (nonatomic, strong) UITextField *username;
@property (nonatomic, strong) UITextField *password;


@end
@implementation BPUserLoginViewController

- (void)viewDidLoad
{
    self.title=@"登录";
    [self setControl];
}
#pragma -mark 页面控件
- (void)setControl
{
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
    RigesterBtn.frame=CGRectMake(210, height+64+160, SCREEN.width-260, 40);
    [RigesterBtn setTitle:@"注册" forState:UIControlStateNormal];
    [RigesterBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    RigesterBtn.backgroundColor=[UIColor orangeColor];
    RigesterBtn.layer.cornerRadius=20;
    [RigesterBtn addTarget:self action:@selector(RegisterClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *searchPwdBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:searchPwdBtn];
    searchPwdBtn.frame=CGRectMake(50, height+64+160, SCREEN.width-260, 40);
    [searchPwdBtn setTitle:@"找回密码" forState:UIControlStateNormal];
    [searchPwdBtn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    searchPwdBtn.backgroundColor=[UIColor orangeColor];
    searchPwdBtn.layer.cornerRadius=20;
    [searchPwdBtn addTarget:self action:@selector(searchPwd) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *otherLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, height+460, SCREEN.width, 40)];
    [self.view addSubview:otherLabel];
    [otherLabel setText:@"或用以下方式登录"];
    otherLabel.textAlignment=NSTextAlignmentCenter;
    otherLabel.font=[UIFont systemFontOfSize:13.0];
    otherLabel.textColor=[UIColor whiteColor];
    
    UIView *lineView=[[UIView alloc]initWithFrame:CGRectMake(0, height+490, SCREEN.width, 1)];
    [self.view addSubview:lineView];
    lineView.backgroundColor=[UIColor blackColor];
    lineView.alpha=0.5;
    
    CGFloat width =60;
    
    NSArray *imageArray=@[[UIImage imageNamed:@"qq"],[UIImage imageNamed:@"weibo"],[UIImage imageNamed:@"weixin"]];
    NSArray *colorArray=@[COLOR(82, 152, 205),COLOR(205, 100, 48),COLOR(134, 202, 101)];
    CGFloat distant=(SCREEN.width - width*imageArray.count)/(imageArray.count +1);
    for (NSInteger i=0; i<imageArray.count; i++) {
        UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake((distant *(i%imageArray.count+1)+width*(i%imageArray.count)), SCREEN.height-140, width, width);
        [self.view addSubview:btn];
        btn.layer.cornerRadius=width/2;
        
        [btn setImage:imageArray[i] forState:UIControlStateNormal];
        [btn setBackgroundColor:colorArray[i]];
        [btn addTarget:self action:@selector(actionThirdLogin:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag=Button_Base_Tag +i ;
    }
}

#pragma - mark 第三方登录方法
- (void)actionThirdLogin:(UIButton *)btn
{
   
    NSInteger tag=btn.tag;
    switch (tag) {
        case Button_Base_Tag://qq
             NSLog(@"qq第三方登录");
            break;
        case Button_Base_Tag+1://weibo
             NSLog(@"wb第三方登录");
            break;
        case Button_Base_Tag+2://weixin
             NSLog(@"wx第三方登录");
            break;
        default:
            break;
    }
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

- (void)searchPwd
{
    BPUserSearchPwdViewController *vc=[[BPUserSearchPwdViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
