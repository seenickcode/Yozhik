//
//  UIViewController+M3.h
//  RestrictedList2
//
//  Created by Nick Manning on 10/1/13.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (M3)

- (void)performSelector:(SEL)aSelector forDelegate:(id)delegate;
- (void)performSelector:(SEL)aSelector forDelegate:(id)delegate withObject:(id)object1;
- (void)performSelector:(SEL)aSelector forDelegate:(id)delegate withObject:(id)object1 withObject:(id)object2;

@end
