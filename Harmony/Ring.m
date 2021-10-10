//
//  Ring.m
//  Ring
//
//  Created by Cyril Garcia on 10/2/21.
//

#import "Ring.h"
#include <math.h>
#include <stdio.h>

@implementation Ring

CGFloat length;

- (instancetype)initWithNumberOfCorners:(int)corners withFrame:(CGRect)frame withLength:(CGFloat)length {
    self = [super init];
    
    [self setPosition:CGPointMake(frame.size.width / 2, frame.size.height / 2)];
    [self setStrokeColor:[UIColor redColor].CGColor];
    [self setLineWidth:3];
    
    double angle = ((360.0 / (double)corners)) * (M_PI / 180.0);
    
    CGFloat x = 0;
    CGFloat y = length;
    
    _shapePath = [[UIBezierPath alloc] init];
    [_shapePath moveToPoint:CGPointMake(x, y)];
    
    for (int i = 0; i < corners; i++) {
                
        CGFloat X = (x * cos(angle)) + (y * sin(angle));
        CGFloat Y = (-x * sin(angle)) + (y * cos(angle));
        [_shapePath addLineToPoint:CGPointMake(X,Y)];

        x = X;
        y = Y;
    }
    
    [self setPath:_shapePath.CGPath];
    
    [self createDot:_shapePath withDuration:corners];
    
    return self;
}

- (CGPoint)startingPosition {
    return CGPointMake(0, length);
}

- (void)createDot:(UIBezierPath *)path withDuration:(CGFloat)duration {
    
    CALayer *dotLayer = [[CALayer alloc] init];
    
    UIImage *image = [UIImage imageNamed:@"img.png"];
    [dotLayer setPosition:CGPointMake(100,100)];
    [dotLayer setBounds:CGRectMake(50, 50, 25, 25)];
    [dotLayer setContents:[image CGImage]];
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.repeatCount = 100;
    pathAnimation.path = path.CGPath;
    pathAnimation.duration = 15 / (15 - duration);

    [dotLayer addAnimation:pathAnimation forKey:@"animation"];
    [self addSublayer:dotLayer];
}

@end
