//
//  UIImage+tintedImage.m
//  QBTitleView
//
//  Created by Katsuma Tanaka on 2013/01/17.
//  Copyright (c) 2013年 Katsuma Tanaka. All rights reserved.
//

#import "UIImage+tintedImage.h"

@implementation UIImage (tintedImage)

- (UIImage *)tintedImageUsingColor:(UIColor *)color {
    UIGraphicsBeginImageContext(self.size);
    
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    [self drawInRect:rect];
    
    [color set];
    UIRectFillUsingBlendMode(rect, kCGBlendModeSourceAtop);
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return tintedImage;
}

@end
