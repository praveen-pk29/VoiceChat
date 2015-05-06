//
//  ContactViewController.h
//  VoiceChat
//
//  Created by mac on 3/30/15.
//  Copyright (c) 2015 Vijai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *bttnObjSettings;
- (IBAction)bttnActionSettings:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *bttnObjBack;
- (IBAction)bttnActionBack:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tblObjContact;

@end
