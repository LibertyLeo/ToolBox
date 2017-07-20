//
//  ToolView.m
//
//  Version 1.0.0
//  Created by Leo_Lei on 7/20/17.
//  Copyright © 2017 LibertyLeo. All rights reserved.
//

#import "ToolView.h"

@interface ToolView ()

/// 选项栏
@property (nonatomic, strong) UIView *optionsView;
/// 线条颜色选择栏
@property (nonatomic, strong) UIView *colorsView;
/// 线条宽度选择栏
@property (nonatomic, strong) UIView *widthsView;
/// 前一个选项按钮
@property (nonatomic, strong) UIButton *preOptionButton;
/// 前一个颜色按钮
@property (nonatomic, strong) UIButton *preColorButton;
/// 前一个宽度按钮
@property (nonatomic, strong) UIButton *preWidthButton;

@end

@implementation ToolView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [self createOptions];
    [self createColorOptions];
    [self createWidthOptions];
}

#pragma mark 创建工具栏
- (void)createOptions {
    NSArray *options = @[@"颜色", @"线宽", @"撤销", @"清屏"];

    CGFloat boundsWidth = CGRectGetWidth(self.bounds);
    CGFloat optionWidth = boundsWidth / options.count;
    CGFloat optionHeight = 29;
    CGRect optionsFrame = CGRectMake(0, 0, boundsWidth, optionHeight);

    // 添加选项背景视图
    self.optionsView = [[UIView alloc] initWithFrame:optionsFrame];
    [self addSubview:self.optionsView];

    // 添加水平分界线
    CGFloat horizontalLineHeight = 1;
    CGRect horizontalLineFrame = CGRectMake(0, optionHeight, boundsWidth, horizontalLineHeight);
    UIView *horizontalLine = [[UIView alloc] initWithFrame:horizontalLineFrame];
    horizontalLine.backgroundColor = [UIColor flatBrightBlueColor];
    [self addSubview:horizontalLine];

    for (NSInteger index = 0; index < options.count; index++) {
        // 添加按钮
        CGFloat verticalLineWidth = 1;
        CGRect optionFrame = CGRectMake(index * optionWidth, 0,
                                        optionWidth - verticalLineWidth, optionHeight);
        UIButton *option = [UIButton buttonWithType:UIButtonTypeCustom];
        option.frame = optionFrame;
        option.titleLabel.font = kSystemFont(17);
        option.tag = index;
        [option setTitle:options[index] forState:UIControlStateNormal];
        [option setTitleColor:[UIColor flatBrightBlueColor] forState:UIControlStateNormal];
        [option setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [option addTarget:self
                   action:@selector(tapOption:)
         forControlEvents:UIControlEventTouchUpInside];
        [self.optionsView addSubview:option];

        // 添加垂直分界线
        CGRect separateFrame = CGRectMake(0, 0, verticalLineWidth, optionHeight);
        UIView *separateLine = [[UIView alloc] initWithFrame:separateFrame];
        separateLine.left = option.right;
        separateLine.backgroundColor = [UIColor flatBrightBlueColor];
        [self.optionsView addSubview:separateLine];
    }
}

- (void)tapOption:(UIButton *)option {
    // 调整底色作为提醒
    [self.preOptionButton setBackgroundColor:nil];
    [option setBackgroundColor:[UIColor flatBrightBlueColor]];

    self.preOptionButton.selected = NO;
    option.selected = YES;
    self.preOptionButton = option;

    switch (option.tag) {
        case 0:
            _colorsView.hidden = NO;
            _widthsView.hidden = YES;
            break;
        case 1:
            _colorsView.hidden = YES;
            _widthsView.hidden = NO;
            break;
        case 2:
            if (_undoBlock) {
                _undoBlock();
            }
            break;
        case 3:
            if (_clearBlock) {
                _clearBlock();
            }
            break;
        default:
            break;
    }
}

- (void)createColorOptions {
    CGFloat colorHeight = 50;
    // 创建默认选择背景视图, 默认需要对齐水平分界线
    CGRect colorFrame = CGRectMake(0, CGRectGetMaxY(_optionsView.frame) + 1,
                                 kScreenWidth, colorHeight);
    self.colorsView = [[UIView alloc] initWithFrame:colorFrame];
    // 起始状态不存在工具栏显示
    self.colorsView.hidden = YES;
    [self addSubview:self.colorsView];

    // 设定备选颜色
    NSArray *colors = @[
                        [UIColor flatSilverColor],
                        [UIColor blackColor],
                        [UIColor redColor],
                        [UIColor orangeColor],
                        [UIColor yellowColor],
                        [UIColor greenColor],
                        [UIColor cyanColor],
                        [UIColor flatCuriousBlueColor],
                        [UIColor purpleColor]
                        ];
    CGFloat colorWidth = self.bounds.size.width / colors.count;
    CGFloat colorHorizontalGap = 2;
    CGFloat colorVerticalGap = 5;

    for (NSInteger index = 0; index < colors.count; index++) {
        CGRect colorFrame = CGRectMake(index * colorWidth, colorVerticalGap,
                                       colorWidth - colorHorizontalGap,
                                       colorHeight - colorVerticalGap);
        UIButton *color = [UIButton buttonWithType:UIButtonTypeCustom];
        color.frame = colorFrame;
        color.tag = index;
        color.backgroundColor = colors[index];
        [color setBackgroundImage:[UIImage imageNamed:@"TipMark"]
                         forState:UIControlStateSelected];
        [color addTarget:self
                  action:@selector(tapColor:)
        forControlEvents:UIControlEventTouchUpInside];
        [_colorsView addSubview:color];
    }
}

- (void)tapColor:(UIButton *)color {
    self.preColorButton.selected = NO;
    color.selected = YES;
    self.preColorButton = color;

    if (_colorBlock) {
        _colorBlock(color.backgroundColor);
    }
}

- (void)createWidthOptions {
    CGFloat optionHeight = 50;
    // 创建默认选择背景视图, 默认需要对齐水平分界线
    CGRect optionFrame = CGRectMake(0, CGRectGetMaxY(_optionsView.frame) + 1,
                                 kScreenWidth, optionHeight);
    self.widthsView = [[UIView alloc] initWithFrame:optionFrame];
    // 起始状态不存在工具栏显示
    self.widthsView.hidden = YES;
    [self addSubview:self.widthsView];

    // 设定备选颜色
    NSArray *widths = @[@1, @3, @5, @8, @10, @15, @20, @30];
    CGFloat optionWidth = self.bounds.size.width / widths.count;
    CGFloat optionHorizontalGap = 2;
    CGFloat optionVerticalGap = 5;

    for (NSInteger index = 0; index < widths.count; index++) {
        CGRect optionFrame = CGRectMake(index * optionWidth, optionVerticalGap,
                                        optionWidth - optionHorizontalGap,
                                        optionHeight - optionVerticalGap);
        UIButton *option = [UIButton buttonWithType:UIButtonTypeCustom];
        option.frame = optionFrame;
        option.tag = [widths[index] integerValue];
        [option setTitle:[NSString stringWithFormat:@"%@点", widths[index]]
                forState:UIControlStateNormal];
        [option setTitleColor:[UIColor flatBrightBlueColor] forState:UIControlStateNormal];
        UIImage *image = [[UIImage imageNamed:@"TipMark"]
                          imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [option setBackgroundImage:image forState:UIControlStateSelected];
        [option addTarget:self
                   action:@selector(tapWidth:)
         forControlEvents:UIControlEventTouchUpInside];
        [_widthsView addSubview:option];
    }
}

- (void)tapWidth:(UIButton *)width {
    self.preWidthButton.selected = NO;
    width.selected = YES;
    self.preWidthButton = width;

    if (_widthBlock) {
        _widthBlock(width.tag);
    }
}

#pragma mark 回调选定工具参数
- (void)addSelectColorBlock:(SelectColorBlock)colorBlock
           selectWidthBlock:(SelectWidthBlock)widthBlock
                 selectUndo:(FuncBlock)undoBlock
                selectClear:(FuncBlock)clearBlock {
    if (_colorBlock != colorBlock) {
        _colorBlock = [colorBlock copy];
    }

    if (_widthBlock != widthBlock) {
        _widthBlock =  [widthBlock copy];
    }

    if (_undoBlock != undoBlock) {
        _undoBlock = [undoBlock copy];
    }

    if (_clearBlock != clearBlock) {
        _clearBlock = [clearBlock copy];
    }
}

@end
