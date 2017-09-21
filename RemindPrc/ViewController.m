//
//  ViewController.m
//  RemindPrc
//
//  Created by zhangqq on 2017/9/21.
//  Copyright © 2017年 张强. All rights reserved.
//

#import "ViewController.h"
#import "XDYAskRemindView.h"

@interface ViewController ()

@property (nonatomic, strong) XDYAskRemindView *remindView;
@property (nonatomic, strong) UIView *circleview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
}

-(void)initViews{
    //
    self.view.backgroundColor = [UIColor whiteColor];

    NSArray *titlearr = @[@"btn1",@"btn2",@"btn3",@"btn3"];
    NSArray *colorarr = @[[UIColor orangeColor],[UIColor cyanColor],[UIColor purpleColor],[UIColor redColor]];
    for (NSInteger i = 0; i<4; i++) {
        UIButton *btn = [UIButton  buttonWithType:0];
        btn.frame = CGRectMake(150, 64+ 50*i, 80, 30);
        btn.backgroundColor = colorarr[i];
        btn.tag = 1000 + i;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:titlearr[i] forState:0];
        [self.view addSubview:btn];
    }
    
    _circleview = [[UIView alloc] init];
    _circleview.backgroundColor = [UIColor orangeColor];
    _circleview.layer.cornerRadius = 60;
    [self.view addSubview:_circleview];
    
    [_circleview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(120, 120));
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-220);
    }];
}

-(void)btnClick:(UIButton *)sender{
    [_remindView removeFromSuperview];
    NSInteger i = sender.tag - 1000;
   
    if ( i == 0) {
        _remindView = [[XDYAskRemindView alloc] initWithFrame:CGRectZero axixWithType:AskViewShowTypeHoritical arrowDepend:ArrowDependDerectionBottom point:50 contentText:@[@{@"key":@"",@"value":@"大理发卡拉的开了啦啦打了数量哦哦的是啦啦啦； ；奥斯卡发送的"}] title:@""];
        
        [self.view addSubview:_remindView];
        
        [_remindView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(_circleview.mas_top);
            make.centerX.mas_equalTo(_circleview);
            make.size.mas_equalTo(CGSizeMake(150, 100));
        }];
    }else if (i == 1){
        NSArray *arr = @[@{@"key":@"键1",@"value":@"值1"},@{@"key":@"键2",@"value":@"值2"},@{@"key":@"键3",@"value":@"值3"},@{@"key":@"键4",@"value":@"值4"},@{@"key":@"键5",@"value":@"值5"},@{@"key":@"键6",@"value":@"值6"}];
        _remindView = [[XDYAskRemindView alloc] initWithFrame:CGRectZero axixWithType:AskViewShowTypeVertical arrowDepend:ArrowDependDerectionRight point:50 contentText:arr title:@"竖直展示1"];
        [self.view addSubview:_remindView];
        
        [_remindView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_circleview.mas_left);
            make.centerY.mas_equalTo(_circleview);
            make.size.mas_equalTo(CGSizeMake(100, 170));
        }];
    }else if (i == 2){
        NSArray *arr = @[@{@"key":@"键1",@"value":@"值1"},@{@"key":@"键2",@"value":@"值2"},@{@"key":@"键3",@"value":@"值3"},@{@"key":@"键4",@"value":@"值4"},@{@"key":@"键5",@"value":@"值5"},@{@"key":@"键6",@"value":@"值6"}];
        
        _remindView = [[XDYAskRemindView alloc] initWithFrame:CGRectZero axixWithType:AskViewShowTypeHoritical arrowDepend:ArrowDependDerectionLeft point:50 contentText:arr title:@"竖直展示2"];
        [self.view addSubview:_remindView];
        
        [_remindView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_circleview.mas_right);
            make.centerY.mas_equalTo(_circleview);
            make.size.mas_equalTo(CGSizeMake(100, 170));
        }];
    }else if (i == 3){
        NSArray *arr = @[@{@"key":@"键1",@"value":@"值1"},@{@"key":@"键2",@"value":@"值2"},@{@"key":@"键3",@"value":@"值3"},@{@"key":@"键4",@"value":@"值4"},@{@"key":@"键5",@"value":@"值5"},@{@"key":@"键6",@"value":@"值6"}];
        _remindView = [[XDYAskRemindView alloc] initWithFrame:CGRectZero axixWithType:AskViewShowTypeHoritical arrowDepend:ArrowDependDerectionTop point:50 contentText:arr title:@"竖直展示3"];
        [self.view addSubview:_remindView];
        
        [_remindView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_circleview.mas_bottom);
            make.centerX.mas_equalTo(_circleview);
            make.size.mas_equalTo(CGSizeMake(100, 170));
        }];
    }
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
