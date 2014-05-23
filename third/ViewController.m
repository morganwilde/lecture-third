//
//  ViewController.m
//  third
//
//  Created by Morgan Wilde on 23/05/2014.
//  Copyright (c) 2014 morganwilde. All rights reserved.
//

#import "ViewController.h"
#import "Views/SmartView.h"

@interface ViewController ()

@property (strong, nonatomic) SmartView *test;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Customize a SmartView
    SmartView *smartView = [[SmartView alloc] initWithStyle:@{@"top": @"50%",
                                                              @"left": @"50%",
                                                              @"width": @"50%",
                                                              @"height": @"50%",
                                                              @"align-vertically": [NSNumber numberWithInt:MIDDLE],
                                                              @"align-horizontally": [NSNumber numberWithInt:CENTER]}
                                                   inParent:self.view];
    self.test = smartView;
    // Add it to the view hierarchy
    [self.view addSubview:smartView];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.test changeStyle:@"align-vertically" with:[NSNumber numberWithInt:BOTTOM]];
    [self.test changeStyle:@"width" with:@"100%"];
}

@end
