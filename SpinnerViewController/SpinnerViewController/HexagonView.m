//
//  HexagonView.m
//  SpinnerViewController
//
//  Created by MrUnknown on 29.09.12.
//  Copyright (c) 2012 Alwawee. All rights reserved.
//

#import "HexagonView.h"

#define FILL_COLOR [UIColor blueColor]

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
    self = [super initWithFrame:CGRectMake(0, 0, 60, 60)];
    if (self) {
        CGAffineTransform transform = CGAffineTransformMakeRotation(radians(angle));
        [self setTransform:transform];
    }
    return self;
}


- (id)initWithCenter:(CGPoint)center
{
    self = [super initWithFrame:CGRectMake(0, 0, 60, 60)];
    if (self) {
        CGAffineTransform transform = CGAffineTransformMakeRotation(radians(30));
        [self setTransform:transform];
        self.center = center;
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    self.rotateAngle = radians(30);
    self.sideLength = rect.size.height / 2.0;
    self.active = YES;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
    CGColorRef fillColor = FILL_COLOR.CGColor;
    CGContextSetFillColorWithColor(context, fillColor);
	CGContextSetLineWidth(context, 2.0);
    
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

/*- (UIColor*)fillColor
{
    if (_fillColor) {
        return _fillColor;
    }
    else {
        return [UIColor blackColor];
    }
}*/

@end
