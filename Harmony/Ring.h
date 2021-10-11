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

- (instancetype)initWithNumberOfCorners:(int)corners withFrame:(CGRect)frame withLength:(CGFloat)length;

@end

NS_ASSUME_NONNULL_END
