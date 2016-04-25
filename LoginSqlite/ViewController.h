//
//  ViewController.h
//  LoginSqlite
//
//  Created by Tops on 4/25/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dboperation.h"
@interface ViewController : UIViewController<UIAlertViewDelegate>
{
    dboperation *dbop;
}
@property (weak, nonatomic) IBOutlet UITextField *txt_nm;
@property (weak, nonatomic) IBOutlet UITextField *txt_pass;
@property (weak, nonatomic) IBOutlet UITextField *txt_ph;
@property (weak, nonatomic) IBOutlet UITextField *txt_email;
@property (weak, nonatomic) IBOutlet UITextField *txt_addr;
- (IBAction)btn_action:(id)sender;

@end

