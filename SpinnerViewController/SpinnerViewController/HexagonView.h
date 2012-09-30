//
//  HexagonView.h
//  SpinnerViewController
//
//  Created by MrUnknown on 29.09.12.
//  Copyright (c) 2012 Alwawee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HexagonView : UIView
{
    CGFloat currentAlpha;
}

@property (nonatomic) double rotateAngle;
@property (nonatomic) CGFloat sideLength;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic) BOOL active;

- (id)initWithAngle:(CGFloat)angle;
- (id)initWithCenter:(CGPoint)center;
- (void)makeActive:(BOOL)active;

@end
