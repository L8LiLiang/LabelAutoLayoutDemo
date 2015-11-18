//
//  L8ScrollView.m
//  LabelLayout
//
//  Created by 李亮 on 15/11/18.
//  Copyright © 2015年 李亮. All rights reserved.
//

#import "L8ScrollView.h"
#import "LabelLayoutView.h"
#import "Masonry.h"

@interface L8ScrollView ()

@property (strong,nonatomic) NSMutableArray *labelViews;
@property (strong, nonatomic) MASConstraint *constraint;
@end

@implementation L8ScrollView

- (instancetype)init
{
    if (self = [super init]) {
        self.labelViews = [NSMutableArray new];
        [self makeContentView];
    }
    return self;
}


- (void)makeContentView
{
    for (int i = 0; i < 1; i++) {
        if (self.constraint) {
            [self.constraint uninstall];
        }
        
        LabelLayoutView *view = [LabelLayoutView layoutViewWithDict:nil];
        [self addSubview:view];
        LabelLayoutView *lastView = self.labelViews.lastObject;
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            if (lastView) {
                make.top.equalTo(lastView.mas_bottom).offset(16);
            }else {
                make.top.equalTo(self.mas_top).offset(16);
            }
            make.left.equalTo(self.mas_left).offset(8);
            make.right.equalTo(self.mas_right).offset(-8);
            make.width.equalTo(@100);
            self.constraint = make.bottom.equalTo(self.mas_bottom).offset(-16);
        }];
        [self.labelViews addObject:view];

    }
}

-(CGFloat)labelViewWidth
{
    NSLog(@"%@",NSStringFromCGRect(self.bounds));
    return self.frame.size.width;
}

//-(void)updateConstraints
//{
//    
//    for (LabelLayoutView *view in self.labelViews) {
//        [view mas_updateConstraints:^(MASConstraintMaker *make) {
//            CGFloat width = self.frame.size.width;
//            width = [self labelViewWidth];
//            NSNumber *w = [NSNumber numberWithFloat:width];
//            make.width.equalTo(w);
//        }];
//    }
//    
//    [super updateConstraints];
//}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    for (LabelLayoutView *view in self.labelViews) {
        CGRect frame = view.frame;
        NSLog(@"1 %@",NSStringFromCGRect(frame));
        
        frame.size.width = self.frame.size.width;
        view.frame = frame;
        NSLog(@"2 %@",NSStringFromCGRect(view.frame));
        [view setNeedsLayout];
        [view layoutIfNeeded];
        NSLog(@"3 %@",NSStringFromCGRect(view.frame));

        
    }
    
    
}

@end
