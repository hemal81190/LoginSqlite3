//
//  LOGINViewController.h
//  LoginSqlite
//
//  Created by Tops on 4/25/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dboperation.h"
#import "DetailTableViewController.h"
@interface LOGINViewController : UIViewController
{
    dboperation *dbop;
}
@property (weak, nonatomic) IBOutlet UITextField *txt_unm;
@property (weak, nonatomic) IBOutlet UITextField *txt_upass;
- (IBAction)btn_login:(id)sender;

@end
