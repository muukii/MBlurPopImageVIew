//
//  MBlurPopImageView.m
//  MBlurPopImageView
//
//  Created by Muukii on 2013/11/14.
//  Copyright (c) 2013年 Muukii. All rights reserved.
//

#import "MBlurPopImageView.h"
#import "UIView+blur.h"

#define ANIMATION_DURATION 0.2
@implementation MBlurPopImageView
{
    TapHandler _tapHandler;
    UIImageView *_blurImageView;
}
+ (instancetype)blurPopImageView:(UIImage *)image
{
    return [self blurPopImageView:image tapHandler:nil];
}

+ (instancetype)blurPopImageView:(UIImage *)image tapHandler:(TapHandler)tapHandler
{
    MBlurPopImageView *blurPopImageView = [[self alloc] initWithImage:image tapHandler:tapHandler];
    return blurPopImageView;
}

- (instancetype)initWithImage:(UIImage *)image
{
    return [self initWithImage:image tapHandler:nil];
}

- (instancetype)initWithImage:(UIImage *)image tapHandler:(TapHandler)tapHandler
{
    self = [self init];
    if (self) {
        self.image = image;
        [self setTapHandler:tapHandler];
    }
    return self;
}

- (id)init
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.contentMode = UIViewContentModeCenter;
        _blurImageView = [[UIImageView alloc] initWithFrame:self.bounds];


        [self setGesture];
        [self addSubview:_blurImageView];
        [self addSubview:_imageView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    return [self init];
}

- (void)setGesture
{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureHandler:)];
    [self addGestureRecognizer:tapGesture];

}
- (void)tapGestureHandler:(UITapGestureRecognizer *)gesture
{
    if (_tapHandler) {
        _tapHandler();
    }
    [self dismiss];
}
- (void)setTapHandler:(TapHandler)tapHandler
{
    _tapHandler = tapHandler;
}
- (TapHandler)tapHandler
{
    return _tapHandler;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    _imageView.image = image;
}

- (void)show
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    self.alpha = 0;
    _blurImageView.image = [self.superview blurredSnapshot];

    [UIView animateWithDuration:ANIMATION_DURATION delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {

    }];
}

- (void)dismiss
{
    [UIView animateWithDuration:ANIMATION_DURATION delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
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
