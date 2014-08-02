//
//  ViewController.m
//  SampleCoreData
//
//  Created by Sample on 2014/08/02.
//  Copyright (c) 2014年 Sample. All rights reserved.
//

#import "ViewController.h"
#import "SampleEntityService.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [SampleEntityService insertSampleEntity:@"1" name:@"name"];
    
    NSArray *SampleEntityArray = [SampleEntityService sampleEntityArray];
    
    for (SampleEntity *sampleEntity in SampleEntityArray)
    {
        NSLog(@"%@",[sampleEntity sampleId]);
        NSLog(@"%@",[sampleEntity name]);
    }
}

@end
