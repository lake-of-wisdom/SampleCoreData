//
//  SampleEntityService.m
//  SampleCoreData
//
//  Created by Sample on 2014/08/02.
//  Copyright (c) 2014年 Sample. All rights reserved.
//

#import "SampleEntityService.h"
#import "CoreDataService.h"

@implementation SampleEntityService

+ (NSArray *)sampleEntityArray
{
    CoreDataService *coreDataService = [CoreDataService getInstance];
    NSArray *sampleEntityArray       = [coreDataService fetchForEntityNamed:kEntitySampleEntity
                                                                  predicate:nil];
    
    return sampleEntityArray;
}

+ (void)insertSampleEntity:(NSString *)sampleId name:(NSString *)name
{
    CoreDataService *coreDataService = [CoreDataService getInstance];
    SampleEntity *sampleEntity       = [coreDataService insertNewObjectForEntityForName:kEntitySampleEntity];

    [sampleEntity setSampleId:sampleId];
    [sampleEntity setName:name];
    
    [coreDataService saveContext];
}

@end
