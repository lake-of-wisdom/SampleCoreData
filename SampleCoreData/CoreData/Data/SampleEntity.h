//
//  SampleEntity.h
//  SampleCoreData
//
//  Created by Sample on 2014/08/02.
//  Copyright (c) 2014年 Sample. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface SampleEntity : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * sampleId;

@end
