//
//  HUDController.m
//
//  Created by Leo_Lei on 7/17/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "HUDController.h"
#import "MBProgressHUD.h"

@interface UIViewController ()

@property (nonatomic, strong) MBProgressHUD *hud;

@end

@implementation UIViewController (MBProgressHUD)

- (void)showHUD:(HUDMode)mode {
    [self showHUD:mode message:nil];
}

- (void)showHUD:(HUDMode)mode progress:(CGFloat)value {
    [self showHUD:mode message:nil progress:value];
}

- (void)showHUD:(HUDMode)mode message:(NSString *)message {
    [self showHUD:mode message:message progress:0.0];
}

- (void)showHUD:(HUDMode)mode message:(NSString *)message progress:(CGFloat)value {
    if (self.hud == nil) {
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }

    // 自定义枚举进行匹配
    switch (mode) {
        case Default:
            self.hud.mode = MBProgressHUDModeIndeterminate;
            break;
        case HorizontalBar:
            self.hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
            break;
        case Circle:
            self.hud.mode = MBProgressHUDModeDeterminate;
            break;
        case Ring:
            self.hud.mode = MBProgressHUDModeAnnularDeterminate;
            break;
        case CustomView:
            self.hud.mode = MBProgressHUDModeCustomView;
            break;
        case Text:
            self.hud.mode = MBProgressHUDModeText;
            break;
    }

    self.hud.animationType = MBProgressHUDAnimationZoom;
    self.hud.label.text = message;
    self.hud.progress = value;
    // 新建hud页面后, 进行了更改, 需要调用该方法进行视图的更新
    [self.hud showAnimated:YES];
}

- (void)showHUDWithOnlyMessage:(NSString *)message
                      inCenter:(BOOL)isCenter
                    afterDelay:(NSTimeInterval)delayTime {
    if (self.hud == nil) {
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }

    self.hud.mode = MBProgressHUDModeText;
    self.hud.animationType = MBProgressHUDAnimationZoom;
    self.hud.label.text = message;
    self.hud.label.numberOfLines = 0;
    self.hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    self.hud.backgroundView.color = [UIColor colorWithWhite:0.0 alpha:0.5];
    self.hud.offset = CGPointMake(0,
                                  isCenter ? 0 : self.view.bounds.size.height / 3.0);
    [self.hud showAnimated:YES];
    [self hideHUD:YES afterDelay:delayTime];
}

- (void)hideHUD:(BOOL)animated {
    [self.hud hideAnimated:animated];
    // 确保每次隐藏后, 视图都被释放, 规避出现指示器不显示的情况
    self.hud = nil;
}

- (void)hideHUD:(BOOL)animated afterDelay:(NSTimeInterval)delayTime {
    // 延时时长校正
    if (delayTime <= 0 || delayTime > 10) {
        delayTime = 1;
    }
    [self.hud hideAnimated:animated afterDelay:delayTime];
    // 确保每次隐藏后, 视图都被释放, 规避出现指示器不显示的情况
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
    [self hideHUD:YES afterDelay:1];
}

@end
