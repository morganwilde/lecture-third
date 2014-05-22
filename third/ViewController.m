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

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Customize a SmartView
    SmartView *smartView = [[SmartView alloc] initWithStyle:@{@"top": @0,
                                                              @"left": @0,
                                                              @"width": @"50%",
                                                              @"height": @"50%"}
                                                   inParent:self.view];
    // Add it to the view hierarchy
    [self.view addSubview:smartView];
}

@end
