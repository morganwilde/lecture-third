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
    CGRect viewFrame = [SmartView frameFromStyle:style inParent:parent];
    self = [super initWithFrame:viewFrame];
    if (self) {
        self.parent = parent;
        self.style = [NSMutableDictionary dictionaryWithDictionary:style];
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}
- (void)changeStyle:(NSString *)key with:(id)value
{
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        self.style[key] = value;
        self.frame = [SmartView frameFromStyle:self.style inParent:self.parent];
        [self setNeedsDisplay];
    } else {
        NSLog(@"value is not of valid type.");
    }
}
+ (CGFloat)parseFloat:(id)input relativeTo:(CGFloat)size
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
+ (CGRect)frameFromStyle:(NSDictionary *)style inParent:(UIView *)parent
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
        x = [SmartView parseFloat:style[@"left"] relativeTo:widthParent];
    }
    if ([style objectForKey:@"top"]) {
        y = [SmartView parseFloat:style[@"top"] relativeTo:heightParent];
    }
    // Size
    if ([style objectForKey:@"width"]) {
        width = [SmartView parseFloat:style[@"width"] relativeTo:widthParent];
    }
    if ([style objectForKey:@"height"]) {
        height = [SmartView parseFloat:style[@"height"] relativeTo:heightParent];
    }
    // Alignment
    if ([style objectForKey:@"align-horizontally"]) {
        switch ([style[@"align-horizontally"] intValue]) {
            case LEFT:
                x = 0;
                break;
            case CENTER:
                x = widthParent/2 - width/2;
                break;
            case RIGHT:
                x = widthParent - width;
                break;
            default:
                break;
        }
    }
    if ([style objectForKey:@"align-vertically"]) {
        switch ([style[@"align-vertically"] intValue]) {
            case TOP:
                y = 0;
                break;
            case MIDDLE:
                y = heightParent/2 - height/2;
                break;
            case BOTTOM:
                y = heightParent - height;
                break;
            default:
                break;
        }
    }
    // Init the view
    return CGRectMake(x, y, width, height);
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
