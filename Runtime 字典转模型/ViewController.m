//
//  ViewController.m
//  Runtime 字典转模型
//
//  Created by 澳蜗科技 on 16/7/22.
//  Copyright © 2016年 澳蜗科技. All rights reserved.
//

#import "ViewController.h"
#import "NSDictionary+property.h"
#import "OneModel.h"
#import "NSObject+Model.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    NSDictionary *dict = @{@"Bool":@(YES),
                           @"integer":@(123456789),
                           @"str1":@"111",
                           @"str2":@"222",
                           @"array1":@[@"1",@"2",@"3"],
                           @"array2":@[@"11",@"22",@"33"],
                           @"dict1":@{@"str1_1":@"2",
                                      @"dict1_2":@{@"dict_3":@(1111)}},
                           };
    //自动生成属性
   [NSDictionary creatPropertyWithDict:dict];
    
    //字典转模型
    OneModel *model = [OneModel modelWithDict:dict];
    NSLog(@"%@",model.dict1.dict1_2);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
