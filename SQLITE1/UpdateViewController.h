//
//  UpdateViewController.h
//  SQLITE1
//
//  Created by Student on 28/11/16.
//  Copyright (c) 2016 AKR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>


@interface UpdateViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *Empidtf;
@property (weak, nonatomic) IBOutlet UITextField *Empnametf;
@property (weak, nonatomic) IBOutlet UITextField *Empaddrtf;

@property (weak, nonatomic) IBOutlet UITextField *Empphonetf;
- (IBAction)UpdateEmp:(id)sender;

@property (nonatomic,retain)NSArray *dircontents;
@property(nonatomic,retain)NSString *dbpath;
@property sqlite3 *db;
//-(void)getdata;

@property (nonatomic,retain) NSString *temp;
- (IBAction)deletem:(id)sender;

- (IBAction)buttonfind:(id)sender;


@end
