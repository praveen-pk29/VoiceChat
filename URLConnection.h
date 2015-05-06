//
//  URLConnection.h
//  VoiceChat
//
//  Created by mac on 4/20/15.
//  Copyright (c) 2015 Vijai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface URLConnection : NSURLConnection {
	id delgateObject;
    NSMutableData *urlData;
    NSString *setIdentifier;
}

@property(nonatomic,retain)id delgateObject;
@property(nonatomic,retain)NSMutableData *urlData;
@property(nonatomic,retain)NSString *setIdentifier;

- (id) initWithMethodNameRequest:(NSMutableURLRequest *)requestArg delegate:(id)delegateArg identifier:(NSString *)checkIdentity;
- (id) initWithMethodRequest:(NSMutableURLRequest *)requestArg delegate:(id)delegateArg;

@end