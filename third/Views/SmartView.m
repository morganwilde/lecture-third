//
//  SmartView.m
//  third
//
//  Created by Morgan Wilde on 23/05/2014.
//  Copyright (c) 2014 morganwilde. All rights reserved.
//

#import "SmartView.h"

@implementation SmartView

- (id)initWithStyle:(NSDictionary *)style inParent:(UIView *)parent
{
    // Parent frame details
    CGFloat widthParent     = parent.frame.size.width;
    CGFloat heightParent    = parent.frame.size.height;
    // Frame attributes
    CGFloat x       = 0;
    CGFloat y       = 0;
    CGFloat width   = 0;
    CGFloat height  = 0;
    // Check for properties that define the frame
    // Position
    if ([style objectForKey:@"left"]) {
        x = [style[@"left"] floatValue];
    }
    if ([style objectForKey:@"top"]) {
        y = [style[@"top"] floatValue];
    }
    // Size
    if ([style objectForKey:@"width"]) {
        if ([style[@"width"] isKindOfClass:[NSString class]]) {
            NSString *string = (NSString *)style[@"width"];
            if ([string rangeOfString:@"%"].location != NSNotFound) {
                CGFloat percent = [string floatValue];
                width = widthParent * percent/100;
            } else {
                width = [style[@"width"] floatValue];
            }
        } else if ([style[@"width"] isKindOfClass:[NSNumber class]]) {
            width = [style[@"width"] floatValue];
        }
    }
    if ([style objectForKey:@"height"]) {
        height = [self parseFloat:style[@"height"] relativeTo:heightParent];
    }
    // Init the view
    CGRect viewFrame = CGRectMake(x, y, width, height);
    self = [super initWithFrame:viewFrame];
    if (self) {
        self.parent = parent;
        self.style = [NSMutableDictionary dictionaryWithDictionary:style];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}
- (CGFloat)parseFloat:(id)input relativeTo:(CGFloat)size
{
    CGFloat value = 0.0f;
    if ([input isKindOfClass:[NSString class]]) {
        if ([input rangeOfString:@"%"].location != NSNotFound) {
            value = size * [input floatValue]/100;
        }
    } else if ([input respondsToSelector:@selector(floatValue)]) {
        value = [input floatValue];
    }
    return value;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
