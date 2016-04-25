//
//  LOGINViewController.m
//  LoginSqlite
//
//  Created by Tops on 4/25/16.
//  Copyright (c) 2016 Tops. All rights reserved.
//

#import "LOGINViewController.h"

@interface LOGINViewController ()

@end

@implementation LOGINViewController
@synthesize txt_unm,txt_upass;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    dbop=[[dboperation alloc]init];
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

- (IBAction)btn_login:(id)sender
{
    NSString *msg=@"";
    NSString *st_format=[NSString stringWithFormat:@"select count(s_id) from stud where s_nm='%@' and s_pass='%@'",txt_unm.text,txt_upass.text];
    int result=[[dbop CheckLogin:st_format]intValue];
    if (result!=0)
    {
        
        NSString *st_format2=[NSString stringWithFormat:@"select s_id from stud where s_nm='%@' and s_pass='%@'",txt_unm.text,txt_upass.text];
        
        NSString *result=[dbop CheckLogin:st_format2];
        
        NSString *st_format3=[NSString stringWithFormat:@"select * from stud where s_id='%@'",result];
        
        NSArray *arr_get=[dbop SelectAllData:st_format3];
        
        if (arr_get.count>0)
        {
            DetailTableViewController *detail=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailTableViewController"];
            
            detail.dict=[arr_get objectAtIndex:0];
            
            [self.navigationController pushViewController:detail animated:YES];
        }
        
    }
    else
    {
        msg=@"Failed..";
        UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"Alert" message:msg delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alrt show];
    }
    
}
@end
