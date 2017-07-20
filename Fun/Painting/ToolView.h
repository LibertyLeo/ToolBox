//
//  ToolView.h
//
//  Created by Leo_Lei on 7/19/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SelectColorBlock)(UIColor *color);
typedef void (^SelectWidthBlock)(CGFloat width);
typedef void (^FuncBlock)(void);

@interface ToolView : UIView

/// 颜色选择
@property (nonatomic, copy) SelectColorBlock colorBlock;

/// 线宽选择
@property (nonatomic, copy) SelectWidthBlock widthBlock;

/// 撤销操作
@property (nonatomic, copy) FuncBlock undoBlock;

/// 清屏操作
@property (nonatomic, copy) FuncBlock clearBlock;


/**
 简化初始化方法, 规避block分离的阅读问题

 @param colorBlock 颜色选择
 @param widthBlock 宽度选择
 @param undoBlock 撤销操作
 @param clearBlock 清屏操作
 */
- (void)addSelectColorBlock:(SelectColorBlock)colorBlock
           selectWidthBlock:(SelectWidthBlock)widthBlock
                 selectUndo:(FuncBlock)undoBlock
                selectClear:(FuncBlock)clearBlock;

@end
