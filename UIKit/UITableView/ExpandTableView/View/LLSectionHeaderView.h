//
//  LLSectionHeaderView.h
//
//  Created by Leo_Lei on 9/29/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^expandBlock) (BOOL expand);

/**
 使用时，只需要在表视图关于对分组组头协议的定义中，使用该封装类，在block中回调表视图的展开收起方法。
 传入点击的组头以及是否展开的属性，即可完成折叠式视图的使用。
 */
@interface LLSectionHeaderView : UITableViewHeaderFooterView

/// 分组头视图名称
@property (weak, nonatomic) IBOutlet UILabel *sectionTitleLabel;

/// 是否展开数组
@property (nonatomic, assign) BOOL expand;

/// 点击分组头视图响应的操作
@property (nonatomic, copy) expandBlock touchBlock;

@end
