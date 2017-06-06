//
//  LLExpandTableView.m
//
//  Created by Leo_Lei on 9/29/16.
//  Copyright © 2016 LibertyLeo. All rights reserved.
//

#import "LLExpandTableView.h"
#import "LLSectionModel.h"

static NSString *const cellID = @"expandCell";

@implementation LLExpandTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];;
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    }
    return self;
}

#pragma mark - UITABLEVIEW_DATASOURCE
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    LLSectionModel *sectionModel = self.sections[section];
    return sectionModel.isExpand? sectionModel.rows.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"row = %ld", indexPath.row];
    return cell;
}

#pragma mark - EXPAND_METHOD
- (void)expandGroup:(BOOL)expand in:(NSInteger)section {
    LLSectionModel *sectionModel = self.sections[section];
    sectionModel.isExpand = expand;
    NSIndexSet *reloadPaths = [NSIndexSet indexSetWithIndex:section];
    [self reloadSections:reloadPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
