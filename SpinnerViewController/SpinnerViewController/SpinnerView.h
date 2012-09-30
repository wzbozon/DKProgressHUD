//
//  SpinnerView.h
//  Nanotechnology
//
//  Created by MrUnknown on 29.09.12.
//  Copyright (c) 2012 Alwawee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpinnerView : UIView
{
    NSInteger i;
}

@property (nonatomic, strong) NSMutableArray *hexagons;
@property (nonatomic, strong) NSTimer *timer;


@end
