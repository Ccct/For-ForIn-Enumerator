//
//  ViewController.m
//  CirculationContrast
//
//  Created by Helios on 2019/11/23.
//  Copyright © 2019 Helios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    [self enumeratorMethond];
}

#pragma mark - for循环
- (void)forMethond{
    
    for (int i = 0; i <= 100; i++) {
        
        NSLog(@"第 %d 个",i);
    }
}

#pragma mark - for in 循环
//forin 遍历 又称快速遍历  简单实用 比for 循环等级高些
//与for循环最明显的区别就是看不到循环次数及索引情况。
//数组是有序的 for循环过程中也是有序的，forin遍历过程中是根据数组中数据添加顺序而定的。
- (void)forInMethond{
    
    NSArray *arr = @[@"xx",@"xx",@"xx",@"xx",@"xx",@"xx",@"xx"];
    
    for (NSString *str in arr) {
        
        NSLog(@"%@",str);
        
    }
}

#pragma mark - Enumerator枚举

//枚举器是一种苹果官方推荐的更加面向对象的一种遍历方式，相比于for循环,它具有高度解耦、面向对象、使用方便等优势
- (void)enumeratorMethond{
    
    //对于可变数组进行枚举操作时，你不能通过添加或删除对象这类操作来改变数组容器。
    NSMutableArray *mutArr = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil];
    
    //1、正序遍历
//    [mutArr enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//
//        NSLog(@"idx:%lu , value:%@",(unsigned long)idx,obj);
//    }];
    
    //2、NSEnumerationConcurrent 不按顺序的遍历
    //3、NSEnumerationReverse    按顺序地倒序遍历
    //此便利方法的速度贼快，底层用GDC
//    [mutArr enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//
//        NSLog(@"idx:%lu , value:%@",(unsigned long)idx,obj);
//    }];
    
    //4、遍历制定范围
    NSMutableIndexSet *idxSet = [[NSMutableIndexSet alloc] init];
    [idxSet addIndex:1];
    [idxSet addIndex:4];
    [mutArr enumerateObjectsAtIndexes:idxSet  options:NSEnumerationConcurrent usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        NSLog(@"idx:%lu , value:%@",(unsigned long)idx,obj);
    }];
    
}

#pragma mark - while循环
- (void)whileMethond{
    
}

#pragma mark - dispatch_apply函数循环

//GCD dispatch_apply函数是一个同步调用，block任务执行n次后才返回。该函数比较适合处理耗时较长、迭代次数较多的情况。
- (void)dispatch_applyMethond{
    
    NSArray *arr = @[@"xx",@"xx",@"xx",@"xx",@"xx",@"xx",@"xx"];
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_apply(arr.count, queue, ^(size_t idx) {
        
        NSLog(@"%@",arr[idx]);
    });
}

#pragma mark - 那种情况下，用哪种遍历方法

/*
 
 1、当只是遍历一个数组的时候使用For-in会比较快速, 推荐使用For-in遍历数组.
 
 2、通过Value查询index的时候, 面对大量的数组推荐使用 enumerateObjectsWithOptions 的并行方法.
 
 3、当我们想遍历字典类型的时候, 推荐使用enumerateKeysAndObjectsUsingBlock，不仅仅是因为速度快, 更是因为代码更优雅和直观.
 
 */

@end
