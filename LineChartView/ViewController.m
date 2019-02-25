//
//  ViewController.m
//  LineChartView
//
//  Created by duwei on 2019/2/22.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "ViewController.h"
#import "LineChartView.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

@interface ViewController ()
@property (nonatomic,strong)LineChartView *linechartView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.linechartView = [[LineChartView alloc] initWithFrame:CGRectMake(30, 100, SCREEN_WIDTH - 2 * 30, 300)];
    self.linechartView.leftUnit = @"心率";
    self.linechartView.rightUnit = @"百分比";
    self.linechartView.lblCount = 5;
    self.linechartView.leftMaxVal = 240;
    self.linechartView.rightMaxVal = 100;
    self.linechartView.rightMinVal = 50;
    [self.linechartView drawXAxis];
    [self.linechartView drawYAxis];
    [self.view addSubview:self.linechartView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
