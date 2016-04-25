//
//  dboperation.m
//  DataBaseAppInsert
//
//  Created by Tops on 3/18/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import "dboperation.h"


@implementation dboperation
@synthesize get_dbpath;
-(id)init
{
    if (self==[super init])
    {
        deli=(AppDelegate *)[[UIApplication sharedApplication]delegate];
        get_dbpath=deli.dbpath;
    }
    return self;
}
-(BOOL)InsUpdDel:(NSString *)query
{
    BOOL result=NO;
    if (sqlite3_open([get_dbpath UTF8String], &dbsql)==SQLITE_OK)
    {
        sqlite3_stmt *ppStmt;
        if (sqlite3_prepare_v2(dbsql,[query UTF8String], -1,&ppStmt, nil)==SQLITE_OK)
        {
            sqlite3_step(ppStmt);
            result=YES;
        }
        sqlite3_finalize(ppStmt);
    }
    sqlite3_close(dbsql);
    return result;
}
-(NSString *)CheckLogin:(NSString *)query
{
    NSString *result=[[NSString alloc]init];
    if (sqlite3_open([get_dbpath UTF8String], &dbsql)==SQLITE_OK)
    {
        sqlite3_stmt *ppStmt;
        if (sqlite3_prepare_v2(dbsql,[query UTF8String], -1,&ppStmt, nil)==SQLITE_OK)
        {
            while (sqlite3_step(ppStmt)==SQLITE_ROW)
            {
                NSString *st_id=[NSString stringWithFormat:@"%s",sqlite3_column_text(ppStmt, 0)];
               
                result=st_id;
            };
        }
        sqlite3_finalize(ppStmt);
    }
    sqlite3_close(dbsql);
    return result;
}
-(NSMutableArray *)SelectAllData:(NSString *)query
{
    NSMutableArray *result=[[NSMutableArray alloc]init];
    NSMutableDictionary *dict=[[NSMutableDictionary alloc]init];
    if (sqlite3_open([get_dbpath UTF8String], &dbsql)==SQLITE_OK)
    {
        sqlite3_stmt *ppStmt;
        if (sqlite3_prepare_v2(dbsql,[query UTF8String], -1,&ppStmt, nil)==SQLITE_OK)
        {
            while (sqlite3_step(ppStmt)==SQLITE_ROW)
            {
                NSString *st_id=[NSString stringWithFormat:@"%s",sqlite3_column_text(ppStmt, 0)];
                NSString *st_nm=[NSString stringWithFormat:@"%s",sqlite3_column_text(ppStmt, 1)];
                NSString *s_pass=[NSString stringWithFormat:@"%s",sqlite3_column_text(ppStmt, 2)];
                NSString *s_ph=[NSString stringWithFormat:@"%s",sqlite3_column_text(ppStmt, 3)];
                NSString *s_email=[NSString stringWithFormat:@"%s",sqlite3_column_text(ppStmt, 4)];
                NSString *s_addr=[NSString stringWithFormat:@"%s",sqlite3_column_text(ppStmt, 5)];
                
                [dict setObject:st_id forKey:@"st_id"];
                [dict setObject:st_nm forKey:@"st_nm"];
                [dict setObject:s_pass forKey:@"s_pass"];
                [dict setObject:s_ph forKey:@"s_ph"];
                [dict setObject:s_email forKey:@"s_email"];
                [dict setObject:s_addr forKey:@"s_addr"];
                
                [result addObject:[dict copy]];
            };
        }
        sqlite3_finalize(ppStmt);
    }
    sqlite3_close(dbsql);
    return result;
}

@end
