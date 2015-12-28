//
//  ZLSegment.h
//  ZLSegmentController
//
//  Created by Mac on 15/12/28.
//  Copyright © 2015年 zhanglei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLSegment : UIView
{
    NSMutableArray * titles;
    UIColor * fColor;
    UIColor * bColor;
    UIColor * btnColor;
    NSInteger radius;
    //底层承接底层Label的view
    UIView * bottomView;
    //顶层承接Label的view
    UIView * topView;
    UIView * showView;
    NSMutableArray * frontArray;
    NSMutableArray * backArray;
    float perWidth;
    float perHeight;
}

@property (nonatomic,assign) id delegate;
/**
 *  设置按钮标题
 *
 *  @param titles 标题列表
 */
-(void)setWithTitles:(NSMutableArray *)titles;
/**
 *  设置前置标题颜色
 *
 *  @param fColor 前置颜色
 */
-(void)setTitleFrontColor:(UIColor *)fColor;
/**
 *  设置后置标题颜色
 *
 *  @param bColor 后置颜色
 */
-(void)setTitleBackColor:(UIColor *)bColor;
/**
 *  设置按钮的背景颜色
 *
 *  @param btnColor 按钮颜色
 */
-(void)setButtonColor:(UIColor *)btnColor;
/**
 *  设置按钮的圆角弧度
 *
 *  @param radius 要设置的按钮圆角弧度
 */
-(void)setButtonRadius:(NSInteger)radius;
@end
/**
 *  按钮点选之后的处理回调方法
 */
@protocol ZLSegmentSelectDelegate <NSObject>

-(void)zlSegmentSelect:(NSInteger)selectIndex;

@end