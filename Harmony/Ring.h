//
//  Ring.h
//  Ring
//
//  Created by Cyril Garcia on 10/2/21.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Ring : CAShapeLayer

@property (nonatomic, readonly) CGPoint startingPosition;
@property (nonatomic, readonly) UIBezierPath *shapePath;

- (instancetype)initWithNumberOfCorners:(int)corners withFrame:(CGRect)frame withLength:(CGFloat)length;

- (void)createDot:(UIBezierPath *)path withDuration:(CGFloat)duration;

@end

NS_ASSUME_NONNULL_END
