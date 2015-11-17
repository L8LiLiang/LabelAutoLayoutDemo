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

@interface ViewController ()
@property (weak, nonatomic) LabelLayoutView *labelView;
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
    //labelView.frame = CGRectMake(0, 0, 400, 300);
    self.labelView = labelView;
    
    [labelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(10);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
