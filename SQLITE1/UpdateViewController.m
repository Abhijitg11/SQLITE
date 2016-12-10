//
//  UpdateViewController.m
//  SQLITE1
//
//  Created by Student on 28/11/16.
//  Copyright (c) 2016 AKR. All rights reserved.
//

#import "UpdateViewController.h"
#import "SaveEmpViewController.h"
#import <sqlite3.h>


@interface UpdateViewController ()

@end

@implementation UpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    _Empnametf.text=_temp;
//    [self getdata];


}

//-(void)getdata
//{
//    NSLog(@"in getdata");
//    _dircontents=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    _dbpath=[NSString stringWithFormat:@"%@/EmpData.sqlite",[_dircontents lastObject]];
//    // [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//    //sqlite3 *db;
//    sqlite3_stmt *mystmt;
//    //_EmpArray=[[NSMutableArray alloc]init];
//    
//    if(sqlite3_open([_dbpath UTF8String],&_db)==SQLITE_OK)
//    {
//        NSLog(@"tab_open");
//        //  NSString *query=[NSString stringWithFormat:@"insert into employee values(\"%@\",\"%@\",\"%@\",\"%@\")",_IdTf.text,_NameTf.text,_AddrTf.text,_MobTf.text];
//        NSString *q = [[NSString alloc] initWithFormat:@"select * from employee where Empname = '%@'",_Empnametf.text];
//        const char * query = [q UTF8String];
//        
//        // const char * query="select * from employee";
//        
//        if(sqlite3_prepare(_db,query,-1,&mystmt,NULL)==SQLITE_OK)
//        {
//            NSLog(@"tab_prep");
//            while (sqlite3_step(mystmt)==SQLITE_ROW)
//            {
//                NSLog(@"in while ");
//                _Empidtf.text= [[NSString alloc] initWithFormat:@"%d",sqlite3_column_int(mystmt, 0)];
//                _Empnametf.text  = [[NSString alloc] initWithFormat:@"%s",sqlite3_column_text(mystmt, 1)];
//                _Empaddrtf.text =[[NSString alloc] initWithFormat:@"%s",sqlite3_column_text(mystmt, 2)];
//                _Empphonetf.text = [[NSString alloc] initWithFormat:@"%d",sqlite3_column_int(mystmt, 3)];
//                
//            }
//            
//        }
//        
//    }
//    else{
//        NSLog(@"fail to open");
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)UpdateEmp:(id)sender {
    
    if(  sqlite3_open([_dbpath UTF8String], &_db)  ==  SQLITE_OK)
    {
        NSArray *dir=  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *dbpath=[NSString stringWithFormat:@"%@/Mydb.sqlite",[dir lastObject]];
        
        sqlite3 *db;
        
        
        if( sqlite3_open([dbpath UTF8String], &db)==SQLITE_OK)
        {
            NSString *query=[NSString stringWithFormat:@"update employee set empname=\"%@\",empaddress=\"%@\",empphoneno=\"%@\" where empid=\"%@\"",_Empnametf.text,_Empaddrtf.text,_Empphonetf.text,_Empidtf.text];
            
            if(sqlite3_exec(db,[query UTF8String],NULL,NULL,NULL)==SQLITE_OK)
            {
                NSLog(@"updated");
            }
            else
            {
                NSLog(@"fail to update");
            }
        }
        
        sqlite3_close(db);

    
}
//
//-(IBAction)DeleteEmp:(id)sender {
//    
////    NSArray *dir=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)
////    NSString *dbpath=[NSString stringWithFormat:@"%@/EmpData.sqlite",[dir lastObject]];
////    
////    sqlite3 *db;
////    
////    
////    if( sqlite3_open([dbpath UTF8String], &db)==SQLITE_OK)
////    {
////        
////        NSString *query=[NSString stringWithFormat:@"delete from employee where empid=\"%@\"",_Empidtf.text];
////        
////        
////        if(sqlite3_exec(db,[query UTF8String],NULL,NULL,NULL)==SQLITE_OK)
////        {
////            NSLog(@"deleted");
////            
////            _Empidtf.text=@"";
////            _Empnametf.text=@"";
////            _Empaddrtf.text=@"";
////            _Empphonetf.text=@"";
////        }
////        else
////        {
////            NSLog(@"fail to delete");
////        }
////        
////        
////    }
////    
////    sqlite3_close(db);
//
//}
//@end
}

- (IBAction)deletem:(id)sender {
    
    NSArray *dir=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
        NSString *dbpath=[NSString stringWithFormat:@"%@/Mydb.sqlite",[dir lastObject]];
    
        sqlite3 *db;
    
    
        if( sqlite3_open([dbpath UTF8String], &db)==SQLITE_OK)
        {
    
            NSString *query=[NSString stringWithFormat:@"delete from employee where empid=\"%@\"",_Empidtf.text];
    
    
            if(sqlite3_exec(db,[query UTF8String],NULL,NULL,NULL)==SQLITE_OK)
            {
                NSLog(@"deleted");
    
                _Empidtf.text=@"";
                _Empnametf.text=@"";
                _Empaddrtf.text=@"";
                _Empphonetf.text=@"";
              
            }
            else
            {
                NSLog(@"fail to delete");
            }
            
            
        }
        
        sqlite3_close(db);
    
    
}

- (IBAction)buttonfind:(id)sender {
    NSArray *dir=  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath=[NSString stringWithFormat:@"%@/Mydb.sqlite",[dir lastObject]];
    
    sqlite3 *db;
    
    
    sqlite3_stmt *mystmt;
    
    if( sqlite3_open([dbpath UTF8String], &db)==SQLITE_OK)
    {
        
        NSString *query=[NSString stringWithFormat:@"select * from employee where empid=\"%@\"",_Empidtf.text];
        
        if(sqlite3_prepare(db, [query UTF8String], -1, &mystmt, NULL)==SQLITE_OK)
        {
            while (sqlite3_step(mystmt)==SQLITE_ROW) {
                
                
                NSString *temp2=[ NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt,1)];
                
                NSString *temp3=[ NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt,2)];
                
                int temp4=sqlite3_column_int(mystmt ,3);
                
                _Empnametf.text=temp2;
                _Empaddrtf.text=temp3;
                _Empphonetf.text=[NSString stringWithFormat:@"%d",temp4];
                
            }
        }
        else
        {
            NSLog(@"fail to execute query");
        }
        
    }
    
    sqlite3_close(db);

    
    
}
@end
