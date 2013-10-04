//
//  NSString+M3.h
//  
//
//  Created by Nick Manning on 10/1/13.
//
//

#import <Foundation/Foundation.h>

@interface NSString (M3)

BOOL NSStringEmpty(id value);
+ (id)stringIfNil:(id)object;
+ (NSString *)trim:(NSString *)string;
- (BOOL)hasSubstring:(NSString *)string;

@end
