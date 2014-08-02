//
//  CoreDataService.m
//  SampleCoreData
//
//  Created by Sample on 2014/08/02.
//  Copyright (c) 2014年 Sample. All rights reserved.
//

#import "CoreDataService.h"

@implementation CoreDataService

@synthesize managedObjectContext       = _managedObjectContext;
@synthesize managedObjectModel         = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

static CoreDataService *_sharedCoreDataService = nil;

+ (CoreDataService *)getInstance
{
    if (!_sharedCoreDataService)
    {
        _sharedCoreDataService = [[CoreDataService alloc] init];
    }
    
    return _sharedCoreDataService;
}

- (void)saveContext
{
    NSError *error                               = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    
    if (managedObjectContext && [managedObjectContext hasChanges] && ![managedObjectContext save:&error])
    {
        abort();
    }
}

- (id)insertNewObjectForEntityForName:(NSString *)entityName
{
    id entity = [NSEntityDescription insertNewObjectForEntityForName:entityName
                                              inManagedObjectContext:self.managedObjectContext];
    
    return entity;
}

- (NSArray *)fetchForEntityNamed:(NSString *)entityName predicate:(NSPredicate *)predicate
{
    NSFetchRequest *fetchRequest           = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:entityName
                                                         inManagedObjectContext:self.managedObjectContext];
    
    [fetchRequest setEntity:entityDescription];
    
    if (predicate)
    {
        [fetchRequest setPredicate:predicate];
    }
    
    NSArray *entityArray = [self.managedObjectContext executeFetchRequest:fetchRequest
                                                                    error:nil];
    
    return entityArray;
}


#pragma mark - Core Data stack

- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel) {
        return _managedObjectModel;
    }
    NSURL *modelURL     = [[NSBundle mainBundle] URLForResource:@"SampleModel" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL            = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"SampleModel.sqlite"];
    NSError *error              = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
