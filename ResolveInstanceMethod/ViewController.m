//
//  ViewController.m
//  ResolveInstanceMethod
//
//  Created by Doman on 17/3/23.
//  Copyright © 2017年 doman. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *person = [[Person alloc] init];
    
    [person performSelector:@selector(eat:) withObject:@"麻辣烫"];

}

@end
