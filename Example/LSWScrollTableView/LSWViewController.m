//
//  LSWViewController.m
//  LSWScrollTableView
//
//  Created by Ricardo on 04/14/2020.
//  Copyright (c) 2020 Ricardo. All rights reserved.
//

#import "LSWViewController.h"
#import "LSWScrollTableView.h"

@interface LSWViewController ()

@end

@implementation LSWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *columns = @[
        @{
            @"key": @"项目类型",
            @"value": @"projectType",
            @"width": [NSNumber numberWithInt:150]
        },
        @{
            @"key": @"客户名称",
            @"value": @"customerName",
            @"width": [NSNumber numberWithInt:250]
        },
        @{
            @"key": @"电梯数量",
            @"value": @"elevatorNum",
            @"width": [NSNumber numberWithInt:150]
        }
    ];
    NSArray *data = @[
        @{
            @"projectType": @"T类",
            @"customerName": @"南昌轨道交通二号线",
            @"elevatorNum": @"1"
        },
        @{
            @"projectType": @"T类",
            @"customerName": @"南昌轨道交通三号线",
            @"elevatorNum": @"2"
        },
        @{
            @"projectType": @"T类",
            @"customerName": @"南昌轨道交通四号线",
            @"elevatorNum": @"3"
        },
        @{
            @"projectType": @"T类",
            @"customerName": @"南昌轨道交通五号线",
            @"elevatorNum": @"4"
        },
        @{
            @"projectType": @"T类",
            @"customerName": @"南昌轨道交通六号线",
            @"elevatorNum": @"5"
        },
        @{
            @"projectType": @"T类",
            @"customerName": @"南昌轨道交通七号线",
            @"elevatorNum": @"6"
        },
        @{
            @"projectType": @"T类",
            @"customerName": @"南昌轨道交通八号线",
            @"elevatorNum": @"7"
        },
        @{
            @"projectType": @"T类",
            @"customerName": @"南昌轨道交通九号线",
            @"elevatorNum": @"8"
        },
        @{
            @"projectType": @"T类",
            @"customerName": @"南昌轨道交通十号线",
            @"elevatorNum": @"9"
        },
        @{
            @"projectType": @"T类",
            @"customerName": @"南昌轨道交通十一号线",
            @"elevatorNum": @"10"
        },
    ];
    LSWScrollTableView *scrollTableView = [[LSWScrollTableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 320) columns:columns data:data cellHeight:40 headerHeight:50 cellBackgroundColor:@[[UIColor whiteColor],[UIColor grayColor]] headerBackgroundColor:[UIColor yellowColor] headerTextColor:[UIColor blackColor] cellTextColor:[UIColor blackColor]];
    [self.view addSubview:scrollTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
