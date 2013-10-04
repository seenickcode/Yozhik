//
//  UIViewController+M3.m
//  RestrictedList2
//
//  Created by Nick Manning on 10/1/13.
//
//

#import "UIViewController+M3.h"

@implementation UIViewController (M3)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

- (void)performSelector:(SEL)aSelector forDelegate:(id)delegate
{
    if ([delegate respondsToSelector:aSelector]) {
        [delegate performSelector:aSelector];
    }
}

- (void)performSelector:(SEL)aSelector forDelegate:(id)delegate withObject:(id)object1
{
    if ([delegate respondsToSelector:aSelector]) {
        [delegate performSelector:aSelector withObject:object1];
    }
}

- (void)performSelector:(SEL)aSelector forDelegate:(id)delegate withObject:(id)object1 withObject:(id)object2
{
    if ([delegate respondsToSelector:aSelector]) {
        [delegate performSelector:aSelector withObject:object1 withObject:object2];
    }
}
#pragma clang diagnostic pop

@end
