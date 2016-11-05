//
//  ScreenSaveView.m
//  ScreenSave
//
//  Created by Grâce BOUKOU on 05/11/2016.
//  Copyright © 2016 Grace BOUKOU. All rights reserved.
//

#import "ScreenSaveView.h"

@implementation ScreenSaveView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    NSBezierPath *path;
    NSRect rect;
    NSSize size;
    NSColor *color;
    float red, green, blue, alpha;
    int shapeType;
    
    size = [self bounds].size;
    // Calcul random width et height
    rect.size = NSMakeSize(SSRandomFloatBetween(size.width / 100.0, size.height / 100.0), SSRandomFloatBetween(size.width / 100.0, size.height / 100.0));
    // Calcul random origin point
    rect.origin = SSRandomPointForSizeWithinRect(rect.size, [self bounds]);
    
    // Draw
    shapeType = SSRandomIntBetween(0, 2);
    switch (shapeType) {
        case 0:
            path = [NSBezierPath bezierPathWithRect:rect];
            break;
        case 1:
            path = [NSBezierPath bezierPathWithOvalInRect:rect];
            break;
            
        default:
            break;
    }
    
    // Color
    red = SSRandomFloatBetween(0.0, 255.0) / 255.0;
    green = SSRandomFloatBetween(0.0, 255.0) / 255.0;
    blue = SSRandomFloatBetween(0.0, 255.0) / 255.0;
    alpha = SSRandomFloatBetween(0.0, 255.0) / 255.0;
    
    color = [NSColor colorWithCalibratedRed:red green:green blue:blue alpha:alpha];
    
    [color set];
    
    // And finally draw it
    if (SSRandomIntBetween(0, 1) == 0) {
        [path fill];
    } else {
        [path stroke];
    }
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
