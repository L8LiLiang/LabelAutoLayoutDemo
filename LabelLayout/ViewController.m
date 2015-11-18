//
//  ViewController.m
//  LabelLayout
//
//  Created by 李亮 on 15/11/17.
//  Copyright © 2015年 李亮. All rights reserved.
//

#import "ViewController.h"
#import "LabelLayoutView.h"
#import "Masonry.h"
#import "L8ScrollView.h"

@interface ViewController ()
@property (weak, nonatomic) LabelLayoutView *labelView;
@property (weak, nonatomic) L8ScrollView *scrollView;
@end

@implementation ViewController

//-(void)loadView
//{
//    self.view = [LabelLayoutView layoutViewWithDict:nil];
//    self.view.backgroundColor = [UIColor grayColor];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LabelLayoutView *labelView = [LabelLayoutView layoutViewWithDict:nil];
    [self.view addSubview:labelView];
    labelView.backgroundColor = [UIColor grayColor];
//    labelView.frame = CGRectMake(0, 0, 400, 300);
    self.labelView = labelView;
    
    [labelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(10);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.equalTo(@160);
    }];
    [labelView setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [labelView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    
    L8ScrollView *scrollView = [[L8ScrollView alloc] init];
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    scrollView.backgroundColor = [UIColor brownColor];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
        make.top.equalTo(labelView.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateViewConstraints
{
    [super updateViewConstraints];
    [self.labelView mas_updateConstraints:^(MASConstraintMaker *make) {
        CGFloat currentHeight = self.labelView.frame.size.height;
        NSNumber *height = [NSNumber numberWithFloat:currentHeight];
        make.height.equalTo(height);
    }];
}

//-(void)viewDidLayoutSubviews
//{
//    
////    [self.labelView mas_updateConstraints:^(MASConstraintMaker *make) {
////        CGFloat currentHeight = self.labelView.frame.size.height;
////        NSNumber *height = [NSNumber numberWithFloat:currentHeight];
////        make.height.equalTo(height);
////    }];
//    [self.labelView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top).offset(10);
//        make.left.equalTo(self.view.mas_left);
//        make.right.equalTo(self.view.mas_right);
//        CGFloat currentHeight = self.labelView.frame.size.height;
//        NSNumber *height = [NSNumber numberWithFloat:currentHeight];
//        make.height.equalTo(height);
//    }];
//    [self.view setNeedsLayout];
//    [self.view layoutIfNeeded];
//}

//#ifdef __IPHONE_7_0
//- (UIRectEdge)edgesForExtendedLayout {
//    return UIRectEdgeNone;
//}
//#endif


//-(void)viewDidLayoutSubviews
//{
//    CGSize size = [self.labelView systemLayoutSizeFittingSize:UILayoutFittingExpandedSize];
//    CGRect frame = self.labelView.frame;
//    frame.size.width = size.width;
//    frame.size.height = size.height;
//    self.labelView.frame = frame;
//}
@end
