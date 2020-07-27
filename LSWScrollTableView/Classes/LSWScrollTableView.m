//
//  LSWScrollTableView.m
//  chl-exhibit-ios
//
//  Created by 骆顺旺 on 2020/4/14.
//  Copyright © 2020 骆顺旺. All rights reserved.
//

#import "LSWScrollTableView.h"

#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

@interface LSWScrollTableView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSTimer *timer; ///定时器，用于开启、关闭滚动
@property (nonatomic, strong) NSArray *data; ///传入的原始数据
@property (nonatomic) CGFloat cellHeight; ///单元格高度
@property (nonatomic, strong) NSArray *columns; ///表头数据
@property (nonatomic) CGFloat headerHeight; ///表头高度
@property (nonatomic, strong) NSArray *cellBackgroundColor; ///单元格背景色
@property (nonatomic, strong) UIColor *cellTextColor; ///文字颜色
@property (nonatomic, strong) UITableView *tableView1; ///表格1
@property (nonatomic, strong) UITableView *tableView2; ///表格2

@end

@implementation LSWScrollTableView

static NSString *const cellId = @"cellId";

- (instancetype)initWithFrame:(CGRect)frame columns:(NSArray *)columns data:(NSArray *)data cellHeight: (CGFloat)cellHeight headerHeight:(CGFloat)headerHeight cellBackgroundColor:(NSArray *)cellBackgroundColor headerBackgroundColor:(UIColor *)headerBackgroundColor headerTextColor:(UIColor *)headerTextColor cellTextColor:(UIColor *)cellTextColor
{
    self = [super initWithFrame:frame];
    if (self) {
        self.data = data;
        self.columns = columns;
        self.cellHeight = cellHeight;
        self.headerHeight = headerHeight;
        self.cellBackgroundColor = cellBackgroundColor;
        self.cellTextColor = cellTextColor;
        self.backgroundColor = COLOR(0, 0, 0, 0);
        
        ///表头部分
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, self.headerHeight)];
        headerView.backgroundColor = headerBackgroundColor;
        if (columns && columns.count > 0) {
            __block CGFloat headerX = 0;
            [self.columns enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(headerX, 0, [obj[@"width"] floatValue], self.headerHeight)];
                label.text = obj[@"key"];
                label.textColor = headerTextColor;
                label.textAlignment = NSTextAlignmentCenter;
                label.backgroundColor = COLOR(0, 0, 0, 0);
                headerX += [obj[@"width"] floatValue];
                [headerView addSubview:label];
            }];
        } else {
            NSLog(@"columns不能为空");
        }
        [self addSubview:headerView];
        
        ///表格部分
        UIView *tableView = [[UIView alloc] initWithFrame:CGRectMake(0, self.headerHeight, frame.size.width, frame.size.height - self.headerHeight)];
        tableView.clipsToBounds = YES;
        tableView.backgroundColor = COLOR(0, 0, 0, 0);
        self.tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, self.data.count * self.cellHeight)];
        self.tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(0, self.tableView1.frame.origin.y + self.tableView1.frame.size.height, frame.size.width, self.data.count * self.cellHeight)];
        self.tableView1.backgroundColor = COLOR(0, 0, 0, 0);
        self.tableView2.backgroundColor = COLOR(0, 0, 0, 0);
        self.tableView1.delegate = self;
        self.tableView1.dataSource = self;
        self.tableView2.delegate = self;
        self.tableView2.dataSource = self;
        self.tableView1.scrollEnabled = NO; ///禁止表格1自带的滚动
        self.tableView2.scrollEnabled = NO; ///禁止表格2自带的滚动
        [tableView addSubview:self.tableView1];
        [tableView addSubview:self.tableView2];
        [self addSubview:tableView];

        ///开始滚动
        [self openScroll];
    }
    
    
    return self;
}

#pragma mark - UITableViewDelegate

///渲染数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    __block CGFloat headerX = 0;
    [self.columns enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(headerX, 0, [obj[@"width"] floatValue], self.headerHeight)];
        label.text = self.data[indexPath.row][obj[@"value"]];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = COLOR(0, 0, 0, 0);
        label.textColor = self.cellTextColor;
        headerX += [obj[@"width"] floatValue];
        [cell addSubview:label];
    }];
    
    ///这里我把单元格颜色做成斑马纹的样式
    if (self.data.count % 2 == 1) {
        if (tableView == self.tableView1) {
            if (indexPath.row % 2 == 1) {
                cell.backgroundColor = self.cellBackgroundColor[0];
            } else {
                cell.backgroundColor = self.cellBackgroundColor[1];
            }
        } else if (tableView == self.tableView2) {
            if (indexPath.row % 2 == 0) {
                cell.backgroundColor = self.cellBackgroundColor[0];
            } else {
                cell.backgroundColor = self.cellBackgroundColor[1];
            }
        }
    } else if (self.data.count % 2 == 0) {
        if (indexPath.row % 2 == 1) {
            cell.backgroundColor = self.cellBackgroundColor[0];
        } else {
            cell.backgroundColor = self.cellBackgroundColor[1];
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone; ///禁止选中
    return cell;
}

///cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

///分区个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark - UITableViewDataSource

///cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.cellHeight;
}


///停止滚动
- (void)stopScroll{
    [self.timer invalidate];
    self.timer = nil;
}

///开启滚动
- (void)openScroll{
    if (self.timer == nil) {
        self.timer = [NSTimer timerWithTimeInterval:0.03 repeats:YES block:^(NSTimer *timer) {
            CGRect newTable1ViewFrame = self.tableView1.frame;
            newTable1ViewFrame.origin.y -= 0.9;
            if (newTable1ViewFrame.origin.y < -(self.tableView1.frame.size.height)) {
                newTable1ViewFrame.origin.y = self.tableView1.frame.size.height;
            }
            self.tableView1.frame = newTable1ViewFrame;

            CGRect newTable2ViewFrame = self.tableView2.frame;
            newTable2ViewFrame.origin.y -= 0.9;
            if (newTable2ViewFrame.origin.y < -(self.tableView1.frame.size.height)) {
                newTable2ViewFrame.origin.y = self.tableView1.frame.size.height;
            }
            self.tableView2.frame = newTable2ViewFrame;
        }];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    } else {
        NSLog(@"已经在滚动中，请勿重复开启");
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
