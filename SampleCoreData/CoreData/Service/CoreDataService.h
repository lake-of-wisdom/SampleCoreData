//
//  CoreDataService.h
//  SampleCoreData
//
//  Created by Sample on 2014/08/02.
//  Copyright (c) 2014年 Sample. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const kEntitySampleEntity= @"SampleEntity";

@interface CoreDataService : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (CoreDataService *)getInstance;
- (id)insertNewObjectForEntityForName:(NSString *)entityName;
- (NSArray *)fetchForEntityNamed:(NSString *)entityName predicate:(NSPredicate *)predicate;
- (void)saveContext;

@end