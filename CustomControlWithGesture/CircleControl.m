//
//  CircleControl.m
//  CustomControlWithGesture
//
//  Created by Scott E Love on 8/10/13.
//  Copyright (c) 2013 Scott E Love. All rights reserved.
//

#import "CircleControl.h"

@implementation CircleControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id) initWithImage: (UIImage *) anImage
{
    if (self = [super initWithImage:anImage])
    {
        self.userInteractionEnabled = YES;
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        self.gestureRecognizers = @[pan];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (id) initWithImage:(UIImage *)image withViewLength:(float)viewLength
{
    self = [self initWithImage:image];
    if (self) {
        sideLength = viewLength;
    }
    return self;
}

- (BOOL) pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
	CGPoint testPoint;
	float sideLengtHalf = sideLength / 2.0f;
	
	testPoint.x = (point.x - sideLengtHalf) / sideLengtHalf;
	testPoint.y = (point.y - sideLengtHalf) / sideLengtHalf;
	
	float xsquared = pow(testPoint.x, 2);
	float ysquared = pow(testPoint.y, 2);
	
	if ((xsquared + ysquared) < 1.0) return YES;
	return NO;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    oldLocation = self.center;
}

- (void) panAction: (UIPanGestureRecognizer *) uigr
{
	CGPoint translation = [uigr translationInView:self.superview];
	CGPoint newcenter = CGPointMake(oldLocation.x + translation.x, oldLocation.y + translation.y);
    
	self.center = newcenter;
    
    
}
@end
