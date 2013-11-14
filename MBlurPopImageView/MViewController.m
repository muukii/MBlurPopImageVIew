//
//  MViewController.m
//  MBlurPopImageView
//
//  Created by Muukii on 2013/11/14.
//  Copyright (c) 2013年 Muukii. All rights reserved.
//

#import "MViewController.h"
#import "MBlurPopImageView.h"
@interface MViewController ()

@end

@implementation MViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)show:(id)sender {
    MBlurPopImageView *view = [MBlurPopImageView blurPopImageView:nil];
    [view show];
}

@end
