//
//  ChatViewController.h
//  VoiceChat
//
//  Created by mac on 3/25/15.
//  Copyright (c) 2015 Vijai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#import "Constants.h"



@interface ChatViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIGestureRecognizerDelegate,AVAudioRecorderDelegate,AVAudioPlayerDelegate>



@property (weak, nonatomic) IBOutlet UIButton *bttnObjMenu;
- (IBAction)bttnActionMenu:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *sliderObjChat;
@property (weak, nonatomic) IBOutlet UIButton *bttnObjShare;
- (IBAction)bttnActionShare:(id)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bttnActionSend;
- (IBAction)bttnActionSend:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imgObjSlected;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewObjGallery;
@property (strong, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;
- (IBAction)longPress:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *txtObjTypeHere;
@property (weak, nonatomic) IBOutlet UIButton *bttnObjSend;
 
@end
