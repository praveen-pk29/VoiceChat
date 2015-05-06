//
//  SearchCategoryCell.h
//  OLXRussia
//
//  Created by Rejo Joseph on 24/03/14.
//  Copyright (c) 2014 Rejo Joseph. All rights reserved.
//


#import "Utils.h"
#define APP_NAME @"VoiX"
#define ACTIVITY_TAG 500
UIAlertView *alertview;


@implementation Utils


+(void)showProgress
{
	alertview = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Loading...", @"") message:nil
                                          delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    
	UIActivityIndicatorView *indicator=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
	[indicator setFrame:CGRectMake(120.0, 50.0, 30.0, 30.0)];
	indicator.tag=ACTIVITY_TAG;
	[alertview addSubview:indicator];
	[indicator startAnimating];
	[alertview show];
}

+ (void) hideAlert
{
	if(alertview!=nil&& [alertview isKindOfClass:[UIAlertView class]] ){
		if([alertview viewWithTag:ACTIVITY_TAG]){
			UIActivityIndicatorView *indicator=(UIActivityIndicatorView *)[alertview viewWithTag:500];
			[indicator stopAnimating];
		}
		[alertview dismissWithClickedButtonIndex:0 animated:YES];
		alertview=nil;
	}
}



+(void)showAlertMessage:(NSString *)message
{
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(APP_NAME, "") message:message
												   delegate:self cancelButtonTitle:NSLocalizedString(@"OK", @"")  otherButtonTitles:nil];
    [alert show];
    
}

+(BOOL) validateEmail:(NSString *)emailAddress
{
    NSString *emailRegex = @"^([a-zA-Z0-9_\\-\\.]+)@[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,3})$";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return  [emailTest evaluateWithObject:emailAddress];
}

+(void)resetToken {
    
    
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [defs dictionaryRepresentation];
    for (id key in dict) {
        [defs removeObjectForKey:key];
    }
    [defs synchronize];
    NSLog(@"TOKEN%@", dict);
}

+(NSString *)get_time:(NSString *)param{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    NSDateFormatter *formatterZone=[[NSDateFormatter alloc]init];
    
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    [formatterZone setTimeZone:[NSTimeZone timeZoneWithName:[[NSTimeZone localTimeZone] name]]];
    
    [formatter setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    [formatterZone setDateFormat:@"dd-MM-yyyy HH:mm:ss"];
    
    
    NSDate *localDate =[formatter dateFromString:param];
    // NSString *ActivityTime =[formatterZone stringFromDate:localDate];
    NSDate *dateValue = [NSDate date];
    int ti = [dateValue timeIntervalSinceDate:localDate];
    NSString * updatedTimeText;
    
    
    int totalTime;
    if (ti<60){
        updatedTimeText= ceil(ti)<=1.0 ? @"1s ago" : [[NSString stringWithFormat:@"%d",ti] stringByAppendingString:@"s ago"];
        
    }
    else if (ti>60 && ti<3600){
        totalTime=(ti/60);
        NSString *min= totalTime<=1 ? @"m ago" : @"m ago";
        updatedTimeText=[[NSString stringWithFormat:@"%d",totalTime] stringByAppendingString:min];
    }
    else if (ti>3600 && ti<86400){
        totalTime=(ti/3600);
        NSString *hour= totalTime<=1 ? @"h ago" : @"h ago";
        updatedTimeText=[[NSString stringWithFormat:@"%d",totalTime] stringByAppendingString:hour];
    }
    else{
        totalTime=(ti/86400);
        updatedTimeText= totalTime<=1 ? [[NSString stringWithFormat:@"%d",totalTime] stringByAppendingString:@"d ago"] : totalTime>1 ?  [[NSString stringWithFormat:@"%d",totalTime] stringByAppendingString:@"d ago"] : [[NSString stringWithFormat:@"%d",totalTime] stringByAppendingString:@"d ago"];
    }
    
    return updatedTimeText;
    
}


@end