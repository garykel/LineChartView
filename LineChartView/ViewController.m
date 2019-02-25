//
//  ViewController.m
//  LineChartView
//
//  Created by duwei on 2019/2/22.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "ViewController.h"
#import "LineChartView.h"
#import "UIColor+Hex.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)

@interface ViewController ()
@property (nonatomic,strong)LineChartView *linechartView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    // Do any additional setup after loading the view, typically from a nib.
    self.linechartView = [[LineChartView alloc] initWithFrame:CGRectMake(30, 100, SCREEN_WIDTH - 2 * 30, 300)];
    self.linechartView.leftUnit = @"心率";
    self.linechartView.rightUnit = @"百分比";
    self.linechartView.lblCount = 5;
    self.linechartView.leftMaxVal = 240;
    self.linechartView.rightMaxVal = 100;
    self.linechartView.rightMinVal = 50;
    NSMutableArray *datas = [NSMutableArray array];
    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
    [dict1 setValue:@"30" forKey:@"x"];
    [dict1 setValue:@"240" forKey:@"y"];
    
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
    [dict2 setValue:@"40" forKey:@"x"];
    [dict2 setValue:@"140" forKey:@"y"];
    
    NSMutableDictionary *dict3 = [NSMutableDictionary dictionary];
    [dict3 setValue:@"100" forKey:@"x"];
    [dict3 setValue:@"220" forKey:@"y"];
    
    NSMutableDictionary *dict4 = [NSMutableDictionary dictionary];
    [dict4 setValue:@"120" forKey:@"x"];
    [dict4 setValue:@"180" forKey:@"y"];
    
    NSMutableDictionary *dict5 = [NSMutableDictionary dictionary];
    [dict5 setValue:@"200" forKey:@"x"];
    [dict5 setValue:@"240" forKey:@"y"];
    
    NSMutableDictionary *dict6 = [NSMutableDictionary dictionary];
    [dict6 setValue:@"250" forKey:@"x"];
    [dict6 setValue:@"140" forKey:@"y"];
    
    [datas addObject:dict1];
    [datas addObject:dict2];
    [datas addObject:dict3];
    [datas addObject:dict4];
    [datas addObject:dict5];
    [datas addObject:dict6];
    self.linechartView.datas = [datas mutableCopy];
    
    self.linechartView.colorsArr = [NSArray arrayWithObjects:[UIColor colorWithHexString:@"f95a67"],[UIColor colorWithHexString:@"fac55a"],[UIColor colorWithHexString:@"6bc86b"],[UIColor colorWithHexString:@"7ccdf1"],[UIColor colorWithHexString:@"a6a6a6"], nil];
    [self.linechartView drawXAxis];
    [self.linechartView drawYAxis];
    [self.linechartView drawXY];
    [self.view addSubview:self.linechartView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
