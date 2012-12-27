//
//  QBTitleView.h
//  QBTitleViewDemo
//
//  Created by questbeat on 2012/12/23.
//  Copyright (c) 2012年 Katsuma Tanaka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@class QBTitleView;

@protocol QBTitleViewDelegate <NSObject>

@optional
- (void)titleViewDidTouchDown:(QBTitleView *)titleView;
- (void)titleViewDidTouchUp:(QBTitleView *)titleView;
- (void)titleViewDidTouchUpInside:(QBTitleView *)titleView;
- (void)titleViewDidTouchUpOutside:(QBTitleView *)titleView;

@end

@interface QBTitleView : UIView

@property (nonatomic, assign) id<QBTitleViewDelegate> delegate;
@property (nonatomic, assign) BOOL highlighted;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, retain) UIImage *image;

@end
