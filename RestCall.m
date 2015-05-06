 
//
//  RestCall.h
//  VoiceChat
//
//  Created by mac on 4/20/15.
//  Copyright (c) 2015 Vijai. All rights reserved.
//
#import "RestCall.h"


@implementation NSURLRequest(DataController)
+ (BOOL)allowsAnyHTTPSCertificateForHost:(NSString *)host
{
	return YES;
}
@end


@implementation RestCall

NSMutableURLRequest *theRequest;

+(NSMutableURLRequest *)getMainMenuList:(NSString * )urlStr{
    NSString *urlString=urlStr;
    NSLog(@"urlString:%@",urlString);
    theRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    [theRequest setHTTPMethod:@"GET"];
   	return theRequest;
}

+(NSMutableURLRequest *)getCategoryList:(NSURL * )urlStr;
{
    NSURL *urlString=urlStr;
    NSLog(@"urlString:%@",urlString);
    theRequest = [NSMutableURLRequest requestWithURL:urlString];
    [theRequest setHTTPMethod:@"GET"];
    return theRequest;
}


+(NSMutableURLRequest *)postComments:(NSString * )urlStr bodyString:(NSString *)body {
    
    theRequest = [NSMutableURLRequest requestWithURL:
                  [NSURL URLWithString:urlStr]];
    
    [theRequest setTimeoutInterval:30.0f];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    
    
   	return theRequest;
    
}

 

@end
