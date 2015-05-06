//
//  VerificationViewController.m
//  VoiceChat
//
//  Created by mac on 3/20/15.
//  Copyright (c) 2015 Vijai. All rights reserved.
//

#import "VerificationViewController.h"

@interface VerificationViewController ()

@end

@implementation VerificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSString *savedMobileNumber = [prefs stringForKey:@"MobileNumber"];
    
    //    NSInteger savedCode = [prefs integerForKey:@"Code"];
    
    _lblObjMobilenumber.text=[NSString stringWithFormat:@"%@",savedMobileNumber];
    
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

    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSInteger savedCode = [prefs integerForKey:@"Code"];
    
    NSString *savedStrCode=[NSString stringWithFormat:@"%ld",(long)savedCode];
    
    
    if ([savedStrCode isEqualToString:_txtObjCode.text])
        {
        
//     [Utils showAlertMessage:@"You have entered correct code"];

        NSString *url = [NSString stringWithFormat:@"%screate_new.php?u_mobile=%@",localBaseUrl,_lblObjMobilenumber.text];
        
        
        NSURL *urlStr = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
        
        NSMutableURLRequest *theRequest=[RestCall getCategoryList:urlStr];
        NSString *request=[NSString stringWithFormat:@"%@", theRequest];
        if ([request isEqualToString:@"0"]) {
            
        }
        else
        {
            URLConnection *connection=[[URLConnection alloc] initWithMethodNameRequest:theRequest delegate:self identifier:@"StoreNewMobileNumber"];
            NSLog(@"conn %@",connection);
            
        }
    }
    else{
       
        [Utils showAlertMessage:@"Please Enter Correct verification code"];
    }
        [self performSegueWithIdentifier:@"MoveToChat" sender:self];
    
}
//StoreNewMobileNumber

-(void)recivedStoreNewMobileNumber:(NSMutableData *)data
{
    
    
//    
//    NSString *  responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    
//    NSLog(@"%@",responseString);
//    
    
    NSString *valueToSave = @"UserLogIn";
    [[NSUserDefaults standardUserDefaults] setObject:valueToSave forKey:@"LogIn"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    NSError *myError = nil;
    
    
    
    if (data !=nil) {
        id ResponseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves  error:&myError];
        
        if ([[ResponseDict objectForKey:@"status"]isEqualToString:@"Success"]) {
           
        
            
            
            [Utils showAlertMessage:[ResponseDict objectForKey:@"message"]];
            
 

        }
        else{
 
            
            [Utils showAlertMessage:[ResponseDict objectForKey:@"message"]];

        }
        
        
    }
    [self performSegueWithIdentifier:@"MoveToChat" sender:self];

}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//- (IBAction)bttnActionNext:(id)sender {
//    
//    [self performSegueWithIdentifier:@"MoveToChat" sender:self];
//
// }
@end
