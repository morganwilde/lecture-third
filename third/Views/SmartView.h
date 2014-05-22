//
//  SmartView.h
//  third
//
//  Created by Morgan Wilde on 23/05/2014.
//  Copyright (c) 2014 morganwilde. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SmartView : UIView

@property (strong, nonatomic) UIView *parent;
@property (strong, nonatomic) NSMutableDictionary *style;

- (id)initWithStyle:(NSDictionary *)style inParent:(UIView *)parent;
- (CGFloat)parseFloat:(id)input relativeTo:(CGFloat)size;

@end
