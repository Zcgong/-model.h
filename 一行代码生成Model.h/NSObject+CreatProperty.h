//
//  NSObject+CreatProperty.h
//  一行代码生成Model.h
//
//  Created by 3D on 17/2/27.
//  Copyright © 2017年 3D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (CreatProperty)
+ (void)createPropertyCodeWithDict:(NSDictionary *)dict andClassStr:(NSString *)classStr andPrdfix:(NSString *)prdfix;
@end
