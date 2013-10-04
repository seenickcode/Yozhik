//  UIView+NB.m
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

#import "UIView+YZ.h"

@implementation UIView (YZ)

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