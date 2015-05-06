//
//  RestCall.h
//  VoiceChat
//
//  Created by mac on 4/20/15.
//  Copyright (c) 2015 Vijai. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Constants.h"

@interface RestCall : NSObject


+(NSMutableURLRequest *)getMainMenuList:(NSString * )urlStr;
//+(NSMutableURLRequest *)getCategoryList:(NSString * )urlStr;

+(NSMutableURLRequest *)postComments:(NSString * )urlStr bodyString:(NSString *)body;
+(NSMutableURLRequest *)getCategoryList:(NSURL * )urlStr;
 
@end

