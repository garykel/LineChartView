//
//  LineChartView.m
//  LineChartView
//
//  Created by duwei on 2019/2/22.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "LineChartView.h"
#import "LineChartScrollView.h"

#define scrollView_leftMargin 40 //滚动视图距离左侧边距
#define scrollView_rightMargin 40 //滚动视图距离右侧边距
#define scrollView_topMargin 30 //滚动视图距离顶部边距
#define scrollView_bottomMargin 40 //滚动视图距离底部边距
#define leftUnit_leftMargin 5 //左侧y轴距离左侧边距
#define leftUnit_width 40 //左侧y轴宽度
#define rightUnit_width 60 //右侧y轴宽度
#define unitLbl_height 20 //单位标签高度
#define rightUnit_rightMargin 10 //右侧y轴单位标签距离右侧边距
@interface LineChartView () {
    LineChartScrollView *_scrollView;//折线图区域
}

@end

@implementation LineChartView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor grayColor];
        _scrollView = [[LineChartScrollView alloc] initWithFrame:CGRectMake(scrollView_leftMargin, 0, frame.size.width - 2 * scrollView_leftMargin, frame.size.height)];
        _scrollView.contentSize = CGSizeMake((frame.size.width - 2 * scrollView_leftMargin) * 3, frame.size.height);
        _scrollView.bounces = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_scrollView];
        self.datas = [NSMutableArray array];
//        [self drawXAxis];
//        [self drawYAxis];
    }
    return self;
}

- (void)drawXAxis {
    UIBezierPath *xpath = [UIBezierPath bezierPath];
    [xpath moveToPoint:CGPointMake(40, self.frame.size.height - scrollView_leftMargin)];
    [xpath addLineToPoint:CGPointMake(self.frame.size.width - scrollView_leftMargin, self.frame.size.height - scrollView_leftMargin)];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    [layer setPath:xpath.CGPath];
    layer.lineWidth = 1;
    layer.strokeColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:layer];
}

- (void)drawYAxis {
    //左侧y轴
    UIBezierPath *leftAxisPath = [UIBezierPath bezierPath];
    [leftAxisPath moveToPoint:CGPointMake(scrollView_leftMargin, scrollView_topMargin)];
    [leftAxisPath addLineToPoint:CGPointMake(scrollView_leftMargin, self.frame.size.height - scrollView_leftMargin)];
    CAShapeLayer *leftAxisLayer = [[CAShapeLayer alloc] init];
    [leftAxisLayer setPath:leftAxisPath.CGPath];
    leftAxisLayer.lineWidth = 1;
    leftAxisLayer.strokeColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:leftAxisLayer];
    
    //右侧y轴
    UIBezierPath *rightAxisPath = [UIBezierPath bezierPath];
    [rightAxisPath moveToPoint:CGPointMake(self.frame.size.width - scrollView_leftMargin, scrollView_topMargin)];
    [rightAxisPath addLineToPoint:CGPointMake(self.frame.size.width - scrollView_leftMargin, self.frame.size.height - scrollView_leftMargin)];
    CAShapeLayer *rightAxisLayer = [[CAShapeLayer alloc] init];
    [rightAxisLayer setPath:rightAxisPath.CGPath];
    rightAxisLayer.lineWidth = 1;
    rightAxisLayer.strokeColor = [UIColor whiteColor].CGColor;
    [self.layer addSublayer:rightAxisLayer];
    
    //左侧y轴单位
    UILabel *leftUnitLbl = [[UILabel alloc] initWithFrame:CGRectMake(leftUnit_leftMargin, 0, leftUnit_width, unitLbl_height)];
    leftUnitLbl.textAlignment = NSTextAlignmentLeft;
    leftUnitLbl.textColor = [UIColor blackColor];
    leftUnitLbl.text = @"bpm";
    leftUnitLbl.text = self.leftUnit;
    [self addSubview:leftUnitLbl];
    
    //右侧y轴单位
    UILabel *rightUnitLbl = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - leftUnit_leftMargin - rightUnit_width, 0, rightUnit_width, unitLbl_height)];
    rightUnitLbl.textAlignment = NSTextAlignmentRight;
    rightUnitLbl.textColor = [UIColor blackColor];
    rightUnitLbl.text = @"%";
    rightUnitLbl.text = self.rightUnit;
    [self addSubview:rightUnitLbl];
    
    for (NSInteger j = 0; j <= self.lblCount; j++) {
        CGFloat height = (self.frame.size.height - scrollView_topMargin - scrollView_bottomMargin)/6.5;
        NSInteger ySpace = (NSInteger)((self.leftMaxVal - self.leftMaxVal * (self.rightMinVal / 100))/self.lblCount);
        if (j < self.lblCount) {
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(scrollView_leftMargin, scrollView_topMargin + height * j)];
            [path addLineToPoint:CGPointMake(self.frame.size.width - scrollView_rightMargin, scrollView_topMargin + height * j)];
            [path addLineToPoint:CGPointMake(self.frame.size.width - scrollView_rightMargin, scrollView_topMargin + (j + 1) * height)];
            [path addLineToPoint:CGPointMake(scrollView_leftMargin, scrollView_topMargin + (j + 1) * height)];
            
            CAShapeLayer *areaLayer = [[CAShapeLayer alloc] init];
            areaLayer.path = path.CGPath;
            areaLayer.lineWidth = 1;
            areaLayer.strokeColor = [UIColor whiteColor].CGColor;
            UIColor *color = (UIColor*)[self.colorsArr objectAtIndex:j];
            areaLayer.fillColor = color.CGColor;
            [self.layer addSublayer:areaLayer];
        }
        
        CGFloat lblLeft = 0;
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(lblLeft, scrollView_topMargin + j * height - unitLbl_height / 2, leftUnit_width, unitLbl_height)];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.textColor = [UIColor blackColor];
        lbl.font = [UIFont systemFontOfSize:14.0];
        if (j < self.lblCount + 1) {
            lbl.text = [NSString stringWithFormat:@"%ld",(long)(self.leftMaxVal - j * ySpace)];
        } else {
            lbl.text = @"";
        }
        [self addSubview:lbl];
        
        UILabel *rlbl = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - scrollView_rightMargin - rightUnit_rightMargin, scrollView_topMargin + j * height - unitLbl_height / 2, rightUnit_width, unitLbl_height)];
        rlbl.textAlignment = NSTextAlignmentCenter;
        rlbl.textColor = [UIColor blackColor];
        rlbl.font = [UIFont systemFontOfSize:14.0];
        NSInteger space = (NSInteger)((self.rightMaxVal - self.rightMinVal)/self.lblCount);
        if (j < self.lblCount + 1) {
            rlbl.text = [NSString stringWithFormat:@"%ld",(NSInteger)self.rightMaxVal - j * space];
        } else {
            rlbl.text = @"";
        }
        [self addSubview:rlbl];
    }
}

- (void)drawXY {
    if (self.datas.count > 0) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        for (NSInteger i = 0;i < self.datas.count;i++) {
            NSDictionary *dict = [self.datas objectAtIndex:i];
            NSInteger x = [[dict valueForKey:@"x"] integerValue];
            NSInteger y = [[dict valueForKey:@"y"] integerValue];
            if (i == 0) {
                [path moveToPoint:CGPointMake(scrollView_leftMargin + x, scrollView_topMargin + self.leftMaxVal - y)];
            } else {
                [path addLineToPoint:CGPointMake(scrollView_leftMargin + x, scrollView_topMargin + self.leftMaxVal - y)];
            }
            CAShapeLayer *layer = [[CAShapeLayer alloc] init];
            layer.path = path.CGPath;
            layer.lineWidth = 2;
            layer.strokeColor = [UIColor purpleColor].CGColor;
            layer.fillColor = [UIColor clearColor].CGColor;
            [self.layer addSublayer:layer];
        }
    }
}
@end
