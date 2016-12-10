//
//  EmpTableViewController.m
//  SQLITE1
//
//  Created by Student on 28/11/16.
//  Copyright (c) 2016 AKR. All rights reserved.
//

#import "EmpTableViewController.h"
#import <sqlite3.h>
//#import "EmpClass.h"
#import "UpdateViewController.h"

@interface EmpTableViewController ()

@end

@implementation EmpTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _EmpArray=[[NSMutableArray alloc]init];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    }
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_EmpArray removeAllObjects];
    
    NSArray *dircontents=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
        NSString *dbpath=[NSString stringWithFormat:@"%@/Mydb.sqlite",[dircontents lastObject]];
    
        sqlite3 *db;
        sqlite3_stmt *mystmt;
    
        if(sqlite3_open([dbpath UTF8String],&db)==SQLITE_OK)
        {
            const char * query="select * from employee";
    
            if(sqlite3_prepare(db,query,-1,&mystmt,NULL)==SQLITE_OK)
            {
                while (sqlite3_step(mystmt)==SQLITE_ROW){
                
                    NSString *temp=[NSString stringWithFormat:@"%s",sqlite3_column_text(mystmt, 1)];
                    [_EmpArray addObject:temp];
                    
                }
    
            }
            
        else
        {
            NSLog(@"fail to execute query");
         }
    }
    sqlite3_close(db);
    [self.tableView reloadData];
    
    
    
}

//-(void)getdata
//{
//    NSArray *dircontents=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *dbpath=[NSString stringWithFormat:@"%@/EmpData.sqlite",[dircontents lastObject]];
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//    sqlite3 *db;
//    sqlite3_stmt *mystmt;
//    _EmpArray=[[NSMutableArray alloc]init];
//    
//    if(sqlite3_open([dbpath UTF8String],&db)==SQLITE_OK)
//    {
//        NSLog(@"tab_open");
//        //  NSString *query=[NSString stringWithFormat:@"insert into employee values(\"%@\",\"%@\",\"%@\",\"%@\")",_IdTf.text,_NameTf.text,_AddrTf.text,_MobTf.text];
//        const char * query="select * from employee";
//        
//        if(sqlite3_prepare(db,query,-1,&mystmt,NULL)==SQLITE_OK)
//        {
//            NSLog(@"tab_prep");
//            while (sqlite3_step(mystmt)==SQLITE_ROW)
//            {
//                NSLog(@"in while ");
//                EmpClass *emp=[[EmpClass alloc]init];
//                emp.eno = sqlite3_column_int(mystmt, 0);
//                emp.ename= [[NSString alloc] initWithFormat:@"%s",sqlite3_column_text(mystmt, 1)];
//                emp.eaddress=[[NSString alloc]initWithFormat:@"%s",sqlite3_column_text(mystmt, 2)];
//                emp.ephoneno=sqlite3_column_int(mystmt, 3);
//                [_EmpArray addObject:emp];
//                
//            }
//            
//        }
//        
//    }
//    else{
//        NSLog(@"fail to open");
//    }
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return _EmpArray.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
       cell.textLabel.text = [_EmpArray objectAtIndex:indexPath.row];
    // Configure the cell...
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"update" sender:self];
}
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if([[segue  identifier]  isEqualToString:@"update"])
//    {
//        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[self.tableView indexPathForSelectedRow]];
//        
//        UpdateViewController *recordController = [segue destinationViewController];
//        recordController.temp = cell.textLabel.text;
//    }
//    
//    
//    
//}
//


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
