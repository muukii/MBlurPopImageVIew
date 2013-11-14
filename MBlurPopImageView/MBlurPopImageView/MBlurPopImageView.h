//
//  MBlurPopImageView.h
//  MBlurPopImageView
//
//  Created by Muukii on 2013/11/14.
//  Copyright (c) 2013年 Muukii. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TapHandler)();

@interface MBlurPopImageView : UIView
@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, copy) UIImage *image;

+ (instancetype)blurPopImageView:(UIImage *)image;
+ (instancetype)blurPopImageView:(UIImage *)image tapHandler:(TapHandler)tapHandler;
- (instancetype)initWithImage:(UIImage *)image;
- (instancetype)initWithImage:(UIImage *)image tapHandler:(TapHandler)tapHandler;


- (void)setTapHandler:(TapHandler)tapHandler;
- (TapHandler)tapHandler;

- (void)show;
@end
