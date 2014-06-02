//
//  ViewController.m
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

#import "ViewController.h"
#import "SpinnerView.h"
#import "DKProgressHUD.h"

#define RGBA(rgbValue, opacity) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:opacity]

#define RGB(rgbValue) RGBA(rgbValue, 1.0)

#define COLOR_CUSTOM_LIGHT_BLUE RGB(0x3698dc)

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) NSArray *colorArray;

@end


@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.colorArray = [[NSArray alloc] initWithObjects:[UIColor redColor],[UIColor blueColor],[UIColor greenColor], [UIColor yellowColor],[UIColor purpleColor], [UIColor orangeColor], [UIColor brownColor],nil];
    
    
    //You can set one color for hexagons in a DKProgressHUD or set an array of colors,  otherwise it will be randomly generated.
    //[DKProgressHUD setColor:[UIColor blueColor]];
    
    [DKProgressHUD setColors:self.colorArray];
    
    //You can set a different background color for DKProgressHUD spinner, otherwise it will be black.
    [DKProgressHUD setBackgroundColor:[UIColor whiteColor]];
    
    //To increase the spinning radius of the hexagons
    [DKProgressHUD setHexagonSpinRadiusByMultipleOf:2.35];
    
    //To increase the size of the hexagons
    [DKProgressHUD setHexagonSizeByMultipleOf:3.1];

    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 150, 300, 1080.0 / 1920.0 * 300.0)];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.view addSubview:self.imageView];
    
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setFrame:CGRectMake(10, self.imageView.frame.origin.y + self.imageView.frame.size.height + 10, 300, 44)];
    [self.button setTitle:@"Restart" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(restartClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
    [self restartClicked:nil];
}


- (void)restartClicked:(id)sender
{
    [self.imageView setImage:nil];
    [self.button setHidden:YES];

    //[DKProgressHUD showInView:self.view];

    //An intiizlizer to change the view location of the DKProgressHUD
    //[DKProgressHUD showInView:self.view withLocation:CGPointMake(220, 130)];
    
    //An initializer to change the size of the background frame of DKProgressHUD
    //[DKProgressHUD showInView:self.view withFrameSizeMultipleOf: 5];
    
    //An intializer for both variables
    [DKProgressHUD showInView:self.view withLocation:CGPointMake(160,200) andWithFrameSizeMultipleOf:2.75];
    
    
    [self performSelector:@selector(changeImage) withObject:nil afterDelay:3.0];
}


- (void)changeImage
{
    [DKProgressHUD hide];
    
    self.imageView.alpha = 0.0;
    [self.imageView setImage:[UIImage imageNamed:@"scarlett-johansson.jpg"]];
    
    [UIView animateWithDuration:1.0 animations:^{
        
        self.imageView.alpha = 1.0;
        
    } completion:^(BOOL finished) {
        
        [self.button setHidden:NO];
        
    }];
}


@end
