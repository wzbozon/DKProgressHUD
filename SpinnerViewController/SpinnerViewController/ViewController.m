//
//  ViewController.m
//  SpinnerViewController
//
//  Created by MrUnknown on 29.09.12.
//  Copyright (c) 2012 Alwawee. All rights reserved.
//

#import "ViewController.h"
#import "SpinnerView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    SpinnerView *spinner = [[SpinnerView alloc] initWithFrame:CGRectMake(50, 50, 210, 210)];
    spinner.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"bg.png"];
    [self.view addSubview:imageView];
    
    [self.view addSubview:spinner];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
