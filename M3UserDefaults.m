//
//  M3UserDefaults.m
//  
//
//  Created by Nick Manning on 10/1/13.
//
//

#import "M3UserDefaults.h"
#import <Foundation/NSObjCRuntime.h>
#import <objc/runtime.h>


@implementation M3UserDefaults

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
