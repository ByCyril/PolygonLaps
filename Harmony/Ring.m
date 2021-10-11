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
UIBezierPath *_shapePath;

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
                
        CGFloat newX = (x * cos(angle)) + (y * sin(angle));
        CGFloat newY = (-x * sin(angle)) + (y * cos(angle));
        [_shapePath addLineToPoint:CGPointMake(newX, newY)];

        x = newX;
        y = newY;
    }
    
    [self setPath:_shapePath.CGPath];
    [self createDot:_shapePath withNumberOfCorners:corners];
    
    return self;
}

- (void)createDot:(UIBezierPath *)path withNumberOfCorners:(CGFloat)corners {
    
    CALayer *dotLayer = [[CALayer alloc] init];
    
    [dotLayer setBounds:CGRectMake(0, 0, 25, 25)];
    [dotLayer setContents:(id)[UIImage imageNamed:@"img.png"].CGImage];
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.repeatCount = 100;
    pathAnimation.path = path.CGPath;
    pathAnimation.duration = 15 / (15 - corners);

    [dotLayer addAnimation:pathAnimation forKey:@"animation"];
    [self addSublayer:dotLayer];
}

@end
