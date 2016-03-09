//
//  Student.m
//  Documents
//
//  Created by 1234 on 16/3/8.
//  Copyright © 2016年 XDBB. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>
@implementation Student

#pragma mark-----解档/归档

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInt:_age forKey:@"age"];
    [aCoder encodeObject:_photo forKey:@"photo"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super init]) {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _age = [aDecoder decodeIntForKey:@"age"];
        _photo = [aDecoder decodeObjectForKey:@"photo"];
    }
    return self;
}

+(instancetype)getFromStore {
    NSLog(@"%@",[Student getFile]);
    Student *stu = [NSKeyedUnarchiver unarchiveObjectWithFile:[Student getFile]];
    return stu;
}

- (void)save {
   BOOL isLoad =  [NSKeyedArchiver archiveRootObject:self toFile:[Student getFile]];
}

+ (void)remove {
    NSFileManager *manager = [NSFileManager defaultManager];
    NSError *error;
    [manager removeItemAtPath:[Student getFile] error:&error];
}


/**
 *  获取模型的储存位置地址
 *
 *  @return 模型的储存位置地址
 */

+ (NSString *)getFile {
    return [NSHomeDirectory() stringByAppendingString:NSStringFromClass([Student class])];
}

#pragma mark-----运行时机制

+ (NSArray *)allPropertyNames {
    
    NSMutableArray *allNames = [NSMutableArray array];
    //储存属性的个数
    unsigned int propertyCount = 0;
    //通过运行时获取当前类的属性
    objc_property_t *propertys = class_copyPropertyList([self class], &propertyCount);
    
    for (int i= 0; i<propertyCount; i++) {
        objc_property_t property = propertys[i];
        const char * propertyName = property_getName(property);
        [allNames addObject:[NSString stringWithUTF8String:propertyName]];
    }
    return allNames;
}

@end
