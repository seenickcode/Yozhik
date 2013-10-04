//
//  UIAlertView+M3.m
//  RestrictedList2
//
//  Created by Nick Manning on 10/1/13.
//
//

#import "UIAlertView+M3.h"

@implementation UIAlertView (M3)

+ (void)showWithTitle:(NSString *)title message:(NSString *)message
{
    UIAlertView *a = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [a show];
}

@end
