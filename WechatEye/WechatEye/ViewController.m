//
//  ViewController.m
//  WechatEye
//
//  Created by 刘乙灏 on 2017/4/25.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

#import "ViewController.h"
#import "WechatEyeView.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) WechatEyeView *eyeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    self.eyeView = [[WechatEyeView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame) / 2 - 25, -64, 50, 30)];
    [self.tableView addSubview:self.eyeView];
    self.view.backgroundColor = [UIColor blackColor];
    self.tableView.backgroundColor = [UIColor clearColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = @"test";
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.eyeView animationWith:scrollView.contentOffset.y];
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}


@end
