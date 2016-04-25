//
//  ViewController.m
//  LoginSqlite
//
//  Created by Tops on 4/25/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize txt_nm,txt_pass,txt_email,txt_addr,txt_ph;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dbop=[[dboperation alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)clearall
{
    txt_nm.text=@"";
    txt_pass.text=@"";
    txt_ph.text=@"";
    txt_email.text=@"";
    txt_addr.text=@"";
}
- (IBAction)btn_action:(id)sender
{
    [self.view endEditing:YES];
    NSString *msg=@"";
    NSString *st_format=[NSString stringWithFormat:@"insert into stud(s_nm,s_pass,s_ph,s_email,s_addr)values('%@','%@','%@','%@','%@')",txt_nm.text,txt_pass.text,txt_ph.text,txt_email.text,txt_addr.text];
    BOOL result=[dbop InsUpdDel:st_format];
    if (result==YES)
    {
        msg=@"Inserted..";
    }
    else
    {
        msg=@"Failed..";
    }
    UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Alert" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    [alrt show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self clearall];
}
@end
