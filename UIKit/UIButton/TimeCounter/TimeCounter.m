//
//  TimeCounter.m
//
//  Created by Leo_Lei on 6/7/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "TimeCounter.h"
#import <objc/runtime.h>

static const char countDown;

@interface UIButton ()

@property (nonatomic, strong) NSNumber *remainingSeconds;

@end

@implementation UIButton (TimeCounter)

- (void)setRemainingSeconds:(NSNumber *)remainingSeconds {
    objc_setAssociatedObject(self, &countDown, remainingSeconds, OBJC_ASSOCIATION_RETAIN);
}

- (NSNumber *)remainingSeconds {
    return objc_getAssociatedObject(self, &countDown);
}

- (void)showTimeCounterForSeconds:(NSInteger)seconds {
    self.remainingSeconds = @(seconds);
    self.enabled = NO;
    
    NSString *titleString = [NSString stringWithFormat:@"%@s", self.remainingSeconds];
    [self setTitle:titleString forState:UIControlStateDisabled];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(fireTimer:) userInfo:nil repeats:YES];
}

- (void)fireTimer:(NSTimer *)timer {
    NSInteger remaining = [self.remainingSeconds integerValue];
    if (--remaining > 0) {
        self.remainingSeconds = @(remaining);
        NSString *titleString = [NSString stringWithFormat:@"%@s", self.remainingSeconds];
        [self setTitle:titleString forState:UIControlStateDisabled];
    } else {
        [timer invalidate];
        timer = nil;
        self.enabled = YES;
    }
}

@end
