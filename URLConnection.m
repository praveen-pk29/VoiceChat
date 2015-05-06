 
//
//  URLConnection.h
//  VoiceChat
//
//  Created by mac on 4/20/15.
//  Copyright (c) 2015 Vijai. All rights reserved.
//
#import "URLConnection.h"


@implementation URLConnection
@synthesize delgateObject,urlData;
@synthesize setIdentifier;


- (id) initWithMethodNameRequest:(NSMutableURLRequest *)requestArg delegate:(id)delegateArg identifier:(NSString *)checkIdentity{
    self = [super initWithRequest:requestArg delegate:self];
    setIdentifier=checkIdentity;
    if (self != nil) {
        self.delgateObject=delegateArg;
    }
    return self;
}

- (id) initWithMethodRequest:(NSMutableURLRequest *)requestArg delegate:(id)delegateArg{
    self = [super initWithRequest:requestArg delegate:self];
    if (self != nil) {
        self.delgateObject=delegateArg;
    }
    return self;
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
   if ([setIdentifier isEqualToString:@"MobileNumberVerification"]) {
        [self.delgateObject recivedMobileVerification:urlData];
    }
    
   else if ([setIdentifier isEqualToString:@"StoreNewMobileNumber"]){
       [self.delgateObject recivedStoreNewMobileNumber:urlData];
   }
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:
(NSError *)error
{
    
   // NSString *localerror=[error localizedDescription];
    //NSString *strerror=NSLocalizedString(localerror, nil);
    if (![setIdentifier isEqualToString:@"synchrequest"]){
    }
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	if(!urlData){
        urlData = [[NSMutableData alloc] init];
        [urlData setLength:0];
    }
    [urlData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[urlData setLength:0];
}


@end
