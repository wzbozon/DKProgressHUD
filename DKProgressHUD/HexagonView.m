//
//
//  HexagonView.m
//
//  Created by Dennis Kutlubaev on 27.02.14.
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


#import "HexagonView.h"
#import "UIColor+randomColor.h"
#import <QuartzCore/QuartzCore.h>
#import "DKProgressHUD.h"

static const float hexagonSize = 12.0f;
static inline double radians (double degrees) {return degrees * M_PI/180;}

@implementation HexagonView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGAffineTransform transform = CGAffineTransformMakeRotation(radians(30));
        [self setTransform:transform];
    }
    return self;
}


- (id)initWithAngle:(CGFloat)angle
{
    self = [super initWithFrame:CGRectMake(0, 0, hexagonSize, hexagonSize)];
    if (self) {
        CGAffineTransform transform = CGAffineTransformMakeRotation(radians(angle));
        [self setTransform:transform];
    }
    return self;
}


- (id)initWithCenter:(CGPoint)center
{
    self = [super initWithFrame:CGRectMake(0, 0, hexagonSize, hexagonSize)];
    if (self) {
        CGAffineTransform transform = CGAffineTransformMakeRotation(radians(30));
        [self setTransform:transform];
        self.center = center;
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    self.rotateAngle = radians(30);
    self.sideLength = rect.size.height / 2.0;
    self.active = YES;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    CGColorRef fillColor = NULL;
    fillColor = [[DKProgressHUD sharedInstance] color].CGColor;
    if ( fillColor == NULL ) {
        fillColor = [UIColor randomColor].CGColor;
    }
    
    CGContextSetFillColorWithColor(context, fillColor);
	CGContextSetLineWidth(context, 1.0);
    
    CGPoint center = CGPointMake(rect.size.width/2.0, rect.size.height/2.0);
    
    CGContextMoveToPoint(context, center.x, center.y + self.sideLength);
    for(int i = 1; i < 6; ++i)
    {
        CGFloat x = self.sideLength * sinf(i * 2.0 * M_PI / 6.0);
        CGFloat y = self.sideLength * cosf(i * 2.0 * M_PI / 6.0);
        CGContextAddLineToPoint(context, center.x + x, center.y + y);
    }
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    self.backgroundColor = [UIColor clearColor];
    self.alpha = currentAlpha;
}


- (void)makeActive:(BOOL)active
{
    _active = active;
    
    if (active) {
        currentAlpha = 1.0;
    }
    else {
        currentAlpha -= 0.2;
        currentAlpha = (currentAlpha < 0) ? 0.0 : currentAlpha;
    }
    [self setNeedsDisplay];
}


@end
