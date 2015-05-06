//
//  PhoneNumberViewController.m
//  VoiceChat
//
//  Created by mac on 3/20/15.
//  Copyright (c) 2015 Vijai. All rights reserved.
//

#import "PhoneNumberViewController.h"

@interface PhoneNumberViewController ()

@end

@implementation PhoneNumberViewController

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

- (IBAction)bttnActionNext:(id)sender {
    
    
       [self performSegueWithIdentifier:@"MoveToVerification" sender:self];
    
    
    
    
    
    NSString *strObjUserName=[[NSString alloc]initWithFormat:@"aspiretechnovations"];
    NSString *strObjPassword=[[NSString alloc]initWithFormat:@"12345"];
    NSString *strObjSenderId=[[NSString alloc]initWithFormat:@"ASPIRE"];
    NSString *strObjSmsType=[[NSString alloc]initWithFormat:@"normal"];
    NSString *strObjPriority=[[NSString alloc]initWithFormat:@"ndnd"];
    NSString *strObjMobileNumber=[[NSString alloc]initWithFormat:@"%@",_txtObjPhoneNumber.text];
    NSUInteger code = arc4random_uniform(1000);
    
    NSLog(@"Random Number: %lu", (unsigned long)code);
    NSString *strObjMessage =[[NSString alloc]initWithFormat:@"Your Verification Code Is:%lu",(unsigned long)code];
    
    [[NSUserDefaults standardUserDefaults] setInteger:code forKey:@"Code"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    
    [[NSUserDefaults standardUserDefaults] setObject:strObjMobileNumber forKey:@"MobileNumber"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    
    NSString *url = [NSString stringWithFormat:@"%ssendmsg.php?user=%@&pass=%@&sender=%@&phone=%@&text=%@&priority=%@&stype=%@",localSMSUrl,strObjUserName,strObjPassword,strObjSenderId,strObjMobileNumber,strObjMessage,strObjPriority,strObjSmsType];
    
    
    NSURL *urlStr = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSMutableURLRequest *theRequest=[RestCall getCategoryList:urlStr];
    NSString *request=[NSString stringWithFormat:@"%@", theRequest];
    if ([request isEqualToString:@"0"]) {
        
    }
    else {
        URLConnection *connection=[[URLConnection alloc] initWithMethodNameRequest:theRequest delegate:self identifier:@"MobileNumberVerification"];
        NSLog(@"conn %@",connection);
        
    }
    
    
}
-(void)recivedMobileVerification:(NSMutableData *)data
{
    
    
    
    NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@",responseString);
    
    
    
    
    
    
    
    
    [self performSegueWithIdentifier:@"MoveToVerification" sender:self];
    
    
    
}

@end
