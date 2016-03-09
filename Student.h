//
//  Student.h
//  Documents
//
//  Created by 1234 on 16/3/8.
//  Copyright © 2016年 XDBB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject<NSCoding>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int  age;
@property (nonatomic, copy) NSString *photo;
+(instancetype)getFromStore;
- (void)save;
+ (void)remove;

#pragma mark-----运行时机制

+ (NSArray *)allPropertyNames;
@end
