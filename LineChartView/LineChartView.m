//
//  LineChartView.m
//  LineChartView
//
//  Created by duwei on 2019/2/22.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "LineChartView.h"
#import "LineChartScrollView.h"

@interface LineChartView () {
    LineChartScrollView *_scrollView;//折线图区域
}

@end

@implementation LineChartView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor grayColor];
        _scrollView = [[LineChartScrollView alloc] initWithFrame:CGRectMake(10, 0, frame.size.width - 2 * 10, frame.size.height)];
        _scrollView.contentSize = CGSizeMake((frame.size.width - 2 * 10) * 3, frame.size.height);
        _scrollView.bounces = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_scrollView];
//        [self drawXAxis];
//        [self drawYAxis];
    }
    return self;
}

- (void)drawXAxis {
    UIBezierPath *xpath = [UIBezierPath bezierPath];
    [xpath moveToPoint:CGPointMake(10, self.frame.size.height - 40)];
    [xpath addLineToPoint:CGPointMake(self.frame.size.width - 10, self.frame.size.height - 40)];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    [layer setPath:xpath.CGPath];
    layer.lineWidth = 1;
    layer.strokeColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:layer];
}

- (void)drawYAxis {
    //左侧y轴
    UIBezierPath *leftAxisPath = [UIBezierPath bezierPath];
    [leftAxisPath moveToPoint:CGPointMake(10, 30)];
    [leftAxisPath addLineToPoint:CGPointMake(10, self.frame.size.height - 40)];
    CAShapeLayer *leftAxisLayer = [[CAShapeLayer alloc] init];
    [leftAxisLayer setPath:leftAxisPath.CGPath];
    leftAxisLayer.lineWidth = 1;
    leftAxisLayer.strokeColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:leftAxisLayer];
    
    //右侧y轴
    UIBezierPath *rightAxisPath = [UIBezierPath bezierPath];
    [rightAxisPath moveToPoint:CGPointMake(self.frame.size.width - 10, 30)];
    [rightAxisPath addLineToPoint:CGPointMake(self.frame.size.width - 10, self.frame.size.height - 40)];
    CAShapeLayer *rightAxisLayer = [[CAShapeLayer alloc] init];
    [rightAxisLayer setPath:rightAxisPath.CGPath];
    rightAxisLayer.lineWidth = 1;
    rightAxisLayer.strokeColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:rightAxisLayer];
    
    //左侧y轴单位
    UILabel *leftUnitLbl = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 40, 20)];
    leftUnitLbl.textAlignment = NSTextAlignmentLeft;
    leftUnitLbl.textColor = [UIColor blackColor];
    leftUnitLbl.text = @"bpm";
    leftUnitLbl.text = self.leftUnit;
    [self addSubview:leftUnitLbl];
    
    //右侧y轴单位
    UILabel *rightUnitLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 5 - 60, 5, 60, 20)];
    rightUnitLbl.textAlignment = NSTextAlignmentRight;
    rightUnitLbl.textColor = [UIColor blackColor];
    rightUnitLbl.text = @"%";
    rightUnitLbl.text = self.rightUnit;
    [self addSubview:rightUnitLbl];
    
    //y轴顶部分割线
    UIBezierPath *topLinePath = [UIBezierPath bezierPath];
    [topLinePath moveToPoint:CGPointMake(10, 30)];
    [topLinePath addLineToPoint:CGPointMake(self.frame.size.width - 10, 30)];
    
    CAShapeLayer *topLineLayer = [[CAShapeLayer alloc] init];
    [topLineLayer setPath:topLinePath.CGPath];
    topLineLayer.lineWidth = 1;
    topLineLayer.strokeColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:topLineLayer];
    
    for (NSInteger j = 0; j <= self.lblCount; j++) {
        CGFloat height = (self.frame.size.height - 30 - 40)/6.5;
        CGFloat left = 5;
        CGFloat right = self.frame.size.width - left - 40;
        NSInteger ySpace = (NSInteger)((self.leftMaxVal - self.leftMaxVal * (self.rightMinVal / 100))/self.lblCount);
        CGFloat top = 30;
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(left, top + j * height - 5, 40, 30)];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.textColor = [UIColor blackColor];
        if (j < 6) {
            lbl.text = [NSString stringWithFormat:@"%ld",(long)(self.leftMaxVal - j * ySpace)];
        } else {
            lbl.text = @"";
        }
        [self addSubview:lbl];
        
        UILabel *rlbl = [[UILabel alloc] initWithFrame:CGRectMake(right, top + j * height - 5, 40, 30)];
        rlbl.textAlignment = NSTextAlignmentCenter;
        rlbl.textColor = [UIColor blackColor];
        NSInteger space = (NSInteger)((self.rightMaxVal - self.rightMinVal)/self.lblCount);
        if (j < 6) {
            rlbl.text = [NSString stringWithFormat:@"%ld",100 - j * space];
        } else {
            rlbl.text = @"";
        }
        [self addSubview:rlbl];
        //添加分割线
        UIBezierPath *seperateLinePath = [UIBezierPath bezierPath];
        [seperateLinePath moveToPoint:CGPointMake(10, top + (j + 1) * height - 5)];
        [seperateLinePath addLineToPoint:CGPointMake(self.frame.size.width - 10, top + (j + 1) * height - 8)];
        
        CAShapeLayer *seperateLineLayer = [[CAShapeLayer alloc] init];
        [seperateLineLayer setPath:seperateLinePath.CGPath];
        [seperateLineLayer setLineWidth:1.0];
        [seperateLineLayer setStrokeColor:[UIColor whiteColor].CGColor];
        [self.layer addSublayer:seperateLineLayer];
    }
}

@end
