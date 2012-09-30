//
//  SpinnerView.m
//  Nanotechnology
//
//  Created by MrUnknown on 29.09.12.
//  Copyright (c) 2012 Alwawee. All rights reserved.
//

#import "SpinnerView.h"
#import "HexagonView.h"
#import <QuartzCore/QuartzCore.h>

static inline double radians (double degrees) {return degrees * M_PI/180;}

@implementation SpinnerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.hexagons = [[NSMutableArray alloc] initWithCapacity:6];
        
        NSLog(@"Frame:%@", NSStringFromCGRect(frame));
        NSLog(@"Center:%@", NSStringFromCGPoint(self.center));
        
        CGPoint center = CGPointMake(frame.size.width/2.0, frame.size.height/2.0);
        
        HexagonView *hexagon = [[HexagonView alloc] initWithCenter:CGPointMake(center.x-35, center.y-60)];
        [self addSubview:hexagon];

        HexagonView *hexagon2 = [[HexagonView alloc] initWithCenter:CGPointMake(center.x+35, center.y-60)];
        [self addSubview:hexagon2];
        
        HexagonView *hexagon3 = [[HexagonView alloc] initWithCenter:CGPointMake(center.x-70, center.y)];
        [self addSubview:hexagon3];
        
        HexagonView *hexagon4 = [[HexagonView alloc] initWithCenter:CGPointMake(center.x+70, center.y)];
        [self addSubview:hexagon4];
        
        HexagonView *hexagon5 = [[HexagonView alloc] initWithCenter:CGPointMake(center.x-35, center.y+60)];
        [self addSubview:hexagon5];
                
        HexagonView *hexagon6 = [[HexagonView alloc] initWithCenter:CGPointMake(center.x+35, center.y+60)];
        [self addSubview:hexagon6];
        
        [self.hexagons addObject:hexagon];
        [self.hexagons addObject:hexagon2];
        [self.hexagons addObject:hexagon4];
        [self.hexagons addObject:hexagon6];
        [self.hexagons addObject:hexagon5];
        [self.hexagons addObject:hexagon3];

        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.9;
        //self.layer.borderWidth = 2;
        //self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.cornerRadius = 10;
        self.clipsToBounds = YES;
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(changeColors) userInfo:nil repeats:YES];
        
        i = 0;
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

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

@end
