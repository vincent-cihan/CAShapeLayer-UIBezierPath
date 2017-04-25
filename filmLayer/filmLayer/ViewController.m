//
//  ViewController.m
//  filmLayer
//
//  Created by 刘乙灏 on 2017/4/25.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

#import "ViewController.h"
#import "FilmLayerView.h"

@interface ViewController ()

@property (nonatomic, strong) FilmLayerView *filmView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.filmView];
    self.filmView.center = self.view.center;
}

- (FilmLayerView *)filmView {
    if (!_filmView) {
        _filmView = [[FilmLayerView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    }
    return _filmView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
