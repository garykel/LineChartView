//
//  LineChartView.h
//  LineChartView
//
//  Created by duwei on 2019/2/22.
//  Copyright © 2019年 dz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LineChartView : UIView
@property (nonatomic,copy)NSString *leftUnit;
@property (nonatomic,copy)NSString *rightUnit;
@property (nonatomic,assign)CGFloat leftMaxVal;//左边y轴最大值
@property (nonatomic,assign)CGFloat rightMaxVal;//右边y轴最大值
@property (nonatomic,assign)CGFloat rightMinVal;//右边y轴最小值
@property (nonatomic,strong)NSArray *colorsArr;//自定义区间颜色数组
@property (nonatomic,strong)NSArray *linesColorArr;//折线颜色数组
@property (nonatomic,assign)NSInteger lblCount;
@property (nonatomic,strong)NSMutableArray *datas;
- (void)drawXAxis;
- (void)drawYAxis;
- (void)drawXY;
@end
