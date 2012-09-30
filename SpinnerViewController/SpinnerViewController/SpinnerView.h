//
//  SpinnerView.h
//  
//
//  Created by Dennis Kutlubaev on 29.09.12.
//  Free for being used in any projects with a mention of author.
//

#import <UIKit/UIKit.h>

@interface SpinnerView : UIView
{
    NSInteger i;
}

@property (nonatomic, strong) NSMutableArray *hexagons;
@property (nonatomic, strong) NSTimer *timer;


@end
