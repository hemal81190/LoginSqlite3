//
//  dboperation.h
//  DataBaseAppInsert
//
//  Created by Tops on 3/18/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface dboperation : NSObject
{
    AppDelegate *deli;
    sqlite3 *dbsql;
}
@property(retain,nonatomic)NSString *get_dbpath;
-(BOOL)InsUpdDel:(NSString *)query;
-(NSString *)CheckLogin:(NSString *)query;
-(NSMutableArray *)SelectAllData:(NSString *)query;
@end
