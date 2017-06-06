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

- (void)showHUD {
    [self showHUDWithTitle:nil];
}

- (void)showHUDWithTitle:(NSString *)title {
    if (self.hud == nil) {
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    self.hud.animationType = MBProgressHUDAnimationZoom;
    self.hud.label.text = title;
    self.hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    self.hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.0f];
    [self.hud showAnimated:YES];
}

- (void)showHUDWithWarnMessage:(NSString *)message inCenter:(BOOL)isCenter{
    if (self.hud == nil) {
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    }
    
    //  设置为纯文本格式
    self.hud.mode = MBProgressHUDModeText;
    self.hud.animationType = MBProgressHUDAnimationZoom;
    self.hud.label.text = message;
    self.hud.label.numberOfLines = 0;
    self.hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    self.hud.backgroundView.color = [UIColor colorWithWhite:0.f alpha:.2f];
    self.hud.offset = CGPointMake(0, isCenter ? 0 : self.view.bounds.size.height / 3.0);
    [self.hud showAnimated:YES];
    
    //  直接进行停顿1秒消失
    [self.hud hideAnimated:YES afterDelay:1];
    self.hud = nil;
}

- (void)hideHUD:(BOOL)animated {
    //  调用原生实现
    [self.hud hideAnimated:animated];
    self.hud = nil;
}

- (void)hideHUD:(BOOL)animated afterDelay:(NSTimeInterval)delay {
    //  调用原生实现
    [self.hud hideAnimated:animated afterDelay:delay];
    self.hud = nil;
}

- (void)hudDidFinishWithMessage:(NSString *)message success:(BOOL)success {
    //  新建image对象
    UIImage *image = nil;
    
    //  根据传入值进行判断
    if (success) {
        image = [[UIImage imageNamed:@"Checkmark"]
                 imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    } else {
        image = [[UIImage imageNamed:@"Error"]
                 imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    }
    
    //  设置为自定义样式
    self.hud.customView = [[UIImageView alloc] initWithImage:image];
    self.hud.mode = MBProgressHUDModeCustomView;
    self.hud.label.text = message;
    self.hud.label.numberOfLines = 0;
    [self.hud hideAnimated:YES afterDelay:1];
    self.hud = nil;
}

@end
