//
//  ContactViewController.m
//  VoiceChat
//
//  Created by mac on 3/30/15.
//  Copyright (c) 2015 Vijai. All rights reserved.
//

#import "ContactViewController.h"

#define contactName 1101
#define contactStatus 1102
#define contactImage 1100
@interface ContactViewController (){
    NSMutableArray *holeList;
}

@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    holeList=[[NSMutableArray alloc]initWithObjects:@"Vijai",@"Ramesh",@"Suresh",@"Francis",@"Hamil",@"Sandy",@"Sivaji",@"MGR",@"Google",@"Dummy",@"Crush", nil];
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    
    
 
        
        return [holeList count];
    
    
    
    
    
    
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
   
        return 70;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    static NSString *MyIdentifier ;
    
    
        MyIdentifier = @"ContactTable";
        
        UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        UILabel *nameLbl = (UILabel *) [cell viewWithTag:contactName];
        UILabel *statusLbl = (UILabel *) [cell viewWithTag:contactStatus];

        UIImageView *img=(UIImageView *)[cell viewWithTag:contactImage];
            nameLbl.text = [holeList objectAtIndex:indexPath.row];
            statusLbl.text=[NSString stringWithFormat:@"Status %ld",(long)indexPath.row];
    
            img.image=[UIImage imageNamed:[NSString stringWithFormat:@"Profile-hdpi.png"]];
        
        return cell;
        
        
   
    
    
    
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath   *)indexPath
{
    [self performSegueWithIdentifier:@"MoveToChatroom" sender:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)bttnActionSettings:(id)sender {
}
- (IBAction)bttnActionBack:(id)sender {
}
@end
