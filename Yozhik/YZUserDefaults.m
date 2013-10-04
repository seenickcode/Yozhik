//  YZUserDefaults.m
//
// Copyright (c) 2013 Nicholas Manning
//
// This code is distributed under the terms and conditions of the MIT license. 
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "YZUserDefaults.h"
#import <Foundation/NSObjCRuntime.h>
#import <objc/runtime.h>


@implementation YZUserDefaults

- (id)init {
    self = [super init];
    if (self) {
        [self refresh];
        
        // observe when we change instance values, and write latest to default file
        for (NSString *key in [self propertyNames]) {
            [self addObserver:self forKeyPath:key options:NSKeyValueObservingOptionNew context:nil];
        }
    }
    return self;
}

#pragma mark - Private

- (void)refresh
{
    // copies values from user defaults to this class instance
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    for (NSString *key in [self propertyNames])
    {
        id value = [prefs objectForKey:key];
        [self setValue:value forKey:key];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    // observe when we change instance values, and write latest to default file
    
    id value = [change objectForKey:@"new"];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    if ([value isKindOfClass:[NSNull class]]) {
        [prefs removeObjectForKey:keyPath];
    } else {
        [prefs setObject:value forKey:keyPath];
    }
    [prefs synchronize];
}

- (NSArray *)propertyNames
{
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &propertyCount);
    
    NSMutableArray *propertyNames = [NSMutableArray array];
    for (unsigned int i = 0; i < propertyCount; ++i) {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        [propertyNames addObject:[NSString stringWithUTF8String:name]];
    }
    free(properties);
    
    return propertyNames;
}

@end
