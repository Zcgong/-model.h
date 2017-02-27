//
//  ViewController.m
//  一行代码生成Model.h
//
//  Created by 3D on 17/2/27.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "ViewController.h"
#import "LCTestModel.h"
#import "NSObject+CreatProperty.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    //使用前请把xcode8自动打印的log关掉比较 打印台比较清爽

    [super viewDidLoad];
   NSDictionary *dic0 = @{@"thumbnail_pic":@"http://ww4.sinaimg.cn/thumbnail/80292f4btw1eqi01myf23j20br08ogm0.jpg",
                          @"name":@"对象中有个数组数组里面是对象"};
    
 
    NSDictionary *dic =  @{@"attitudes_count":@3,
                           @"created_at":@"刚刚",
                           @"idstr":@"3824316141411024",
                           @"pic_urls":@[dic0],
                           @"user":@{@"name":@"对象面有对象",
                                     @"vip":@1}
                           };
    NSDictionary *dic1 =  @{@"attitudes_count":@3,
                           @"created_at":@"刚刚",
                           @"idstr":@"3824316141411024",
                           @"pic_urls":@[dic0],
                           @"user":@{@"name":@"猪猪爱讲冷笑话",
                                     @"vip":@1}
                           };
    NSDictionary *dic2 =  @{@"attitudes_count":@3,
                           @"created_at":@"刚刚",
                           @"idstr":@"3824316141411024",
                           @"pic_urls":@[dic0],
                           @"user":@{@"name":@"猪猪爱讲冷笑话",
                                     @"vip":@1}
                           };
   
    NSDictionary *dic3 =  @{@"statuses":@[dic,dic1,dic2],
      @"total_number":@1091};
    [LCTestModel createPropertyCodeWithDict:dic3 andClassStr:NSStringFromClass([LCTestModel class]) andPrdfix:@"LC"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
