//
//  Utils.h
//  OLXRussia
//
//  Created by Rejo Joseph on 24/03/14.
//  Copyright (c) 2014 Rejo Joseph. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Utils : NSObject{
    
    UIAlertView *alertview;

    
}
+(void) showProgress;
+ (void) hideAlert;
+(void) showAlertMessage:(NSString *)message;
+(BOOL) validateEmail:(NSString *)emailAddress;
+(void)resetToken;
+(NSString *)get_time:(NSString *)param;
@end
