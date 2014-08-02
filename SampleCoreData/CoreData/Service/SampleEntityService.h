//
//  SampleEntityService.h
//  SampleCoreData
//
//  Created by Sample on 2014/08/02.
//  Copyright (c) 2014年 Sample. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SampleEntity.h"

@interface SampleEntityService : NSObject

+ (NSArray *)sampleEntityArray;
+ (void)insertSampleEntity:(NSString *)sampleId name:(NSString *)name;

@end
