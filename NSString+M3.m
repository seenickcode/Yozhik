//
//  NSString+M3.m
//  
//
//  Created by Nick Manning on 10/1/13.
//
//

#import "NSString+M3.h"

@implementation NSString (M3)

BOOL NSStringEmpty(id value)
{
    if (!value) {
        return YES;
    } else if ([value respondsToSelector:@selector(length)]) {
        return (value == nil || [[NSString trim:value] length] == 0);
    } else {
        return (value == nil);
    }
}

+ (id)stringIfNil:(id)object
{
    return (object ? object : @"");
}

+ (NSString *)trim:(NSString *)string
{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)hasSubstring:(NSString *)string
{
    return ([self rangeOfString:string].location != NSNotFound);
}

@end
