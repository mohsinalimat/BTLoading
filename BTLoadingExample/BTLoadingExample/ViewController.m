//
//  ViewController.m
//  BTLoadingExample
//
//  Created by stonemover on 2019/1/20.
//  Copyright © 2019 stonemover. All rights reserved.
//

#import "ViewController.h"
#import "BTToast.h"
#import "UIViewController+BTLoading.h"
#import "BTProgress.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray * titles;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"BTLoading";
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.titles=@[@"Toast-文字提示",
                  @"Toast—文字正确提示",
                  @"Toast—文字警告提示",
                  @"Toast—文字错误提示",
                  @"挡板-加载中",
                  @"挡板-加载失败",
                  @"挡板-空数据",
                  @"菊花加载-无文字",
                  @"菊花加载-有文字"
                  ];
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"UITableViewCell" bundle:nil] forCellReuseIdentifier:@"UITableViewCellId"];
    [self initLoading];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismiss];
    });
}


#pragma mark tableView data delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titles.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCellId"];
    cell.textLabel.text=self.titles[indexPath.row];
    return cell;
}


#pragma mark tableView delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [BTToast show:@"Hello World"];
            break;
        case 1:
            [BTToast showSuccess:@"发送成功~"];
            break;
        case 2:
            [BTToast showWarning:@"请输入正确的手机号码，后面的文字是为了增加字符串的长度加上去的了"];
            break;
        case 3:
            [BTToast showError:@"暂无此账号"];
            break;
        case 4:
        {
            [self showLoading];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self dismiss];
            });
        }
            break;
        case 5:
            [self showNetError];
            break;
        case 6:
            [self showEmpty];
            break;
        case 7:
        {
            [BTProgress showLoading];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [BTProgress hideLoading];
            });
        }
            break;
        case 8:
        {
            [BTProgress showLoading:@"玩命加载中..."];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [BTProgress hideLoading];
            });
        }
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

- (void)reload{
    [super reload];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismiss];
    });
}

@end
