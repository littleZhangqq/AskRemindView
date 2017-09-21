//
//  XDYAskRemindView.m
//  XDYCar
//
//  Created by zhangqq on 2017/9/11.
//  Copyright © 2017年 xindongyuan. All rights reserved.
//

#import "XDYAskRemindView.h"

@interface XDYAskRemindView()

@property (nonatomic, unsafe_unretained) AskViewShowType askType;
@property (nonatomic, unsafe_unretained) ArrowDependDerection arrowDerection;
@property (nonatomic, unsafe_unretained) CGFloat arrowLocate;
@property (nonatomic, strong) NSArray <NSDictionary *> *contentArray;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, unsafe_unretained) CGPoint arrowP;

@end

@implementation XDYAskRemindView

-(instancetype)initWithFrame:(CGRect)frame axixWithType:(AskViewShowType)type arrowDepend:(ArrowDependDerection)derection point:(CGFloat)pvalue contentText:(NSArray <NSDictionary *> *)arr title:(NSString *)title{
    if (self = [super initWithFrame:frame]) {
        self.askType = type;
        self.arrowDerection = derection;
        self.arrowLocate = pvalue;
        self.title = title;
        if (arr.count > 0) {
            self.contentArray = [NSArray arrayWithArray:arr];
        }else{
            NSDictionary *dic = @{@"key":@"content",@"value":@""};
            self.contentArray = [NSArray arrayWithObject:dic];
        }
        [self initViews];
    }
    return self;
}

- (instancetype)init{
    return [self initWithFrame:CGRectZero axixWithType:AskViewShowTypeHoritical arrowDepend:ArrowDependDerectionTop point:0 contentText:nil title:@""];
}

- (instancetype)initWithFrame:(CGRect)frame{
    return  [self initWithFrame:CGRectZero axixWithType:AskViewShowTypeHoritical arrowDepend:ArrowDependDerectionTop point:0 contentText:nil title:@""];
}

-(void)initViews{
    self.backgroundColor = [UIColor clearColor];

    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    bgView.layer.cornerRadius = 4;
    [self addSubview:bgView];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(10);
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.top.mas_equalTo(self.mas_top).offset(10);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-10);
    }];
    
    UILabel *title = [[UILabel alloc] init];
    title.font = [UIFont systemFontOfSize:14];
    title.text = self.title;
    title.textColor = [UIColor whiteColor];
    [bgView addSubview:title];
    
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(15);
        make.top.mas_equalTo(self.mas_top).offset(12);
    }];
    
    title.hidden = self.title.length == 0;
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor colorWithRed:245 green:245 blue:245 alpha:1];
    [bgView addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(title);
        make.right.mas_equalTo(self.mas_right).offset(-15);
        make.top.mas_equalTo(title.mas_bottom).offset(5);
        make.height.mas_equalTo(1);
    }];
    
    line.hidden = self.title.length == 0;
    
    if (self.contentArray.count == 1) {
        NSDictionary *dic = self.contentArray[0];
        
        UILabel *content = [[UILabel alloc] init];
        content.font = [UIFont systemFontOfSize:12];
        content.text = self.title;
        content.textColor = [UIColor whiteColor];
        content.text = [NSString stringWithFormat:@"%@",dic[@"value"]];
        content.numberOfLines = 0;
        content.lineBreakMode = NSLineBreakByWordWrapping;
        [bgView addSubview:content];
        
        [content mas_updateConstraints:^(MASConstraintMaker *make) {
            if (self.title.length == 0 ) {
                make.top.mas_equalTo(bgView.mas_top).offset(5);
            }else{
                make.top.mas_equalTo(line.mas_bottom).offset(5);
            }
            make.left.mas_equalTo(title);
            make.width.mas_lessThanOrEqualTo(bgView);
        }];
        
    }else{
        for (NSInteger i = 0; i<self.contentArray.count; i++) {
            NSDictionary *dic = self.contentArray[i];
            
            UILabel *content = [[UILabel alloc] init];
            content.font = [UIFont systemFontOfSize:12];
            content.text = self.title;
            content.textColor = [UIColor whiteColor];
            content.text = [NSString stringWithFormat:@"%@:%@",dic[@"key"],dic[@"value"]];
            [bgView addSubview:content];
            
            [content mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(title);
                make.top.mas_equalTo(line.mas_bottom).offset(5 + 20*i);
            }];
        }
    }
}

-(void)drawRect:(CGRect)rect{
    // 进入此方法先画顶部三角形，其他的部分在createview里面画，结构就是一个回字型，里面的口内部是用来画页面，里面口与外面口之间的通道用来挪移三角形的位置
    if (_arrowDerection == ArrowDependDerectionTop) {
        self.arrowP = CGPointMake(self.arrowLocate, 0);
    }else if(_arrowDerection == ArrowDependDerectionLeft){
        self.arrowP = CGPointMake(0,self.arrowLocate);
    }else if(_arrowDerection == ArrowDependDerectionBottom){
        self.arrowP = CGPointMake(self.arrowLocate,self.bounds.size.height);
    }else{
        self.arrowP = CGPointMake(self.bounds.size.width,self.arrowLocate);
    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.5);
    
    CGPoint points[3];
    points[0] = self.arrowP;
    if (_arrowDerection == ArrowDependDerectionTop) {
        points[1] = CGPointMake(self.arrowP.x-10, self.arrowP.y+10);
        points[2] = CGPointMake(self.arrowP.x+10, self.arrowP.y+10);
    }else if(_arrowDerection == ArrowDependDerectionLeft){
        points[1] = CGPointMake(self.arrowP.x+10, self.arrowP.y-10);
        points[2] = CGPointMake( self.arrowP.x+10, self.arrowP.y+10);
    }else if(_arrowDerection == ArrowDependDerectionBottom){
        points[1] = CGPointMake(self.arrowP.x-10, self.arrowP.y-10);
        points[2] = CGPointMake(self.arrowP.x+10, self.arrowP.y-10);
    }else{
        points[1] = CGPointMake(self.arrowP.x-10, self.arrowP.y-10);
        points[2] = CGPointMake(self.arrowP.x-10, self.arrowP.y+10);
    }

    CGContextSetRGBFillColor(context, 0, 0, 0, 0.6);
    CGContextSetStrokeColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextMoveToPoint(context, self.arrowP.x, self.arrowP.y);
    CGContextAddLines(context, points, 3);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end
