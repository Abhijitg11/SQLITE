//
//  SaveEmpViewController.h
//  SQLITE1
//
//  Created by Student on 28/11/16.
//  Copyright (c) 2016 AKR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SaveEmpViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *Idtf;


@property (weak, nonatomic) IBOutlet UITextField *Nametf;

@property (weak, nonatomic) IBOutlet UITextField *Addrtf;

@property (weak, nonatomic) IBOutlet UITextField *Mobtf;

- (IBAction)btnclick:(id)sender;


@end
