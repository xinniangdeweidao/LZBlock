//
//  ViewController.h
//  LZBlockDemo
//
//  Created by SURE001 on 2017/7/19.
//  Copyright © 2017年 lizhen. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - 没有返回值的写法，需要声明
typedef void (^LZBlock_1)(void);//无参数，无返回值
typedef void (^LZBlock_3)(NSString *str1,NSString *str2);//2参数，无返回值


@interface ViewController : UIViewController

@property (nonatomic,copy)LZBlock_1 block;
@property (nonatomic,copy)LZBlock_3 block3;


#pragma mark - 有返回值的写法
- (int)methodTakeBlock:(int (^)(int, int))block;//有2个参数的block，且block的返回值是int

@end

