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

- (instancetype)initWithFrame:(CGRect)frame columns:(NSArray *)columns data:(NSArray *)data cellHeight: (CGFloat)cellHeight headerHeight:(CGFloat)headerHeight cellBackgroundColor:(NSArray *)cellBackgroundColor headerBackgroundColor:(UIColor *)headerBackgroundColor headerTextColor:(UIColor *)headerTextColor cellTextColor:(UIColor *)cellTextColor;

@end

NS_ASSUME_NONNULL_END
