/*
 Copyright (c) 2013 Katsuma Tanaka
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "QBTitleView.h"

@interface QBTitleView ()

- (void)touchedDown:(id)sender;
- (void)touchedUpInside:(id)sender;
- (void)touchedUpOutside:(id)sender;

@end

@implementation QBTitleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self) {
        // 初期化
        self.margin = 6;
        self.imageViewSize = CGSizeMake(30, 30);
        
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
        
        [self update];
    }
    
    return self;
}

- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
    
    [self update];
}

- (NSString *)title
{
    return self.titleLabel.text;
}

- (void)setImage:(UIImage *)image
{
    self.imageView.image = image;
    
    [self update];
}

- (UIImage *)image
{
    return self.imageView.image;
}

- (void)setHighlightedImage:(UIImage *)highlightedImage
{
    self.imageView.highlightedImage = highlightedImage;
    
    [self update];
}

- (UIImage *)highlightedImage
{
    return self.imageView.highlightedImage;
}

- (void)setHighlighted:(BOOL)highlighted
{
    self.imageView.highlighted = highlighted;
    self.titleLabel.highlighted = highlighted;
}

- (void)dealloc
{
    [_imageView release];
    [_titleLabel release];
    
    [super dealloc];
}


#pragma mark -

- (void)update
{
    CGFloat margin = self.margin;
    CGSize imageViewSize = (self.image && self.highlightedImage) ? self.imageViewSize : CGSizeZero;
    
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
