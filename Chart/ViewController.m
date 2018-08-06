//
//  ViewController.m
//  Chart
//
//  Created by admin on 2018/8/6.
//  Copyright © 2018年 dai. All rights reserved.
//

#import "ViewController.h"
#import "GGGraphics.h"
#import "LineBarChart.h"
#import "LineData.h"
#import "BarData.h"
@interface ViewController ()
@property (nonatomic) LineBarChart * lineBarChart;

@property (nonatomic, strong) BarData * barData1;
@property (nonatomic, strong) BarData * barData2;

@property (nonatomic, strong) LineData * lineData1;
@property (nonatomic, strong) LineData * lineData2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //注意在 pch 上加上  下面宏定义代码
    /*
     #ifdef __OBJC__
     #import <UIKit/UIKit.h>
     #import <Foundation/Foundation.h>
     
     #import "GGGraphics.h"
     #endif
     */
    
    _barData1 = [[BarData alloc] init];
    _barData1.dataAry = @[@1.29, @-1.88, @1.46, @-3.30, @3.66, @3.23, @-3.48, @-3.51];
    _barData1.barWidth = 10;
    _barData1.barFillColor = __RGB_RED;
    
    _barData2 = [[BarData alloc] init];
    _barData2.dataAry = @[@11.29, @11.88, @11.46, @13.30, @13.66, @13.23, @13.48, @13.51];
    _barData2.barWidth = 10;
    _barData2.barFillColor = __RGB_CYAN;
    
    _lineData1 = [[LineData alloc] init];
    _lineData1.lineColor = __RGB_RED;
    _lineData1.scalerMode = ScalerAxisRight;
    _lineData1.shapeRadius = 2;
    _lineData1.dataAry = @[@1.29, @0, @1.46, @2, @3.66, @3.23, @8, @16];
    
    _lineData2 = [[LineData alloc] init];
    _lineData2.lineColor = __RGB_ORIGE;
    _lineData2.scalerMode = ScalerAxisRight;
    _lineData2.shapeRadius = 2;
    _lineData2.dataAry = @[@11.29, @2, @11.46, @5, @13.66, @3.23, @7, @9];
    
    LineBarDataSet * lineBarSet = [[LineBarDataSet alloc] init];
    lineBarSet.insets = UIEdgeInsetsMake(30, 40, 30, 40);
    lineBarSet.lineAry = @[_lineData1, _lineData2];
    lineBarSet.barAry = @[_barData1, _barData2];
    lineBarSet.updateNeedAnimation = YES;
    
    lineBarSet.gridConfig.lineColor = C_HEX(0xe4e4e4);
    lineBarSet.gridConfig.lineWidth = .5f;
    lineBarSet.gridConfig.axisLineColor = RGB(146, 146, 146);
    lineBarSet.gridConfig.axisLableColor = RGB(146, 146, 146);
    
    lineBarSet.gridConfig.bottomLableAxis.lables = @[@"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16"];
    lineBarSet.gridConfig.bottomLableAxis.drawStringAxisCenter = YES;
    lineBarSet.gridConfig.bottomLableAxis.showSplitLine = YES;
    lineBarSet.gridConfig.bottomLableAxis.over = 2;
    lineBarSet.gridConfig.bottomLableAxis.showQueryLable = YES;
    
    lineBarSet.gridConfig.leftNumberAxis.splitCount = 8;
    lineBarSet.gridConfig.leftNumberAxis.dataFormatter = @"%.0f";
    lineBarSet.gridConfig.leftNumberAxis.showSplitLine = YES;
    lineBarSet.gridConfig.leftNumberAxis.showQueryLable = YES;
    
    lineBarSet.gridConfig.rightNumberAxis.splitCount = 2;
    lineBarSet.gridConfig.rightNumberAxis.dataFormatter = @"%.0f";
    lineBarSet.gridConfig.rightNumberAxis.showQueryLable = YES;
    
    // LineBar Demo 1
    _lineBarChart = [[LineBarChart alloc] initWithFrame:CGRectMake(5, 70, [UIScreen mainScreen].bounds.size.width - 10, 240)];
    _lineBarChart.lineBarDataSet = lineBarSet;
    _lineBarChart.backgroundColor = [UIColor yellowColor];
    [_lineBarChart drawLineBarChart];
    [self.view addSubview:_lineBarChart];
    [_lineBarChart startLineAnimationsWithType:LineAnimationRiseType duration:.8f];
    [_lineBarChart startBarAnimationsWithType:BarAnimationRiseType duration:.8f];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
