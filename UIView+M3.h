//
//  UIView+NB.h
//  KPI
//
//  Created by Nick Manning on 5/7/13.
//
//

#import <UIKit/UIKit.h>

@interface UIView (M3)

- (float)width;
- (float)height;
- (float)xPos;
- (float)yPos;
- (void)resizeTo:(CGSize)size;
- (void)resizeToWidth:(float)width;
- (void)resizeToHeight:(float)height;
- (void)moveTo:(CGPoint)point;
- (void)moveToX:(float)x;
- (void)moveToY:(float)y;

@end
