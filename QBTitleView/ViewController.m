//
//  ViewController.m
//  QBTitleView
//
//  Created by questbeat on 2012/12/27.
//  Copyright (c) 2012年 Katsuma Tanaka. All rights reserved.
//

#import "ViewController.h"

// Categories
#import "UIImage+tintedImage.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // タイトルビューをセット
    QBTitleView *titleView = [[QBTitleView alloc] initWithFrame:CGRectMake(0, 0, 170, 44)];
    titleView.delegate = self;
    titleView.image = [UIImage imageNamed:@"profile.png"];
    titleView.highlightedImage = [[UIImage imageNamed:@"profile.png"] tintedImageUsingColor:[UIColor colorWithWhite:0.2 alpha:0.5]];
    titleView.title = @"QBTitleView";
    
    self.navigationItem.titleView = titleView;
    
    self.titleView = titleView;
    [titleView release];
}

- (void)dealloc {
    [_textField release];
    [_titleView release];
    
    [super dealloc];
}


#pragma mark -

- (IBAction)switchProfileImage:(id)sender {
    UISwitch *profileImageSwitch = (UISwitch *)sender;
    
    if(profileImageSwitch.on) {
        self.titleView.image = [UIImage imageNamed:@"profile.png"];
        self.titleView.highlightedImage = [[UIImage imageNamed:@"profile.png"] tintedImageUsingColor:[UIColor colorWithWhite:0.2 alpha:0.5]];
    } else {
        self.titleView.image = nil;
        self.titleView.highlightedImage = nil;
    }
}


#pragma mark - QBTitleViewDelegate

- (void)titleViewDidTouchUpInside:(QBTitleView *)titleView
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
