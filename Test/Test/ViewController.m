//
//  ViewController.m
//  Test
//
//  Created by kmom on 2018/8/29.
//  Copyright © 2018年 kmom. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //Person *p = [Person new];
    unsigned int count = 0;
    
    //获取类的所有成员变量
    Ivar *memvbers = class_copyIvarList([Person class], &count);
    
    for (int i = 0; i<count; i++)
    {
        Ivar *iva = &memvbers[i];
        // 取得变量名并转成字符串类型
        const char *memberName = ivar_getName(*iva);
        NSLog(@"变量名 = %s",memberName);
        
    }
    
    
    // 获取类的所有成员属性
    objc_property_t *properties =class_copyPropertyList([Person class], &count);
    for (int i = 0; i<count; i++)
    {
        objc_property_t property = properties[i];
        const char* char_f =property_getName(property);
        NSString *propertyName = [NSString stringWithUTF8String:char_f];
        NSLog(@"属性名 = %@",propertyName);
    }
    
   

}




@end
