//
//  BezierView.m
//  Test
//
//  Created by 刘乙灏 on 2017/4/24.
//  Copyright © 2017年 刘乙灏. All rights reserved.
//

#import "BezierView.h"

@implementation BezierView

- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(10, 10)];
    [path addLineToPoint:CGPointMake(80, 40)];
    [path addLineToPoint:CGPointMake(40, 80)];
    [path addLineToPoint:CGPointMake(40, 40)];
    path.lineWidth = 3;
    
    UIBezierPath *reversingPath = [path bezierPathByReversingPath];
    reversingPath.lineWidth = 3;
    
    CGAffineTransform transform = CGAffineTransformMakeTranslation(200, 0);
    [path applyTransform:transform];
    
    [path addLineToPoint:CGPointMake(self.center.x, self.center.y)];
    [reversingPath addLineToPoint:CGPointMake(self.center.x, self.center.y)];
    
    [[UIColor redColor] set];
    [path stroke];
    
    [[UIColor greenColor] set];
    [reversingPath stroke];
    
}

@end
