//
//  SpinnerView.m
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


#import "SpinnerView.h"
#import "HexagonView.h"
#import <QuartzCore/QuartzCore.h>
#import "DKProgressHUD.h"

static inline double radians (double degrees) {return degrees * M_PI/180;}

@implementation SpinnerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        float multiple = [[DKProgressHUD sharedInstance] hexagonSpinRadius];
        if (multiple == 0) {
            multiple = 1;
        }
        self.hexagons = [[NSMutableArray alloc] initWithCapacity:6];
        
        CGPoint center = CGPointMake(frame.size.width/2.0, frame.size.height/2.0);
        
        HexagonView *hexagon = [[HexagonView alloc] initWithCenter:CGPointMake(center.x-multiple*7, center.y-multiple*12)];
        [self addSubview:hexagon];
        
        HexagonView *hexagon2 = [[HexagonView alloc] initWithCenter:CGPointMake(center.x+multiple*7, center.y-multiple*12)];
        [self addSubview:hexagon2];
        
        HexagonView *hexagon3 = [[HexagonView alloc] initWithCenter:CGPointMake(center.x-multiple*14, center.y)];
        [self addSubview:hexagon3];
        
        HexagonView *hexagon4 = [[HexagonView alloc] initWithCenter:CGPointMake(center.x+multiple*14, center.y)];
        [self addSubview:hexagon4];
        
        HexagonView *hexagon5 = [[HexagonView alloc] initWithCenter:CGPointMake(center.x-multiple*7, center.y+multiple*12)];
        [self addSubview:hexagon5];
        
        HexagonView *hexagon6 = [[HexagonView alloc] initWithCenter:CGPointMake(center.x+multiple*7, center.y+multiple*12)];
        [self addSubview:hexagon6];
        
        [self.hexagons addObject:hexagon];
        [self.hexagons addObject:hexagon2];
        [self.hexagons addObject:hexagon4];
        [self.hexagons addObject:hexagon6];
        [self.hexagons addObject:hexagon5];
        [self.hexagons addObject:hexagon3];
        
        self.backgroundColor = [[DKProgressHUD sharedInstance] backgroundColor];
        if (!self.backgroundColor){
            self.backgroundColor = [UIColor blackColor];
        }

        self.alpha = 0.8;
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeColors) userInfo:nil repeats:YES];
        
        i = 0;
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    
}


- (void)changeColors
{
    i++;
    if (i==6) i=0;
    
    for (int j=0; j<6; ++j) {
        HexagonView *hexagon = [self.hexagons objectAtIndex:j];
        if (j==i) {
            [hexagon makeActive:YES];
        }
        else {
            [hexagon makeActive:NO];
        }
    }
}


// We should stop animation when possible to save battery life
// Don't worry about it. This behavior of SpinnerView is automatically handled by DKProgressHUD for any SpinnerView.

- (void)stopAnimating
{
    [self.timer invalidate];
    self.timer = nil;
}


- (void)startAnimating
{
    if ( ! self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeColors) userInfo:nil repeats:YES];
    }
}

@end
