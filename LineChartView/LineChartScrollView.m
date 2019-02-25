//
//  LineChartScrollView.m
//  LineChartView
//
//  Created by duwei on 2019/2/22.
//  Copyright © 2019年 dz. All rights reserved.
//

#import "LineChartScrollView.h"

@implementation LineChartScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self drawXAxis];
    }
    return self;
}

- (void)drawXAxis {        
    //画x轴文本
    for (NSInteger i = 0; i < 30; i++) {
        CGFloat space = 10;
        CGFloat left = 0;
        CGFloat width = (self.frame.size.width - 20 - 9 * space)/5;
        UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(left + i * (width + space), self.frame.size.height - 35, width, 30)];
        lbl.textColor = [UIColor blackColor];
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.text = [NSString stringWithFormat:@"我是第%ld个",i + 1];
        [self addSubview:lbl];
    }        
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    NSLog(@"current point is :%@",NSStringFromCGPoint(point));
}
@end
