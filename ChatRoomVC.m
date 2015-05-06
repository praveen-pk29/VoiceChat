//
//  ChatRoomVC.m
//  VoiceChat
//
//  Created by PasumaiSolutions on 4/20/15.
//  Copyright (c) 2015 Vijai. All rights reserved.
//

#import "ChatRoomVC.h"
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width
@interface ChatRoomVC ()<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic)IBOutlet UITableView *chatTblView;

@end

@implementation ChatRoomVC
{
    UITextField *textingField;
    NSMutableDictionary *chatText;
    NSMutableArray *array;
    UILabel *chatLabel;
    NSDictionary *resultL;
    NSDictionary *resultR;
}
@synthesize chatTblView;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    array=[NSMutableArray new];
    chatText=[[NSMutableDictionary alloc]init];
    resultL=[[NSDictionary alloc]init];
    resultR=[[NSDictionary alloc]init];
    resultL = @{@"UsernameL":@"Hi"};
    resultR = @{@"UsernameR":@"Bye"};
    for(int i=0;i<10;i++)
    {
        if(i%2==0)
        {
        [array addObject:resultL];
        }
        else
        {
        [array addObject:resultR];
        }
    }
   
    [chatText setObject:array forKey:@"user"];

    chatTblView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    CGPoint offset=CGPointMake(0,0);
    [self BottomButtonCreate:offset];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keyboardOnScreen:) name:UIKeyboardDidShowNotification object:nil];
    [center addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [center addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*~~~~~~~~~~~~~~~~Create a button textfield with button view~~~~~~~~~~~*/
-(void)BottomButtonCreate:(CGPoint)offset
{
    /*~~~~Basic View contain all components~~~~~~~~~*/
    UIView *containView=[[UIView alloc]initWithFrame:CGRectMake(offset.x, offset.y+(self.view.frame.size.height-50), 320, 50)];
    containView.backgroundColor=[UIColor orangeColor];
   
    /*~~~~Chatter Textfield~~~~~~~*/
    textingField=[[UITextField alloc]initWithFrame:CGRectMake(30,3,180,40)];
    textingField.layer.borderWidth=1.0f;
    textingField.layer.borderColor=[[UIColor whiteColor]CGColor];
    textingField.layer.cornerRadius=5.0f;
    textingField.delegate=self;
    
    /*~~~~camera and voice record button~~~~~~~*/
    UIButton *ChatAccessory = [UIButton buttonWithType:UIButtonTypeCustom];
    ChatAccessory.frame = CGRectMake(220,3,40,40);
    [ChatAccessory setImage:[UIImage imageNamed:@"send_icon.png"] forState:UIControlStateNormal];
    ChatAccessory.backgroundColor=[UIColor whiteColor];
    [ChatAccessory addTarget:self action:@selector(ChatAccessory_action:) forControlEvents:UIControlEventTouchUpInside];
    ChatAccessory.layer.borderColor=[[UIColor whiteColor]CGColor];
    ChatAccessory.layer.borderWidth=1.0f;
    ChatAccessory.layer.shadowColor=[[UIColor whiteColor]CGColor];
    ChatAccessory.layer.cornerRadius=ChatAccessory.bounds.size.width/2.0;
    ChatAccessory.layer.masksToBounds=YES;
    
    
    
    UIButton *micAccessory = [UIButton buttonWithType:UIButtonTypeCustom];
    micAccessory.frame = CGRectMake(270,3,40,40);
    [micAccessory setImage:[UIImage imageNamed:@"mic.png"] forState:UIControlStateNormal];
    //micAccessory.transform = CGAffineTransformMakeRotation(180.0*M_PI/180.0);
    micAccessory.backgroundColor=[UIColor whiteColor];
    [micAccessory addTarget:self action:@selector(micAccessory_action:) forControlEvents:UIControlEventTouchUpInside];
    micAccessory.layer.borderWidth=1.0f;
    micAccessory.layer.borderColor=[[UIColor whiteColor]CGColor];
    micAccessory.layer.cornerRadius=micAccessory.bounds.size.width/2.0;
    
    
    containView.tag=506;
    containView.backgroundColor=[UIColor orangeColor];
    
    [containView addSubview:textingField];
    [containView addSubview:ChatAccessory];
    [containView addSubview:micAccessory];
    [self.view addSubview:containView];
    
}
int yax;
-(IBAction)ChatAccessory_action:(id)sender
{
   
    if([textingField.text length]>0)
    {
    resultL = @{@"UsernameL":textingField.text};
    [array addObject:resultL];
    [chatText setObject:array forKey:@"user"];
    [chatTblView reloadData];
    textingField.text=@"";
    int lastRowNumber = [[chatText objectForKey:@"user"]count]-1;
    NSIndexPath* ip = [NSIndexPath indexPathForRow:lastRowNumber inSection:0];
    [chatTblView scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionTop animated:NO];
    }
}
-(IBAction)micAccessory_action:(id)sender
{
   // if ([scrolltouch viewWithTag:506])
   // {
        //[[scrolltouch viewWithTag:506] removeFromSuperview];
   // }
    
}

-(IBAction)send_btn_action:(id)sender
{
    
    NSString *enterString = [(UITextField *)[self.view viewWithTag:5005] text];
    if([enterString length]>0)
    {
    resultL = @{@"UsernameL":enterString};
    [array addObject:resultL];
    [chatText setObject:array forKey:@"user"];
    [chatTblView reloadData];
   // [self createTextChattingLabel:enterString Yaxis:yax];
    textingField.text=@"";
    [(UITextField *)[self.view viewWithTag:5005] setText:@""];
    int lastRowNumber = [[chatText objectForKey:@"user"]count]-1;
    NSIndexPath* ip = [NSIndexPath indexPathForRow:lastRowNumber inSection:0];
    [chatTblView scrollToRowAtIndexPath:ip atScrollPosition:UITableViewScrollPositionTop animated:NO];
    }
}


#pragma keyboard recongization Methods

- (void)keyboardDidShow: (NSNotification *) notif{
    
}
- (void)keyboardDidHide: (NSNotification *) notif{
    NSString *enterString = [(UITextField *)[self.view viewWithTag:5005] text];
    textingField.text=enterString;
    /*~~~~keyboardDidHide After remove the view with textfield and button~~~~~*/
    [self removeKeyboardWithTextField];
    self.view.frame=CGRectMake(0, 0,WIDTH,HEIGHT);
}

-(void)keyboardOnScreen:(NSNotification *)notification
{
    NSDictionary *info  = notification.userInfo;
    NSValue      *value = info[UIKeyboardFrameEndUserInfoKey];
    CGRect rawFrame      = [value CGRectValue];
    CGRect keyboardFrame = [self.view convertRect:rawFrame fromView:nil];
    //NSLog(@"keyboardFrame: %@", NSStringFromCGRect(rawFrame));
    /*~~~~~~~~Return Keyboard with textfield and send button~~~*/
    [self keyboardTopTextfield:keyboardFrame];
    self.view.frame=CGRectMake(0, 0, keyboardFrame.size.width, keyboardFrame.size.height+50);
}

-(void)keyboardTopTextfield :(CGRect )rect
{
    rect.origin.y=rect.size.height;
    rect.size.height=50;
    if ([self.view viewWithTag:1001])
    {
        [[self.view viewWithTag:1001] removeFromSuperview];
    }
    
    UIButton *send_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    send_btn.frame = CGRectMake(220,3,40,40);
    [send_btn setImage:[UIImage imageNamed:@"send_icon.png"] forState:UIControlStateNormal];
    send_btn.backgroundColor=[UIColor whiteColor];
    [send_btn addTarget:self action:@selector(send_btn_action:) forControlEvents:UIControlEventTouchUpInside];
    send_btn.layer.borderColor=[[UIColor whiteColor]CGColor];
    send_btn.layer.borderWidth=1.0f;
    send_btn.layer.shadowColor=[[UIColor whiteColor]CGColor];
    send_btn.layer.cornerRadius=send_btn.bounds.size.width/2.0;
    send_btn.layer.masksToBounds=YES;
    
    UIView *keyboardTopView = [[UIView alloc] initWithFrame:rect];
    keyboardTopView.tag=1001;
    keyboardTopView.backgroundColor=[UIColor orangeColor];
    
    UITextField *textingFieldTemp=[[UITextField alloc]initWithFrame:CGRectMake(10,3,200,40)];
    textingFieldTemp.layer.borderWidth=1.0f;
    textingFieldTemp.layer.borderColor=[[UIColor whiteColor]CGColor];
    textingFieldTemp.layer.cornerRadius=5.0f;
    textingFieldTemp.delegate=self;
    textingFieldTemp.tag=5005;
    [textingFieldTemp becomeFirstResponder];
    
    
    [keyboardTopView addSubview:textingFieldTemp];
    [keyboardTopView addSubview:send_btn];
    
    [self.view addSubview:keyboardTopView];
}

-(void)removeKeyboardWithTextField
{
    if ([self.view viewWithTag:1001])
    {
        [[self.view viewWithTag:1001] removeFromSuperview];
    }
    
}


#pragma tableview delegate methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [[chatText objectForKey:@"user"] count];
 
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str;
    NSArray *result=[chatText objectForKey:@"user"];
    NSArray *checkStr=[[result objectAtIndex:indexPath.row]allKeys];
    if([[checkStr objectAtIndex:0] isEqualToString:@"UsernameL"])
    {
        str=[[result objectAtIndex:indexPath.row]objectForKey:@"UsernameL"];
    }
    else
    {
        str=[[result objectAtIndex:indexPath.row]objectForKey:@"UsernameR"];
    }
    
    CGSize size = [str sizeWithFont:[UIFont fontWithName:@"Helvetica" size:12] constrainedToSize:CGSizeMake(280,999) lineBreakMode:NSLineBreakByCharWrapping];
    // NSLog(@"%f",size.height);
    return size.height + 20;
    
    // return  90.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   static NSString *MyIdentifier ;
    MyIdentifier = @"cell";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    }
    cell.selectionStyle=UITableViewCellSelectionStyleGray;
    cell.backgroundColor = [UIColor clearColor];
    
    NSArray *result=[chatText objectForKey:@"user"];
    NSArray *checkStr=[[result objectAtIndex:indexPath.row]allKeys];
    if([[checkStr objectAtIndex:0] isEqualToString:@"UsernameL"])
    {
        cell.textLabel.text=[[result objectAtIndex:indexPath.row]objectForKey:@"UsernameL"];
        cell.textLabel.textAlignment=NSTextAlignmentRight;
    }
    else
    {
        cell.textLabel.text=[[result objectAtIndex:indexPath.row]objectForKey:@"UsernameR"];
        cell.textLabel.textAlignment=NSTextAlignmentLeft;
    }
    cell.textLabel.numberOfLines=0;
    cell.textLabel.lineBreakMode=NSLineBreakByCharWrapping;

    return cell;

}


-(NSString *)getText:(NSInteger)row
{
    NSString *resultStr;
    NSArray *result=[chatText objectForKey:@"user"];
    NSArray *checkStr=[[result objectAtIndex:row]allKeys];
    if([[checkStr objectAtIndex:0] isEqualToString:@"UsernameL"])
    {
        resultStr=[[result objectAtIndex:row]objectForKey:@"UsernameL"];
        
    }
    else
    {
        resultStr=[[result objectAtIndex:row]objectForKey:@"UsernameR"];
        
    }
    return resultStr;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIPasteboard *pb = [UIPasteboard generalPasteboard];
    [pb setString:[self getText:indexPath.row]];
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

/*
 UIPasteboard *pb = [UIPasteboard generalPasteboard];
 [pb setString:[textView text]];
 */



#pragma TextField delegate Methods

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


-(void)viewWillDisappear:(BOOL)animated{
    [chatText removeAllObjects];
    [array removeAllObjects];
    chatLabel=nil;
    textingField=nil;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
