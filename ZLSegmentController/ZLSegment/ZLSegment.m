//
//  ZLSegment.m
//  ZLSegmentController
//
//  Created by Mac on 15/12/28.
//  Copyright © 2015年 zhanglei. All rights reserved.
//

#import "ZLSegment.h"

@implementation ZLSegment

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        frontArray = [NSMutableArray array];
        backArray = [NSMutableArray array];
    }
    return self;
}

-(void)setWithTitles:(NSMutableArray *)ts{
    titles = ts;
    perWidth = self.frame.size.width/(titles.count);
    perHeight = self.frame.size.height;
    [self creatBottomTitle];
    [self creatTopTitle];
    [self creatButton];
}

-(void)creatBottomTitle{
    bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, perHeight)];
    [self addSubview:bottomView];
    int t_idx = 0;
    for (NSString * title in titles) {
        UILabel * lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(t_idx*perWidth, 0, perWidth, perHeight)];
        [lblTitle setText:title];
        [lblTitle setTextColor:[UIColor blackColor]];
        [lblTitle setTextAlignment:NSTextAlignmentCenter];
        [bottomView addSubview:lblTitle];
        [backArray addObject:lblTitle];
        t_idx++;
    }
}

-(void)creatTopTitle{
    topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, perWidth, perHeight)];
    [topView setClipsToBounds:YES];
    [self addSubview:topView];
    
    showView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, perHeight)];
    [topView addSubview:showView];
    int t_idx = 0;
    for (NSString * title in titles) {
        UILabel * lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(t_idx*perWidth, 0, perWidth, perHeight)];
        [lblTitle setTextColor:[UIColor whiteColor]];
        [lblTitle setTextAlignment:NSTextAlignmentCenter];
        [lblTitle setText:title];
        [showView addSubview:lblTitle];
        [frontArray addObject:lblTitle];
        t_idx++;
    }
}

-(void)creatButton{
    int b_idx = 0;
    for (int i = 0;i < titles.count; i++) {
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(b_idx*perWidth, 0, perWidth, perHeight)];
        [button addTarget:self action:@selector(buttonSelect:) forControlEvents:UIControlEventTouchUpInside];
        [button setTag:b_idx];
        [self addSubview:button];
        b_idx++;
    }
}

-(void)setTitleFrontColor:(UIColor *)color{
    fColor = color;
    for (UILabel * label in frontArray) {
        [label setTextColor:fColor];
    }
}

-(void)setTitleBackColor:(UIColor *)color{
    bColor = color;
    for (UILabel * label in backArray) {
        [label setTextColor:bColor];
    }
}

-(void)setButtonColor:(UIColor *)color{
    btnColor = color;
    [showView setBackgroundColor:btnColor];
}

-(void)setButtonRadius:(NSInteger)r{
    radius = r;
    [showView.layer setMasksToBounds:YES];
    [showView.layer setCornerRadius:radius];
}

-(void)buttonSelect:(id)sender{
    UIButton * btn = (UIButton *)sender;
    CGRect bRect = [self getRectByIndex:-btn.tag];
    [UIView animateWithDuration:.2 animations:^{
        [topView setFrame:btn.frame];
        [showView setFrame:bRect];
    } completion:^(BOOL finished) {
        if (_delegate && [_delegate respondsToSelector:@selector(zlSegmentSelect:)]) {
            [_delegate zlSegmentSelect:btn.tag];
        }
    }];
}

-(CGRect)getRectByIndex:(NSInteger)idx{
    return  CGRectMake(idx*perWidth, 0, self.frame.size.width, perHeight);
}
@end
