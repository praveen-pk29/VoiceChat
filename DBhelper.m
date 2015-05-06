 //
//  DBhelper.m
//  sampleproject
//
//  Created by Sunil Shroff on 05/12/14.
//  Copyright (c) 2014 MEDINDIA4U. All rights reserved.
//

#import "DBhelper.h"

@implementation DBhelper

- (void)setPath {
    
    NSError *error;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2     
    dbPath= [documentsDirectory stringByAppendingPathComponent:@"Voice_DB.sqlite"];  //3
    NSString *bundle = [[NSBundle mainBundle] pathForResource:@"Voice_DB"ofType:@"sqlite"]; //5
    
    
    NSLog(@"Plist Path =%@",dbPath);
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: dbPath]) //4
    {
        
    [fileManager copyItemAtPath:bundle toPath: dbPath error:&error]; //6
        
        
    }
    
    
}

@end
