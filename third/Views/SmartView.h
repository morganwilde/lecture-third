//
//  SmartView.h
//  third
//
//  Created by Morgan Wilde on 23/05/2014.
//  Copyright (c) 2014 morganwilde. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, alignmentHorizontal) {
    LEFT,
    CENTER,
    RIGHT
};
typedef NS_ENUM(NSInteger, alignmentVertical) {
    TOP,
    MIDDLE,
    BOTTOM
};

@interface SmartView : UIView

@property (strong, nonatomic) UIView *parent;
@property (strong, nonatomic) NSMutableDictionary *style;

- (id)initWithStyle:(NSDictionary *)style inParent:(UIView *)parent;
- (void)realignToSiblings;
- (void)changeStyle:(NSString *)key with:(id)value;
+ (CGFloat)parseFloat:(id)input relativeTo:(CGFloat)size;
+ (CGRect)frameFromStyle:(NSDictionary *)style inParent:(UIView *)parent;

@end
