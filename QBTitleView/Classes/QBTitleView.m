//
//  QBTitleView.m
//  QBTitleViewDemo
//
//  Created by questbeat on 2012/12/23.
//  Copyright (c) 2012年 Katsuma Tanaka. All rights reserved.
//

#import "QBTitleView.h"

@interface QBTitleView ()

@property (nonatomic, retain) UIImageView *imageView;
@property (nonatomic, retain) UILabel *titleLabel;

@end

@implementation QBTitleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self) {
        // ボタン
        UIButton *baseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        baseButton.frame = self.bounds;
        
        [baseButton addTarget:self action:@selector(touchedDown:) forControlEvents:UIControlEventTouchDown];
        [baseButton addTarget:self action:@selector(touchedUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [baseButton addTarget:self action:@selector(touchedUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
        
        [self addSubview:baseButton];
        
        // 画像
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        imageView.clipsToBounds = YES;
        imageView.layer.cornerRadius = 4.0;
        imageView.layer.borderWidth = 1.0;
        imageView.layer.masksToBounds = YES;
        imageView.layer.borderColor = [[UIColor colorWithWhite:0.35 alpha:1.0] CGColor];
        
        [baseButton addSubview:imageView];
        self.imageView = imageView;
        [imageView release];
        
        // ラベル
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        titleLabel.font = [UIFont boldSystemFontOfSize:20];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.highlightedTextColor = [UIColor colorWithWhite:0.7 alpha:1.0];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        titleLabel.shadowOffset = CGSizeMake(0, -1);
        titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        
        [baseButton addSubview:titleLabel];
        self.titleLabel = titleLabel;
        [titleLabel release];
        
        [self redraw];
    }
    
    return self;
}

- (void)dealloc
{
    [_imageView release];
    [_titleLabel release];
    
    [super dealloc];
}

- (void)setImage:(UIImage *)image
{
    self.imageView.image = image;
}

- (UIImage *)image
{
    return self.imageView.image;
}

- (void)setHighlightedImage:(UIImage *)highlightedImage
{
    self.imageView.highlightedImage = highlightedImage;
}

- (UIImage *)highlightedImage
{
    return self.imageView.highlightedImage;
}

- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
    
    [self redraw];
}

- (NSString *)title
{
    return self.titleLabel.text;
}

- (void)setHighlighted:(BOOL)highlighted
{
    self.imageView.highlighted = highlighted;
    self.titleLabel.highlighted = highlighted;
}


#pragma mark - Instance Method

- (void)redraw
{
    CGSize imageViewSize = CGSizeMake(30, 30);
    CGFloat margin = 6;
    
    CGSize actualTitleSize = [self.title sizeWithFont:[UIFont boldSystemFontOfSize:20] forWidth:self.bounds.size.width lineBreakMode:NSLineBreakByTruncatingTail];
    
    CGRect titleLabelFrame;
    CGRect imageViewFrame;
    
    if((self.bounds.size.width - actualTitleSize.width) / 2 < (imageViewSize.width + margin)) {
        titleLabelFrame = CGRectMake(imageViewSize.width + margin, 0, MIN(self.bounds.size.width - imageViewSize.width, actualTitleSize.width), self.bounds.size.height);
        imageViewFrame = CGRectMake(0, (self.bounds.size.height - imageViewSize.height) / 2, imageViewSize.width, imageViewSize.height);
    } else {
        titleLabelFrame = CGRectMake((self.bounds.size.width - actualTitleSize.width) / 2, 0, actualTitleSize.width, self.bounds.size.height);
        imageViewFrame = CGRectMake(titleLabelFrame.origin.x - (imageViewSize.width + margin), (self.bounds.size.height - imageViewSize.height) / 2, imageViewSize.width, imageViewSize.height);
    }
    
    self.titleLabel.frame = titleLabelFrame;
    self.imageView.frame = imageViewFrame;
}

- (void)touchedDown:(id)sender
{
    self.highlighted = YES;
    
    if([self.delegate respondsToSelector:@selector(titleViewDidTouchDown:)]) {
        [self.delegate titleViewDidTouchDown:self];
    }
}

- (void)touchedUpInside:(id)sender
{
    self.highlighted = NO;
    
    if([self.delegate respondsToSelector:@selector(titleViewDidTouchUpInside:)]) {
        [self.delegate titleViewDidTouchUpInside:self];
    }
}

- (void)touchedUpOutside:(id)sender
{
    self.highlighted = NO;
    
    if([self.delegate respondsToSelector:@selector(titleViewDidTouchUpOutside:)]) {
        [self.delegate titleViewDidTouchUpOutside:self];
    }
}

@end
