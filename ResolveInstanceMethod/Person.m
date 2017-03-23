//
//  Person.m
//  ResolveInstanceMethod
//
//  Created by Doman on 17/3/23.
//  Copyright © 2017年 doman. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>

@implementation Person

// 动态添加方法,首先实现这个resolveInstanceMethod
// resolveInstanceMethod调用:当调用了没有实现的方法没有实现就会调用resolveInstanceMethod
// resolveInstanceMethod作用:就知道哪些方法没有实现,从而动态添加方法
// sel:没有实现方法

// 定义函数
// 没有返回值,参数(id,SEL)
// void(id,SEL)

void eatFun(id self, SEL _cmd, id msg)
{
    NSLog(@"Person eat  %@--%@%@",self,NSStringFromSelector(_cmd),msg);
}

+(BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(eat:)) {
        
        /*
         cls:给哪个类添加方法
         SEL:添加方法的方法编号是什么
         IMP:方法实现,函数入口,函数名
         types:方法类型   可查看官方文档查询：Type Encodings
         */

        class_addMethod(self, sel, (IMP)eatFun, "v@:@");
        
        // 处理完
        return YES;

    }
    
    return [super resolveInstanceMethod:sel];
}

@end
