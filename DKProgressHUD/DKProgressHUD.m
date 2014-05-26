//
//  DKProgressHUD.m
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

#import "DKProgressHUD.h"
#import "SpinnerView.h"

static DKProgressHUD *sharedInstance;


@interface DKProgressHUD()

@property (nonatomic, strong) SpinnerView *spinnerView;

@end


@implementation DKProgressHUD

+ (DKProgressHUD*)sharedInstance {
    static dispatch_once_t once;
    
    dispatch_once(&once, ^ {
        sharedInstance = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    });
    
    return sharedInstance;
}


+ (void)showInView:(UIView *)view
{
    [self showInView:view withLocation:CGPointMake(view.frame.size.width/2, view.frame.size.height/2) andWithFrameSizeMultipleOf:1];
 }

+ (void)showInView:(UIView *)view withLocation:(CGPoint) center
{
    
    [self showInView:view withLocation:center andWithFrameSizeMultipleOf:1];
}

+ (void)showInView:(UIView *)view withFrameSizeMultipleOf:(float) multiplier
{
    [self showInView:view withLocation:CGPointMake(view.frame.size.width/2, view.frame.size.height/2) andWithFrameSizeMultipleOf:multiplier];
    
}

+ (void)showInView:(UIView *)view withLocation:(CGPoint) center andWithFrameSizeMultipleOf:(float) multiplier
{
    DKProgressHUD *sharedInstance = [DKProgressHUD sharedInstance];
    
    if ( ! [sharedInstance isVisible] ) {
        
        NSLog (@"%f", multiplier);
        sharedInstance.spinnerView = [[SpinnerView alloc] initWithFrame:CGRectMake(0, 0, multiplier*44, multiplier*44)];
        
        sharedInstance.spinnerView.center = center;
        
        [view addSubview:sharedInstance.spinnerView];
        
        [sharedInstance setIsVisible:YES];
        
        [sharedInstance.spinnerView startAnimating];
        
    }
}


+ (void)hide
{
    DKProgressHUD *sharedInstance = [DKProgressHUD sharedInstance];
    
    if ( [sharedInstance isVisible] ) {
    
        [sharedInstance.spinnerView removeFromSuperview];
        
        [sharedInstance.spinnerView stopAnimating];
    
        sharedInstance.isVisible = NO;
        
    }
}


+ (void)setColor:(UIColor *)color
{
    [[DKProgressHUD sharedInstance] setColor:color];
}

+ (void)setColors:(NSArray *)arrayOfColors
{
    [[DKProgressHUD sharedInstance] setColorArray:arrayOfColors];
}


+ (void) setBackgroundColor:(UIColor *)color
{
    [[DKProgressHUD sharedInstance] setBackgroundColor:color];
}

+ (void) setHexagonSpinRadiusByMultipleOf:(float) multiple
{
    [[DKProgressHUD sharedInstance] setHexagonSpinRadius:multiple];
}

+ (void)setHexagonSizeByMultipleOf:(float)multiple
{
    [[DKProgressHUD sharedInstance] setHexagonSizeMultiple:multiple];
}

@end
