//
//  UIView+Geometry.m
//
//  Created by Leo_Lei on 4/14/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "UIView+Geometry.h"

@implementation UIView (Geometry)

#pragma mark - 坐标点
- (void)setOrigin:(CGPoint)aPoint {
    CGRect newFrame = self.frame;
    newFrame.origin = aPoint;
    self.frame = newFrame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (CGPoint)topRight {
    CGFloat x = CGRectGetMaxX(self.frame);
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}

- (CGPoint)bottomLeft {
    CGFloat x = self.frame.origin.x;
    CGFloat y = CGRectGetMaxY(self.frame);
    return CGPointMake(x, y);
}

- (CGPoint)bottomRight {
    CGFloat x = CGRectGetMaxX(self.frame);
    CGFloat y = CGRectGetMaxY(self.frame);
    return CGPointMake(x, y);
}

#pragma mark - 尺寸
- (void)setSize:(CGSize)aSize {
    CGRect newFrame = self.frame;
    newFrame.size = aSize;
    self.frame = newFrame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setHeight:(CGFloat)newHeight {
    CGRect newFrame = self.frame;
    newFrame.size.height = newHeight;
    self.frame = newFrame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setWidth:(CGFloat)newWidth {
    CGRect newFrame = self.frame;
    newFrame.size.width = newWidth;
    self.frame = newFrame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setTop:(CGFloat)newTop {
    CGRect newFrame = self.frame;
    newFrame.origin.y = newTop;
    self.frame = newFrame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setBottom:(CGFloat)newBottom {
    CGRect newFrame = self.frame;
    //  bottom = origin.y + height
    newFrame.origin.y = newBottom - self.frame.size.height;
    self.frame = newFrame;
}

- (CGFloat)bottom {
    return CGRectGetMaxY(self.frame);
}

- (void)setLeft:(CGFloat)newLeft {
    CGRect newFrame = self.frame;
    newFrame.origin.x = newLeft;
    self.frame = newFrame;
}

- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setRight:(CGFloat)newRight {
    CGRect newFrame = self.frame;
    //  right = origin.x + width
    newFrame.origin.x = newRight - self.frame.size.width;
    self.frame = newFrame;
}

- (CGFloat)right {
    return CGRectGetMaxX(self.frame);
}

#pragma mark 常用方法
- (void)moveBy:(CGPoint)vector {
    CGPoint newCenter = self.center;
    newCenter.x += vector.x;
    newCenter.y += vector.y;
    self.center = newCenter;
}

- (void)scaleBy:(CGFloat)multiple {
    CGRect newFrame = self.frame;
    newFrame.size.width *= multiple;
    newFrame.size.height *= multiple;
    self.frame = newFrame;
}

- (void)fitInSize:(CGSize)aSize {
    CGFloat scale;
    CGRect newFrame = self.frame;

    /**
     比较实际高度与预设高度的大小, 如果实际高度大于预设高度, 进行图形的缩放;
     再比较其宽度, 如果宽度缩放后的视图宽度比预设宽度小, 则最佳的宽度就是高度比较后的尺寸;
     否则根据宽度与预设宽度的比较, 再次进行缩放。
     */
    if (newFrame.size.height && (newFrame.size.height > aSize.height)) {
        scale = aSize.height / newFrame.size.height;
        newFrame.size.height *= scale;
        newFrame.size.width *= scale;
    }

    if (newFrame.size.width && (newFrame.size.width >= aSize.width)) {
        scale = aSize.width / newFrame.size.width;
        newFrame.size.width *= scale;
        newFrame.size.height *= scale;
    }

    self.frame = newFrame;
}

@end
