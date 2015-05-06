//
//  ViewController.m
//  VoiceChat
//
//  Created by mac on 3/19/15.
//  Copyright (c) 2015 Vijai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString * savedCode = [prefs objectForKey:@"LogIn"];
    
    NSString *savedStrCode=[NSString stringWithFormat:@"%@",savedCode];
    
    
    
    
    
    if ([savedStrCode isEqualToString:@"UserLogIn"]) {
        [self performSegueWithIdentifier:@"MoveToChatFromViewC" sender:self];
        
    }
    else{
        [self performSegueWithIdentifier:@"MoveToMobileLogin" sender:self];
        
    }
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
