//
//  CircleControl.h
//  CustomControlWithGesture
//
//  Created by Scott E Love on 8/10/13.
//  Copyright (c) 2013 Scott E Love. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleControl : UIImageView
{
    CGPoint oldLocation;
    float sideLength;
}

- (id) initWithImage:(UIImage *)image withViewLength:(float)viewLength;
@end
