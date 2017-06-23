//
//  UIViewController+MBProgressHUD.m
//
//  Created by Leo_Lei on 8/24/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import "UIViewController+MBProgressHUD.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>

@interface UIViewController ()

@property (nonatomic, strong) MBProgressHUD *hud;

@end

static const char hudKey;

@implementation UIViewController (MBProgressHUD)

- (MBProgressHUD *)hud {
    return objc_getAssociatedObject(self, &hudKey);
}

- (void)setHud:(MBProgressHUD *)hud {
    objc_setAssociatedObject(self, &hudKey, hud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showHUD:(HUDMode)mode {
    [self showHUD:mode withMessage:nil];
}

- (void)showHUD:(HUDMode)mode withProgress:(CGFloat)progressValue {
    [self showHUD:mode withMessage:nil progress:progressValue];
}

- (void)showHUD:(HUDMode)mode withMessage:(NSString *)message {
    [self showHUD:mode withMessage:message progress:0.0];
}

- (void)showHUD:(HUDMode)mode
    withMessage:(NSString *)message
       progress:(CGFloat)progressValue {
    // 新建hud页面
    if (self.hud == nil) {
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }

    // 自定义枚举进行匹配
    switch (mode) {
        case HUDModeDefault:
            self.hud.mode = MBProgressHUDModeIndeterminate;
            break;
        case HUDModeHorizontalBar:
            self.hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
            break;
        case HUDModeCircle:
            self.hud.mode = MBProgressHUDModeDeterminate;
            break;
        case HUDModeRing:
            self.hud.mode = MBProgressHUDModeAnnularDeterminate;
            break;
        case HUDModeCustomView:
            self.hud.mode = MBProgressHUDModeCustomView;
            break;
        case HUDModeOnlyText:
            self.hud.mode = MBProgressHUDModeText;
            break;
    }

    self.hud.animationType = MBProgressHUDAnimationZoom;
    self.hud.label.text = message;
    self.hud.progress = progressValue;
    self.hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    // 新建hud页面后, 进行了更改, 所以需要调用该方法进行视图的更新。
    [self.hud showAnimated:YES];
}

- (void)showHUDWithWarnMessage:(NSString *)message
                      inCenter:(BOOL)center
                    afterDelay:(NSTimeInterval)delayTime {
    if (self.hud == nil) {
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }

    //  设置为纯文本格式
    self.hud.mode = MBProgressHUDModeText;
    self.hud.animationType = MBProgressHUDAnimationZoom;
    self.hud.label.text = message;
    self.hud.label.numberOfLines = 0;
    self.hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    self.hud.backgroundView.color = [UIColor colorWithWhite:1.0 alpha:0.5];
    self.hud.offset = CGPointMake(0, center ? 0 : self.view.bounds.size.height / 3.0);
    [self.hud showAnimated:YES];

    // 延时时长校正
    if (delayTime <= 0 | delayTime > 10) {
        delayTime = 1;
    }
    [self.hud hideAnimated:YES afterDelay:delayTime];
    // 确保每次隐藏后, 视图都被释放
    self.hud = nil;
}

- (void)hideHUD:(BOOL)animated {
    [self.hud hideAnimated:animated];
    // 确保每次隐藏后, 视图都被释放
    self.hud = nil;
}

- (void)hideHUD:(BOOL)animated afterDelay:(NSTimeInterval)delayTime {
    // 延时时长校正
    if (delayTime <= 0 | delayTime > 10) {
        delayTime = 1;
    }
    [self.hud hideAnimated:animated afterDelay:delayTime];
    // 确保每次隐藏后, 视图都被释放
    self.hud = nil;
}

- (void)hideHUDWithMessage:(NSString *)message success:(BOOL)success {
    UIImage *image = nil;

    if (success) {
        image = [[UIImage imageNamed:@"Success"]
                 imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    } else {
        image = [[UIImage imageNamed:@"Failure"]
                 imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }

    //  设置为自定义样式
    self.hud.customView = [[UIImageView alloc] initWithImage:image];
    self.hud.mode = MBProgressHUDModeCustomView;
    self.hud.label.text = message;
    self.hud.label.numberOfLines = 0;
    [self.hud hideAnimated:YES afterDelay:1];
    // 确保每次隐藏后, 视图都被释放
    self.hud = nil;
}

@end
