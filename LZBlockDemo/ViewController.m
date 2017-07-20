//
//  ViewController.m
//  LZBlockDemo
//
//  Created by SURE001 on 2017/7/19.
//  Copyright © 2017年 lizhen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    void(^block)(void)=^{
        
    };
    //赋值给属性_block 此时就完成了copy   _block指针指向堆中一块内存(存放的是block的实现代码)，_block就一直拥有了代码块的使用权，直到 ViewController对象消亡。
    _block = block;
   //静态的可供外部调用，动态的仅可以内部实现和调用
    int (^LZBlock_2)(int a,int b)=^int (int a, int b) {
        return a + b;
    };
    int sum = LZBlock_2(1,2);
    NSLog(@"%d",sum);
    
    sum = [self methodTakeBlock:^int (int a, int b) {
        return b / a;
    }];
     NSLog(@"%d",sum);
    self.block3 = ^(NSString *str1,NSString *str2){
        NSString *sss = [[NSString alloc]initWithFormat:@"%d",[str1 intValue]+[str2 intValue]];
        NSLog(@"%@",sss);
    };
    self.block3(@"111",@"410");
}
- (int)methodTakeBlock:(int (^)(int, int))block {
    int sum = 0;
    if (block) {
        sum = block(10, 20);
    }
    return sum;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
