//
//  NSObject+CreatProperty.m
//  一行代码生成Model.h
//
//  Created by 3D on 17/2/27.
//  Copyright © 2017年 3D. All rights reserved.
//

#import "NSObject+CreatProperty.h"

@implementation NSObject (CreatProperty)
+ (void)createPropertyCodeWithDict:(NSDictionary *)dict andClassStr:(NSString *)classStr andPrdfix:(NSString *)prdfix
{
    NSMutableString *strM = [NSMutableString string];
    // 遍历字典
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull propertyName, id  _Nonnull value, BOOL * _Nonnull stop) {
        
        //  NSLog(@"%@ %@",propertyName,[value class]);
        NSString *code;
        
        if ([value isKindOfClass:[NSString class]]) {
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSString *%@;",propertyName]
            ;
        }else if ([value isKindOfClass:[NSNumber class]]){
            //这里写的不完善 暂时都用int 保存
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) int %@;",propertyName]
            ;
        }else if ([value isKindOfClass:[NSArray class]]){
            
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) NSArray *%@;",propertyName]
            ;
            [self createPropertyCodeWithKey:propertyName andArray:value andPrdfix:prdfix];
        }else if ([value isKindOfClass:[NSDictionary class]]){
            
            code = [NSString stringWithFormat:@"@property (nonatomic, strong) %@ *%@;",[NSString stringWithFormat:@"%@%@Model",prdfix,propertyName],propertyName]
            ;
            [self createPropertyCodeWithKey:propertyName andDIC:value andPrdfix:prdfix];
        }else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            code = [NSString stringWithFormat:@"@property (nonatomic, assign) BOOL %@;",propertyName]
            ;
        }
        [strM appendFormat:@"\n%@\n",code];
    }];
    NSString *top = nil;
    
    top = [NSString stringWithFormat:@"@interface %@ : NSObject",classStr];
    NSString *bottom = @"@end";
    NSString *allStr= [NSString stringWithFormat:@"\n%@\n%@\n%@\n\n",top,strM,bottom];
    const char *cString1 = [allStr cStringUsingEncoding:NSUTF8StringEncoding];
    printf("%s",cString1);
}

+ (void)createPropertyCodeWithKey:(NSString *)key andArray:(NSArray *)arr andPrdfix:(NSString *)prdfix{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *classStr = [NSString stringWithFormat:@"%@%@Model",prdfix,key];
        [self createPropertyCodeWithDict:arr[0] andClassStr:classStr andPrdfix:prdfix];
    });
}

+ (void)createPropertyCodeWithKey:(NSString *)key andDIC:(NSDictionary *)dic andPrdfix:(NSString *)prdfix{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString *classStr = [NSString stringWithFormat:@"%@%@Model",prdfix,key];
        [self createPropertyCodeWithDict:dic andClassStr:classStr andPrdfix:prdfix];
    });
}

@end
