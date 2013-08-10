//
//  CustomControlViewController.m
//  CustomControlWithGesture
//
//  Created by Scott E Love on 8/10/13.
//  Copyright (c) 2013 Scott E Love. All rights reserved.
//

#import "CustomControlViewController.h"
#import "CircleControl.h"

@interface CustomControlViewController ()

@end

@implementation CustomControlViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupCircleControls];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setupCircleControls
{
    CircleControl *control1 = [[CircleControl alloc] initWithImage:[self createImageWithColor:[UIColor redColor]] withViewLength:95];
    control1.center = CGPointMake(100.0, 150.0);
    [self.view addSubview:control1];
    
    CircleControl *contol2 = [[CircleControl alloc] initWithImage:[self createImageWithColor:[UIColor redColor]] withViewLength:95];
    control1.center = CGPointMake(300.0, 150.0);
    [self.view addSubview:contol2];
    
}

- (UIImage *) createImageWithColor:(UIColor *)circleColor
{
	UIColor *fillColor = [UIColor clearColor];
    
    CGSize imageSize = CGSizeMake(95, 95);
    
	CGRect imageRec = (CGRect){.size = imageSize};
    
	UIGraphicsBeginImageContext(imageSize);
    
	[fillColor setFill];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:imageRec];
    [path fill];
	
    [circleColor setStroke];
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(imageRec, 6, 6)];
    [path stroke];
	
	UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return theImage;
}


@end
