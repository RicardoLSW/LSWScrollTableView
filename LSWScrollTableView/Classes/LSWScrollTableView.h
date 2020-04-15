//
//  LSWScrollTableView.h
//  chl-exhibit-ios
//
//  Created by 骆顺旺 on 2020/4/14.
//  Copyright © 2020 骆顺旺. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSWScrollTableView : UIView

/**
 *
 * @param frame
 * @param columns 表头数据 [{key:"", value:"", width:""}, ...] key为表头名字，value为与表头对应的字段，width为单元格宽度
 * @param data 表格数据
 * @param cellHeight 单元格高度
 * @param headerHeight 表头高度
 * @param cellBackgroundColor 单元格背景色只支持斑马纹 需要传两个UIColor组成的数组，例：@[[UIColor redColor], [UIColor blueColor]]
 * @param headerBackgroundColor 表头背景色
 * @param headerTextColor 表头文字颜色
 * @param cellTextColor 单元格文字颜色
 * @return
 */
- (instancetype)initWithFrame:(CGRect)frame columns:(NSArray *)columns data:(NSArray *)data cellHeight: (CGFloat)cellHeight headerHeight:(CGFloat)headerHeight cellBackgroundColor:(NSArray *)cellBackgroundColor headerBackgroundColor:(UIColor *)headerBackgroundColor headerTextColor:(UIColor *)headerTextColor cellTextColor:(UIColor *)cellTextColor;

/**
 * 关闭滚动
 */
- (void)stopScroll;

/**
 * 打开滚动
 */
- (void)openScroll;

@end

NS_ASSUME_NONNULL_END
