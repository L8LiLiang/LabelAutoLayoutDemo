//
//  LabelLayoutView.m
//  LabelLayout
//
//  Created by 李亮 on 15/11/17.
//  Copyright © 2015年 李亮. All rights reserved.
//

#import "LabelLayoutView.h"
#import "Masonry.h"

static UIEdgeInsets const padding = {20,8,8,8};

@interface LabelLayoutView ()

@property (weak, nonatomic) UILabel *label1;
@property (weak, nonatomic) UILabel *label2;
@property (weak, nonatomic) UILabel *label3;
@property (weak, nonatomic) UILabel *label4;
@property (weak, nonatomic) UIButton *btn;

@property (strong, nonatomic) UIFont *font;


@property (nonatomic, strong) UILabel *shortLabel;
@property (nonatomic, strong) UILabel *longLabel;

@end

@implementation LabelLayoutView


+(instancetype)layoutViewWithDict:(NSDictionary *)dict
{
    LabelLayoutView *view = [[[self class ] alloc] init];
    [view makeConstraint];
    view.font = [UIFont systemFontOfSize:14];
    return view;
}

- (void)makeConstraint
{
    
    UILabel *label1 = UILabel.new;
    label1.numberOfLines = 1;
    label1.backgroundColor = [UIColor greenColor];
    label1.text = @"aaaaaa";
    label1.font = self.font;
    self.label1 = label1;
    [self addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).insets(padding);
        make.top.equalTo(self.mas_top).insets(padding);
    }];
    
    UILabel *label2 = UILabel.new;
    label2.numberOfLines = 0;
    label2.backgroundColor = [UIColor yellowColor];
    label2.text = @"kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk";
    label2.lineBreakMode = NSLineBreakByTruncatingTail;
    label2.font = self.font;
    self.label2 = label2;
    [self addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.label1.mas_left).insets(padding);
        make.top.equalTo(self.label1.mas_top);
    }];
    
    UILabel *label3 = UILabel.new;
    label3.backgroundColor = [UIColor greenColor];
    label3.text = @"aaaaaaaaaa";
    label3.font = self.font;
    self.label3 = label3;
    [self addSubview:label3];
    
    UILabel *label4 = UILabel.new;
    label4.numberOfLines = 0;
    label4.backgroundColor = [UIColor yellowColor];
    label4.lineBreakMode = NSLineBreakByTruncatingTail;
    label4.text = @"kkkkkkkkkkkkkkkkkkk";
    label4.font = self.font;
    self.label4 = label4;
    [self addSubview:label4];
    
    
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label4.mas_top);
        make.left.equalTo(self.label1.mas_left);
    }];
    

    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label2.mas_bottom).insets(padding);
        make.left.equalTo(self.label3.mas_right).insets(padding);
    }];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor redColor]];
    [self addSubview:btn];
    self.btn = btn;
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).insets(padding);
        make.centerY.equalTo(self.label2.mas_centerY);
        make.width.equalTo(@80);
        make.height.equalTo(@80);
    }];
    
    
    
    /*
    self.shortLabel = UILabel.new;
    self.shortLabel.numberOfLines = 1;
    self.shortLabel.textColor = [UIColor purpleColor];
    self.shortLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.shortLabel.text = @"Bacon";
    [self addSubview:self.shortLabel];
    
    self.longLabel = UILabel.new;
    self.longLabel.numberOfLines = 0;
    self.longLabel.textColor = [UIColor darkGrayColor];
    self.longLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    self.longLabel.text = @"Bacon ipsum dolor sit amet spare ribs fatback kielbasa salami, tri-tip jowl pastrami flank short loin rump sirloin. Tenderloin frankfurter chicken biltong rump chuck filet mignon pork t-bone flank ham hock.";
    [self addSubview:self.longLabel];
    
    [self.longLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).insets(padding);
        make.top.equalTo(self.mas_top).insets(padding);
    }];
    
    [self.shortLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.longLabel.mas_centerY);
        make.right.equalTo(self.mas_right).insets(padding);
    }];
 */
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.label1.preferredMaxLayoutWidth = [self.label1.text boundingRectWithSize:CGSizeMake(0, self.label1.bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size.width;
    
    
    [super layoutSubviews];
    
    CGFloat btnLeft = CGRectGetMinX(self.btn.frame);
    CGFloat labelRight = CGRectGetMaxX(self.label1.frame);
    CGFloat maxWidth = btnLeft - labelRight - padding.left - padding.right;
    self.label2.preferredMaxLayoutWidth = maxWidth;
    CGRect frame = self.label2.frame;
    frame.origin.x = labelRight + padding.right;
    self.label2.frame = frame;

    
    [super layoutSubviews];
    
    self.label3.preferredMaxLayoutWidth = [self.label3.text boundingRectWithSize:CGSizeMake(0, self.label3.bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size.width;
    
    
    [super layoutSubviews];
    
    btnLeft = CGRectGetMinX(self.btn.frame);
    labelRight = CGRectGetMaxX(self.label3.frame);
    maxWidth = btnLeft - labelRight - padding.left - padding.right;
    self.label4.preferredMaxLayoutWidth = maxWidth;
    frame = self.label4.frame;
    frame.origin.x = labelRight + padding.right;
    self.label4.frame = frame;
    
    
    [super layoutSubviews];

    frame = self.frame;
    frame.size.height = CGRectGetMaxY(self.label4.frame) + padding.bottom;
    self.frame = frame;
    
    NSLog(@"%@",NSStringFromCGRect(self.btn.frame));
    NSLog(@"%@",NSStringFromCGRect(self.label1.frame));
    NSLog(@"%@",NSStringFromCGRect(self.label3.frame));
    NSLog(@"%@",NSStringFromCGRect(self.label4.frame));

}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//    
//    // for multiline UILabel's you need set the preferredMaxLayoutWidth
//    // you need to do this after [super layoutSubviews] as the frames will have a value from Auto Layout at this point
//    
//    // stay tuned for new easier way todo this coming soon to Masonry
//    
//    NSLog(@"%@",NSStringFromCGRect(self.shortLabel.frame));
//    NSLog(@"%@",NSStringFromCGRect(self.longLabel.frame));
//    
//    CGFloat width = CGRectGetMinX(self.shortLabel.frame) - padding.left;
//    width -= CGRectGetMinX(self.longLabel.frame);
//    self.longLabel.preferredMaxLayoutWidth = width;
//    
//    // need to layoutSubviews again as frames need to recalculated with preferredLayoutWidth
//    [super layoutSubviews];
//}
//

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
