//
//  ViewController.m
//  Test
//
//  Created by 刘乙灏 on 2017/4/24.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

#import "ViewController.h"
#import "BezierView.h"

@interface ViewController ()

@property (nonatomic, strong) CAShapeLayer *animationLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addCurveToPoint:CGPointMake(200, 50) controlPoint1:CGPointMake(100, 0) controlPoint2:CGPointMake(150, 100)];
    self.animationLayer = [[CAShapeLayer alloc] init];
    self.animationLayer.path = path.CGPath;
    self.animationLayer.strokeColor = [UIColor blackColor].CGColor;
    self.animationLayer.fillColor = [UIColor clearColor].CGColor;
    self.animationLayer.lineWidth = 1;
    [self.view.layer addSublayer:self.animationLayer];
    
}

- (void)anim1 {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = @0;
    animation.toValue = @1;
    animation.duration = 2;
    [self.animationLayer addAnimation:animation forKey:@""];
}

- (void)anim2 {
    self.animationLayer.strokeStart = 0.5;
    self.animationLayer.strokeEnd = 0.5;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation.fromValue = @0.5;
    animation.toValue = @0;
    animation.duration = 2;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation2.fromValue = @0.5;
    animation2.toValue = @1;
    animation2.duration = 2;
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    
    [self.animationLayer addAnimation:animation forKey:@""];
    [self.animationLayer addAnimation:animation2 forKey:@""];
}

- (void)anim3 {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    animation.fromValue = @1;
    animation.toValue = @10;
    animation.duration = 2;
    [self.animationLayer addAnimation:animation forKey:@""];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    static NSInteger count = 0;
    switch (count % 3) {
        case 0:
            [self anim1];
            break;
        case 1:
            [self anim2];
            break;
        case 2:
            [self anim3];
            break;
            
        default:
            break;
    }
    count ++;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
