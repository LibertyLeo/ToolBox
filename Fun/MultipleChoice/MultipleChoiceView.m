//
//  MultipleChoiceView.m
//
//  Version 1.0.0
//  Created by Leo_Lei on 8/3/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "MultipleChoiceView.h"
#import "ChoiceModel.h"
#import "MultipleChoiceCell.h"

@interface MultipleChoiceView ()<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITableView *choiceView;

@end

@implementation MultipleChoiceView

+ (instancetype)showMainView {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                         owner:nil
                                       options:nil].firstObject;
}

- (void)awakeFromNib {
    [super awakeFromNib];

    self.choiceView.dataSource = self;
    self.choiceView.delegate = self;
    self.choiceView.bounces = NO;
    self.choiceView.separatorInset = UIEdgeInsetsZero;
    self.choiceView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

    UINib *cellNib = [UINib nibWithNibName:NSStringFromClass([MultipleChoiceCell class])
                                    bundle:nil];
    [self.choiceView registerNib:cellNib forCellReuseIdentifier:MultipleChoiceCellID];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    // 所有有关于视图更新的内容, 需要在此处进行, awakeFromNib中不可进行过于复杂的初始化工作
    self.titleLabel.text = _viewTitle;
}

#pragma mark - 额外操作
- (IBAction)confirm:(id)sender {
    NSMutableArray *choices = [NSMutableArray array];
    for (ChoiceModel *choice in _choiceModels) {
        if (choice.choosed) {
            [choices addObject:choice];
        }
    }
    
    self.choicesDidChoose([NSArray arrayWithArray:choices]);
    [self removeFromSuperview];
}

- (IBAction)cancel:(id)sender {
    [self removeFromSuperview];
}

#pragma mark - UITableView_DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _choiceModels.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MultipleChoiceCell *cell = [tableView dequeueReusableCellWithIdentifier:MultipleChoiceCellID
                                                               forIndexPath:indexPath];
    cell.model = _choiceModels[indexPath.row];
    return cell;
}

#pragma mark - UITableView_Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChoiceModel *choice = _choiceModels[indexPath.row];
    return choice.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 取消点击选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ChoiceModel *choice = _choiceModels[indexPath.row];
    choice.choosed = !choice.choosed;

    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
