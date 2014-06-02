//
//  DKProgressHUD.h
//
//  Created by Dennis Kutlubaev on 27.02.14.
//  Contributors: Edan Lichtenstein
//  This code is distributed under the terms and conditions of the MIT license.
//  Copyright (c) 2014 Dennis Kutlubaev (alwawee@gmail.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

// Unique, Generic, Highly customizable hud, that is also battery efficient.
// Instead of hexagons based SpinnerView class can be used any other view.
// Please make pull requests, if you manage to create something unique.

#import <UIKit/UIKit.h>

@interface DKProgressHUD : UIView

@property (nonatomic) BOOL isVisible;

// Fill color of hexagons. If not assigned, then randomColor is set.
@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) NSArray *colorArray;

@property (nonatomic) float hexagonSpinRadius;
@property (nonatomic) float hexagonSizeMultiple;
@property (nonatomic) CGPoint point;

@property (nonatomic) NSInteger colorIndex;

+ (DKProgressHUD*)sharedInstance;

+ (void)showInView:(UIView *)view;

+ (void)showInView:(UIView *)view withLocation:(CGPoint) center;

+ (void)showInView:(UIView *)view withFrameSizeMultipleOf:(float) multiplier;

+ (void)showInView:(UIView *)view withLocation:(CGPoint) center andWithFrameSizeMultipleOf:(float) multiplier;

+ (void)hide;

+ (void)setColor:(UIColor *)color;

+ (void)setColors:(NSArray *)arrayOfColors;

+ (void)setBackgroundColor: (UIColor *)color;

+ (void)setHexagonSpinRadiusByMultipleOf:(float) multiple;

+ (void)setHexagonSizeByMultipleOf:(float) multiple;

@end
