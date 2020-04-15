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

@property (nonatomic, strong) LSWScrollTableView *scrollTableView;

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
    self.scrollTableView = [[LSWScrollTableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 320) columns:columns data:data cellHeight:40 headerHeight:50 cellBackgroundColor:@[[UIColor whiteColor],[UIColor grayColor]] headerBackgroundColor:[UIColor yellowColor] headerTextColor:[UIColor blackColor] cellTextColor:[UIColor blackColor]];

    UIButton *openBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 350, 100, 50)];
    [openBtn setTitle:@"开始滚动" forState:UIControlStateNormal];
    [openBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    openBtn.layer.borderColor = [[UIColor blackColor] CGColor];
    openBtn.layer.borderWidth = 1.0f;
    [openBtn addTarget:self action:@selector(openScroll) forControlEvents:UIControlEventTouchUpInside];

    UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(120, 350, 100, 50)];
    [closeBtn setTitle:@"关闭滚动" forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    closeBtn.layer.borderColor = [[UIColor blackColor] CGColor];
    closeBtn.layer.borderWidth = 1.0f;
    [closeBtn addTarget:self action:@selector(closeScroll) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:openBtn];
    [self.view addSubview:closeBtn];

    [self.view addSubview:self.scrollTableView];
}

- (void)openScroll{
    [self.scrollTableView openScroll];
}

- (void)closeScroll{
    [self.scrollTableView stopScroll];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
