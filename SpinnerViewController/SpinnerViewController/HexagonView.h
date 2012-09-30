//
//  HexagonView.h
//  SpinnerViewController
//
//  Created by Dennis Kutlubaev on 29.09.12.
//  Free for being used in any projects with a mention of author.
//

#import <UIKit/UIKit.h>

@interface HexagonView : UIView
{
    CGFloat currentAlpha;
}

@property (nonatomic) double rotateAngle;
@property (nonatomic) CGFloat sideLength;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic) BOOL active;

- (id)initWithAngle:(CGFloat)angle;
- (id)initWithCenter:(CGPoint)center;
- (void)makeActive:(BOOL)active;

@end
