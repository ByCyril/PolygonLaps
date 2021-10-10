//
//  ViewController.m
//  Harmony
//
//  Created by Cyril Garcia on 10/2/21.
//

#import "ViewController.h"
#import "Ring.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat length = 300;

    for (int i = 14; i >= 3; i--) {
        Ring *ring = [[Ring alloc] initWithNumberOfCorners:i
                                                withFrame:self.view.frame
                                                withLength:length];
        [[[self view] layer] addSublayer:ring];
        length -= 25;
    }
}

@end
