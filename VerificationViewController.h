//
//  VerificationViewController.h
//  VoiceChat
//
//  Created by mac on 3/20/15.
//  Copyright (c) 2015 Vijai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@interface VerificationViewController : UIViewController
- (IBAction)bttnActionNext:(id)sender;
 @property (weak, nonatomic) IBOutlet UILabel *lblObjMobilenumber;
@property (weak, nonatomic) IBOutlet UITextField *txtObjCode;
-(void)recivedStoreNewMobileNumber:(NSMutableData *)data;
@end
