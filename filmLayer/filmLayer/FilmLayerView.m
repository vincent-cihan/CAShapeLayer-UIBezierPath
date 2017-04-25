//
//  FilmLayerView.m
//  filmLayer
//
//  Created by 刘乙灏 on 2017/4/25.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

#import "FilmLayerView.h"

@implementation FilmLayerView

- (void)drawRect:(CGRect)rect {
    CGSize viewSize = self.bounds.size;
    CGFloat layerHeight = viewSize.height / 2;
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, viewSize.height - layerHeight)];
    [path addLineToPoint:CGPointMake(0, viewSize.height)];
    [path addLineToPoint:CGPointMake(viewSize.width, viewSize.height)];
    [path addLineToPoint:CGPointMake(viewSize.width, viewSize.height - layerHeight)];
    [path addQuadCurveToPoint:CGPointMake(0, viewSize.height - layerHeight) controlPoint:CGPointMake(viewSize.width / 2, 0)];
    layer.path = path.CGPath;
    layer.fillColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:layer];
}

@end
