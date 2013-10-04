//
//  UIView+NB.m
//  KPI
//
//  Created by Nick Manning on 5/7/13.
//
//

#import "UIView+M3.h"

@implementation UIView (M3)

- (float)width
{
    return self.bounds.size.width;
}

- (float)height
{
    return self.bounds.size.height;
}

- (float)xPos
{
    return self.frame.origin.x;
}

- (float)yPos
{
    return self.frame.origin.y;
}

- (void)resizeTo:(CGSize)size
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height);
}

- (void)resizeToWidth:(float)width
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.bounds.size.height);
}

- (void)resizeToHeight:(float)height
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.bounds.size.width, height);
}

- (void)moveTo:(CGPoint)point
{
    self.frame = CGRectMake(point.x, point.y, self.frame.size.width, self.frame.size.height);
}

- (void)moveToX:(float)x
{
    self.frame = CGRectMake(x, self.frame.origin.y, self.bounds.size.width, self.bounds.size.height);
}

- (void)moveToY:(float)y
{
    self.frame = CGRectMake(self.frame.origin.x, y, self.bounds.size.width, self.bounds.size.height);
}

@end