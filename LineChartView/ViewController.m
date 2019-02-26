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
    NSMutableArray *lines = [NSMutableArray array];
    NSMutableArray *datas1 = [NSMutableArray array];
    NSMutableArray *datas2 = [NSMutableArray array];
    for (NSInteger i = 0; i < 100; i++) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setValue:[NSString stringWithFormat:@"%ld",10 + i * 10] forKey:@"x"];
        [dict setValue:[NSString stringWithFormat:@"%d",arc4random()%240] forKey:@"y"];
        [datas1 addObject:dict];
    }
    for (NSInteger i = 0; i < 100; i++) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setValue:[NSString stringWithFormat:@"%ld",10 + i * 10] forKey:@"x"];
        [dict setValue:[NSString stringWithFormat:@"%d",arc4random()%240] forKey:@"y"];
        [datas2 addObject:dict];
    }

//    NSMutableDictionary *dict1 = [NSMutableDictionary dictionary];
//    [dict1 setValue:@"30" forKey:@"x"];
//    [dict1 setValue:@"240" forKey:@"y"];
//
//    NSMutableDictionary *dict2 = [NSMutableDictionary dictionary];
//    [dict2 setValue:@"40" forKey:@"x"];
//    [dict2 setValue:@"140" forKey:@"y"];
//
//    NSMutableDictionary *dict3 = [NSMutableDictionary dictionary];
//    [dict3 setValue:@"50" forKey:@"x"];
//    [dict3 setValue:@"0" forKey:@"y"];
//
//    NSMutableDictionary *dict4 = [NSMutableDictionary dictionary];
//    [dict4 setValue:@"60" forKey:@"x"];
//    [dict4 setValue:@"120" forKey:@"y"];
//
//    NSMutableDictionary *dict5 = [NSMutableDictionary dictionary];
//    [dict5 setValue:@"70" forKey:@"x"];
//    [dict5 setValue:@"240" forKey:@"y"];
//
//    NSMutableDictionary *dict6 = [NSMutableDictionary dictionary];
//    [dict6 setValue:@"80" forKey:@"x"];
//    [dict6 setValue:@"60" forKey:@"y"];
//
//    NSMutableDictionary *dict7 = [NSMutableDictionary dictionary];
//    [dict7 setValue:@"90" forKey:@"x"];
//    [dict7 setValue:@"240" forKey:@"y"];
//
//    NSMutableDictionary *dict8 = [NSMutableDictionary dictionary];
//    [dict8 setValue:@"100" forKey:@"x"];
//    [dict8 setValue:@"140" forKey:@"y"];
//
//    NSMutableDictionary *dict9 = [NSMutableDictionary dictionary];
//    [dict9 setValue:@"110" forKey:@"x"];
//    [dict9 setValue:@"0" forKey:@"y"];
//
//    NSMutableDictionary *dict10 = [NSMutableDictionary dictionary];
//    [dict10 setValue:@"120" forKey:@"x"];
//    [dict10 setValue:@"120" forKey:@"y"];
//
//    NSMutableDictionary *dict11 = [NSMutableDictionary dictionary];
//    [dict11 setValue:@"130" forKey:@"x"];
//    [dict11 setValue:@"240" forKey:@"y"];
//
//    NSMutableDictionary *dict12 = [NSMutableDictionary dictionary];
//    [dict12 setValue:@"140" forKey:@"x"];
//    [dict12 setValue:@"60" forKey:@"y"];
//
//    //第二条折线
//    NSMutableDictionary *dict13 = [NSMutableDictionary dictionary];
//    [dict13 setValue:@"30" forKey:@"x"];
//    [dict13 setValue:@"40" forKey:@"y"];
//
//    NSMutableDictionary *dict14 = [NSMutableDictionary dictionary];
//    [dict14 setValue:@"40" forKey:@"x"];
//    [dict14 setValue:@"60" forKey:@"y"];
//
//    NSMutableDictionary *dict15 = [NSMutableDictionary dictionary];
//    [dict15 setValue:@"50" forKey:@"x"];
//    [dict15 setValue:@"80" forKey:@"y"];
//
//    NSMutableDictionary *dict16 = [NSMutableDictionary dictionary];
//    [dict16 setValue:@"60" forKey:@"x"];
//    [dict16 setValue:@"120" forKey:@"y"];
//
//    NSMutableDictionary *dict17 = [NSMutableDictionary dictionary];
//    [dict17 setValue:@"70" forKey:@"x"];
//    [dict17 setValue:@"180" forKey:@"y"];
//
//    NSMutableDictionary *dict18 = [NSMutableDictionary dictionary];
//    [dict18 setValue:@"80" forKey:@"x"];
//    [dict18 setValue:@"100" forKey:@"y"];
//
//    NSMutableDictionary *dict19 = [NSMutableDictionary dictionary];
//    [dict19 setValue:@"90" forKey:@"x"];
//    [dict19 setValue:@"240" forKey:@"y"];
//
//    NSMutableDictionary *dict20 = [NSMutableDictionary dictionary];
//    [dict20 setValue:@"100" forKey:@"x"];
//    [dict20 setValue:@"140" forKey:@"y"];
//
//    NSMutableDictionary *dict21 = [NSMutableDictionary dictionary];
//    [dict21 setValue:@"110" forKey:@"x"];
//    [dict21 setValue:@"0" forKey:@"y"];
//
//    NSMutableDictionary *dict22 = [NSMutableDictionary dictionary];
//    [dict22 setValue:@"120" forKey:@"x"];
//    [dict22 setValue:@"120" forKey:@"y"];
//
//    NSMutableDictionary *dict23 = [NSMutableDictionary dictionary];
//    [dict23 setValue:@"130" forKey:@"x"];
//    [dict23 setValue:@"240" forKey:@"y"];
//
//    NSMutableDictionary *dict24 = [NSMutableDictionary dictionary];
//    [dict24 setValue:@"140" forKey:@"x"];
//    [dict24 setValue:@"60" forKey:@"y"];
//
//    [datas1 addObject:dict1];
//    [datas1 addObject:dict2];
//    [datas1 addObject:dict3];
//    [datas1 addObject:dict4];
//    [datas1 addObject:dict5];
//    [datas1 addObject:dict6];
//    [datas1 addObject:dict7];
//    [datas1 addObject:dict8];
//    [datas1 addObject:dict9];
//    [datas1 addObject:dict10];
//    [datas1 addObject:dict11];
//    [datas1 addObject:dict12];
//
//    [datas2 addObject:dict13];
//    [datas2 addObject:dict14];
//    [datas2 addObject:dict15];
//    [datas2 addObject:dict16];
//    [datas2 addObject:dict17];
//    [datas2 addObject:dict18];
//    [datas2 addObject:dict19];
//    [datas2 addObject:dict20];
//    [datas2 addObject:dict21];
//    [datas2 addObject:dict22];
//    [datas2 addObject:dict23];
//    [datas2 addObject:dict24];
    
    [lines addObject:datas1];
    [lines addObject:datas2];
    self.linechartView.datas = [lines mutableCopy];
    
    self.linechartView.colorsArr = [NSArray arrayWithObjects:[UIColor colorWithHexString:@"f95a67"],[UIColor colorWithHexString:@"fac55a"],[UIColor colorWithHexString:@"6bc86b"],[UIColor colorWithHexString:@"7ccdf1"],[UIColor colorWithHexString:@"a6a6a6"], nil];
    self.linechartView.linesColorArr = [NSArray arrayWithObjects:[UIColor redColor],[UIColor blueColor], nil];
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
