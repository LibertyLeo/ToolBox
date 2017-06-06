//
//  LLExpandTableView.h
//
//  Created by Leo_Lei on 9/29/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LLSectionModel;

/** 在使用该扩展表视图进行分组显示时，需重写单元格部分，否则默认显示当前行索引*/
@interface LLExpandTableView : UITableView<UITableViewDelegate, UITableViewDataSource>

/** 导入封装成指定类型的数据源*/
@property (nonatomic, copy) NSArray<LLSectionModel *> *sections;

/**
 设定当前分组是否展开

 @param expand YES展开, NO收缩
 @param section 需要操作的分组
 */
- (void)expandGroup:(BOOL)expand in:(NSInteger)section;

@end
