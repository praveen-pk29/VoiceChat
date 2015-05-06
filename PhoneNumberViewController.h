//
//  PhoneNumberViewController.h
//  VoiceChat
//
//  Created by mac on 3/20/15.
//  Copyright (c) 2015 Vijai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"


@interface PhoneNumberViewController : UIViewController
- (IBAction)bttnActionNext:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *txtObjCountryCOde;
@property (weak, nonatomic) IBOutlet UITextField *txtObjCode;
@property (weak, nonatomic) IBOutlet UITextField *txtObjPhoneNumber;
@property (weak, nonatomic) IBOutlet UIButton *bttnObjNext;
-(void)recivedMobileVerification:(NSMutableData *)data;
@end
