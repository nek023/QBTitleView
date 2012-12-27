//
//  ViewController.m
//  QBTitleView
//
//  Created by questbeat on 2012/12/27.
//  Copyright (c) 2012年 Katsuma Tanaka. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // タイトルビューをセット
    QBTitleView *titleView = [[QBTitleView alloc] initWithFrame:CGRectMake(0, 0, 170, 44)];
    titleView.delegate = self;
    titleView.image = [UIImage imageNamed:@"profile.png"];
    titleView.title = @"Title";
    
    self.navigationItem.titleView = titleView;
    
    self.titleView = titleView;
    [titleView release];
}

- (void)dealloc {
    [_textField release];
    [_titleView release];
    
    [super dealloc];
}


#pragma mark - QBTitleViewDelegate

- (void)titleViewDidTouchUp:(QBTitleView *)titleView
{
    NSLog(@"Pushed");
}


#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    self.titleView.title = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    return YES;
}

@end
