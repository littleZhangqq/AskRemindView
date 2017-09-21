//
//  XDYAskRemindView.h
//  XDYCar
//
//  Created by zhangqq on 2017/9/11.
//  Copyright © 2017年 xindongyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum: NSUInteger{
    AskViewShowTypeVertical = 0,// 水平展示
    AskViewShowTypeHoritical = 1// 竖直展示
}AskViewShowType;

typedef enum: NSUInteger{// 箭头所依附的方向
    ArrowDependDerectionTop = 0,
    ArrowDependDerectionLeft = 1,
    ArrowDependDerectionBottom = 2,
    ArrowDependDerectionRight = 3
}ArrowDependDerection;

@interface XDYAskRemindView : UIView



/**
 初始化方法介绍

 @param frame 可以使用masonry后传
 @param type view展示方向，可以为横，竖
 @param derection 箭头所在方向，上下左右
 @param pvalue 箭头在某一方向的位置，如在上下，pvalue为x值，若在左或右，pvalue为y值
 @param arr 内容数组，内部为字典结构
 @param title 竖直展示时显示的title
 @return
 */
-(instancetype)initWithFrame:(CGRect)frame axixWithType:(AskViewShowType)type arrowDepend:(ArrowDependDerection)derection point:(CGFloat)pvalue contentText:(NSArray <NSDictionary *> *)arr title:(NSString *)title;

@end
