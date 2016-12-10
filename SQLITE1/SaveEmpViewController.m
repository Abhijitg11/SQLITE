//
//  SaveEmpViewController.m
//  SQLITE1
//
//  Created by Student on 28/11/16.
//  Copyright (c) 2016 AKR. All rights reserved.
//

#import "SaveEmpViewController.h"
#import <sqlite3.h>

@interface SaveEmpViewController ()

@end

@implementation SaveEmpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

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

- (IBAction)btnclick:(id)sender {
    NSArray *dircontents=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbpath=[NSString stringWithFormat:@"%@/Mydb.sqlite",[dircontents lastObject]];
    
    sqlite3 *db;
    
    
    
    if(sqlite3_open([dbpath UTF8String],&db)==SQLITE_OK)
    {
        
        NSString *query=[NSString stringWithFormat:@"insert into employee values(\"%@\",\"%@\",\"%@\",\"%@\")",_Idtf.text,_Nametf.text,_Addrtf.text,_Mobtf.text];
        //const char * query="cr";
        NSLog(@"%@",query);
        
        if(sqlite3_exec(db,[query UTF8String],NULL,NULL,NULL)==SQLITE_OK)
        {
            NSLog(@"values inserted");
        }
        else
        {
            NSLog(@"Fail to insert");
        }
    }
    
    sqlite3_close(db);
    
    [self.navigationController popViewControllerAnimated:YES];
 
}
@end
