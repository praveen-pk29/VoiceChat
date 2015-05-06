//
//  ChatViewController.m
//  VoiceChat
//
//  Created by mac on 3/25/15.
//  Copyright (c) 2015 Vijai. All rights reserved.
//

#import "ChatViewController.h"
#import "DBhelper.h"
#import "FMDatabase.h"

#define lblObjCell 1000

@interface ChatViewController (){
    
    NSMutableArray *ResponseArray;
    NSMutableArray *arrObjHole;
    
    NSMutableDictionary *dictObjHole;
    
    AVAudioRecorder *recorder;
    AVAudioPlayer *player;
    FMDatabase *database1;
    NSString *Recorded_voice;
}

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    database1=[[FMDatabase alloc]init];
    database1 = [FMDatabase databaseWithPath:dbPath];
    [self Voice_record];
//    int i;
    
    
    dictObjHole=[[NSMutableDictionary alloc]init];
    
    
    
    NSArray *arrObjBab=[NSArray arrayWithObjects:@"baby listening",@"baby talking",@"babywalking",nil];
    NSArray *arrObjCat=[NSArray arrayWithObjects:@"CAT SHAKIN EARS",@"LISTNIN CAT",@"TALKIN CAT",nil];

    NSArray *arrObjChipmunk=[NSArray arrayWithObjects:@"CHIP TALKIN",@"chipmunk heaRING",@"chipmunk sleepijn",nil];

    NSArray *arrObjDrunk=[NSArray arrayWithObjects:@"drunk man listening",@"drunk man thallaadifying",@"man speakin",nil];

    NSArray *arrObjGhost=[NSArray arrayWithObjects:@"ghost listenng",@"ghost roaming",@"ghost talkihn",nil];

    NSArray *arrObjMouse=[NSArray arrayWithObjects:@"mouse eating",@"mouse listening",@"mouse speakin",nil];

    NSArray *arrObjParrot=[NSArray arrayWithObjects:@"parrot listening",@"parrot reading",@"parrot talking",nil];

    
//    NSArray *keyarr=[NSArray arrayWithObjects:@"currentUser",@"favoritesCount",@"followerCount",@"followingStatus",@"imageurl",@"likeCount",@"photoCount",@"profileUserId",@"userName",@"viewCount",nil];
//    NSMutableDictionary *questionDict = [NSMutableDictionary dictionaryWithObjects:arrObjBab forKeys:@"Baby"];
    
    arrObjHole=[[NSMutableArray alloc]initWithObjects:arrObjBab,arrObjCat,arrObjChipmunk,arrObjDrunk,arrObjGhost,arrObjMouse,arrObjParrot, nil];
    
    
 
    
    NSLog(@"HoleArray : %@",arrObjHole);
    
    
   
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"babywalking" withExtension:@"gif"];
    _imgObjSlected.image = [UIImage animatedImageWithAnimatedGIFData:[NSData dataWithContentsOfURL:url]];
    
    ResponseArray =[[NSMutableArray alloc]init];
    
//        for ( i=0; i<=12; i++) {
//            [ResponseArray  addObject:[NSNumber numberWithInt:i] ];
//        }
    
    [ResponseArray addObject:@"Bab.jpg"];
    [ResponseArray addObject:@"Cat.jpg"];
    [ResponseArray addObject:@"Ghost.jpg"];
    [ResponseArray addObject:@"Parrot.jpg"];
    [ResponseArray addObject:@"Rat.jpg"];
    [ResponseArray addObject:@"Man.jpg"];
    [ResponseArray addObject:@"Chipmunk.jpg"];
    
    [ResponseArray addObject:@"Bab.jpg"];
    [ResponseArray addObject:@"Cat.jpg"];
    [ResponseArray addObject:@"Ghost.jpg"];
    [ResponseArray addObject:@"Parrot.jpg"];
    [ResponseArray addObject:@"Rat.jpg"];
    [ResponseArray addObject:@"Man.jpg"];
    [ResponseArray addObject:@"Chipmunk.jpg"];
    
    _collectionViewObjGallery.delegate = self;
    _collectionViewObjGallery.dataSource = self;
    
    //    [_collectionViewObjGallery registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"GalleryCell"];
    
    
    
    _flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [_flowLayout setItemSize:CGSizeMake(_collectionViewObjGallery.frame.size.width, _collectionViewObjGallery.frame.size.height)];
    
    
    [_flowLayout setMinimumInteritemSpacing:0.0f];
    [_flowLayout setMinimumLineSpacing:0.0f];
    
    
    
    [_flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [_collectionViewObjGallery setBounces:YES];
    [_collectionViewObjGallery setCollectionViewLayout:_flowLayout];
    
    [_collectionViewObjGallery setPagingEnabled:YES];
    
    
    // Do any additional setup after loading the view.
}

-(void)Voice_record
{
   
    
    // Set the audio file
    NSArray *pathComponents = [NSArray arrayWithObjects:
                               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject],
                               @"MyAudioMemo.m4a",
                               nil];
    NSURL *outputFileURL = [NSURL fileURLWithPathComponents:pathComponents];
    
    // Setup audio session
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    // Define the recorder setting
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    // Initiate and prepare the recorder
    recorder = [[AVAudioRecorder alloc] initWithURL:outputFileURL settings:recordSetting error:NULL];
    recorder.delegate = self;
    recorder.meteringEnabled = YES;
    [recorder prepareToRecord];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)bttnActionMenu:(id)sender
{
    
}
- (IBAction)bttnActionShare:(id)sender
{
    
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    
    return [ResponseArray count];
    
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    
    return 1;
}
 
- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [_collectionViewObjGallery setContentOffset:CGPointZero animated:YES];
    
    UICollectionViewCell *cell = (UICollectionViewCell*)[cv dequeueReusableCellWithReuseIdentifier:@"GalleryCell" forIndexPath:indexPath];
    
    
    cell.layer.shouldRasterize = YES;
    cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
     UIImageView *imgObjGallery = (UIImageView *) [cell viewWithTag:lblObjCell];
    
     
    
    imgObjGallery.image=[UIImage imageNamed: [NSString stringWithFormat:@"%@",[ResponseArray objectAtIndex:indexPath.row]]];
    
    
    return cell;
    
}
- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    return layoutAttributes;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize retval = CGSizeMake(100, 100);
    return retval;
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:[[arrObjHole objectAtIndex:indexPath.row] objectAtIndex:0] withExtension:@"gif"];
    _imgObjSlected.image = [UIImage animatedImageWithAnimatedGIFData:[NSData dataWithContentsOfURL:url]];

}


//if(UIGestureRecognizerStateBegan == gestureRecognizer.state)
//{
//    // Called on start of gesture, do work here
//    
//}
//
//if(UIGestureRecognizerStateChanged == gestureRecognizer.state)
//{
//    // Do repeated work here (repeats continuously) while finger is down
//}
//
//if(UIGestureRecognizerStateEnded == gestureRecognizer.state)
//{
//    // Do end work here when finger is lifted
//   
//}


- (IBAction)bttnActionSend:(id)sender
{
    
    [self performSegueWithIdentifier:@"MoveToContact" sender:self];

}
- (IBAction)longPress:(id)sender
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:[[arrObjHole objectAtIndex:0] objectAtIndex:2] withExtension:@"gif"];
    _imgObjSlected.image = [UIImage animatedImageWithAnimatedGIFData:[NSData dataWithContentsOfURL:url]];
    
    UILongPressGestureRecognizer *lpHandler = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    lpHandler.minimumPressDuration = 1; //seconds
    lpHandler.delegate = self;

    //myUIImageViewInstance - replace for your instance/variable name
    [_imgObjSlected addGestureRecognizer:lpHandler];
        NSLog(@"Start");
}

-  (void)handleLongPress:(UILongPressGestureRecognizer*)sender {
    
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        [self stop_record];
        NSLog(@"Stop");
        
        //Do Whatever You want on End of Gesture
    }
    else if (sender.state == UIGestureRecognizerStateBegan){
        [self start_record];
        NSLog(@"Start");
        //Do Whatever You want on Began of Gesture
    }
}

- (IBAction)singleTap:(id)sender
{
    [_imgObjSlected setUserInteractionEnabled:YES];
    UITapGestureRecognizer *singleTap =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapping:)];
    [singleTap setNumberOfTapsRequired:1];
    [_imgObjSlected addGestureRecognizer:singleTap];
}

-(void)singleTapping:(UIGestureRecognizer *)recognizer
{
    [self Play_record];
    NSLog(@"actionHandleTapOnImageView");
}
-(void)start_record
{
    if (player.playing)
    {
        [player stop];
    }
    
    if (!recorder.recording) {
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:nil];
        
        // Start recording
        [recorder record];
       // [recordPauseButton setTitle:@"Pause" forState:UIControlStateNormal];
        
    } else {
        
        // Pause recording
        [recorder pause];
       // [recordPauseButton setTitle:@"Record" forState:UIControlStateNormal];
    }

}

-(void)stop_record
{
    [recorder stop];
    [self Store_recording];
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setActive:NO error:nil];

}
-(void)Play_record
{
    if (!recorder.recording){
        [self retrive_recording];
        NSURL *Db_data=[NSURL URLWithString:Recorded_voice];
        // player = [[AVAudioPlayer alloc] initWithContentsOfURL:recorder.url error:nil];
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:Db_data error:nil];
        [player setDelegate:self];
        [player play];
    } 

}

-(void)Store_recording
{
    NSLog(@"%@",dbPath);
    database1 = [FMDatabase databaseWithPath:dbPath];
    
    [database1 open];
    //NSString *query=[NSString stringWithFormat:@"insert into Speciality_data (Speciality) Values (%@) Where serial='1'",[NSString stringWithFormat:@"%@",recorder.url],nil];
    NSString *query=[NSString stringWithFormat:@"UPDATE Voice_data SET Voice_recorded='%@' Where serial='1'",[NSString stringWithFormat:@"%@",recorder.url],nil];
    FMResultSet *result=[database1 executeQuery:query];
    
    if ([result next])
        
    {
        NSLog(@"Error");
    }
    else
    {
        NSLog(@"Updated");
    }
    [database1 close];
    
}

-(void)retrive_recording
{
    database1 = [FMDatabase databaseWithPath:dbPath];
    
    [database1 open];
    NSString *query=[NSString stringWithFormat:@"SELECT Voice_recorded FROM Voice_data where serial='1'",nil];
    FMResultSet *result=[database1 executeQuery:query];
    
    NSLog(@"%@",result);
    
    
    while([result next])
    {
        Recorded_voice=[NSString stringWithFormat:@"%@",[result stringForColumn:@"Voice_recorded"]];
    }
    NSLog(@"%@",Recorded_voice);
    [database1 close];
}
- (void) audioRecorderDidFinishRecording:(AVAudioRecorder *)avrecorder successfully:(BOOL)flag
{
    
}

- (void) audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Done"
                                                    message: @"Finish playing the recording!"
                                                   delegate: nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
