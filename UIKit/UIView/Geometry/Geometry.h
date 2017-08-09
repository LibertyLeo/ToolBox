//
//  Geometry.h
//
//  Version 1.0.0
//  Created by Leo_Lei on 6/7/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Geometry)

#pragma mark - 坐标点
/// 修改或返回视图起始点坐标, 同时也是视图左上角的坐标点
@property (nonatomic, assign) CGPoint origin;

/// 返回视图右上角的坐标点
@property (nonatomic, assign, readonly) CGPoint topRight;

/// 返回视图左下角的坐标点
@property (nonatomic, assign, readonly) CGPoint bottomLeft;

/// 返回视图右下角的坐标点
@property (nonatomic, assign, readonly) CGPoint bottomRight;

#pragma mark - 尺寸
/// 修改或返回视图的尺寸
@property (nonatomic, assign) CGSize size;

/// 修改或返回视图的高度
@property (nonatomic, assign) CGFloat height;

/// 修改或返回视图的宽度
@property (nonatomic, assign) CGFloat width;

/// 修改或返回视图的起始坐标的Y值
@property (nonatomic, assign) CGFloat top;

/// 修改或返回视图的末尾坐标的Y值
@property (nonatomic, assign) CGFloat bottom;

/// 修改或返回视图的起始坐标的X值
@property (nonatomic, assign) CGFloat left;

/// 修改或返回视图的末尾坐标的X值
@property (nonatomic, assign) CGFloat right;

#pragma mark - 常用方法
/**
 根据构建的向量进行视图的位移

 @param vector 向量
 */
- (void)moveBy:(CGPoint)vector;

/**
 根据倍数设定进行视图的方法或缩小
 
 @param multiple 倍数
 */
- (void)scaleBy:(CGFloat)multiple;

/**
 根据尺寸进行视图的最佳收缩(等宽高比)

 @param aSize 尺寸
 */
- (void)fitInSize:(CGSize)aSize;

@end
