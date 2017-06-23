//
//  Constant.h
//
//  Created by Leo_Lei on 6/7/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark 文件名称
/// 设定本地文件名，可用来统一管理需要进行数据存储操作的文件名
UIKIT_EXTERN NSString *const FileName;

#pragma mark 单元格标识
/// 单元格标识符
UIKIT_EXTERN NSString *const CellID;

#pragma mark 通知名
/// 通知名, 可将项目中需要发送的通知名进行统一管理
UIKIT_EXTERN NSString *const NotificationName;

#pragma mark 常用数值
/// 状态栏高度
UIKIT_EXTERN CGFloat const StatusBarHeight;
/// 导航栏高度
UIKIT_EXTERN CGFloat const NavigationBarHeight;
/// 工具栏高度
UIKIT_EXTERN CGFloat const ToolBarHeight;
