//
//  InviteTableViewController.m
//  WUEmoticonsKeyboardDemo
//
//  Created by Star_Venus on 4/24/16.
//  Copyright © 2016 YuAo. All rights reserved.
//

#import "InviteTableViewController.h"
#import <MessageUI/MessageUI.h>
#import "InviteTableViewCell.h"
#import "Invite.h"

@interface InviteTableViewController ()

@property (retain, nonatomic) NSURLConnection *connection;
@property (retain, nonatomic) NSMutableData   *receivedData;
@property (nonatomic, strong) NSMutableArray  *userData;
@property (nonatomic, strong) NSMutableArray  *searchResult;


@end

//@synthesize receivedData = _receivedData;

    NSString  *body;
    NSString  *inviteMesaage;
    NSArray   *inviteEmail;
    NSString  *userEmail;
    NSInteger *userCount;

@implementation InviteTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    userEmail = @"someone@hotmail.com";
    inviteMesaage = @"Hello! Nice to meet you. Please contact me.";
    inviteEmail = @[@"Hideki222@outlook.com"];
    
//    *********** SEARCH_BAR ***********
    
    self.userData = [NSMutableArray arrayWithCapacity:2];
    self.searchResult = [NSMutableArray arrayWithCapacity:[self.userData count]];
    
    for (int i=0  ; i<5;i++) {
        
        Invite *userItem = [[Invite alloc] init];
        userItem.title = @"venus";
        userItem.image = @"icon_user_1.png";
        [self.userData addObject:userItem];
    }
    
    self.searchResult = [NSMutableArray arrayWithCapacity:[self.userData count]];

}

     // *********** SEARCH_BAR(Creating Dynamic TableView) ***********

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView

{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return [self.searchResult count];
    }
    else
    {
        return [self.userData count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"InviteTableCell";
    InviteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil)
    {
        cell = [[InviteTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        //Invite *userItem = (self.userData)[indexPath.row];
        //cell.textLabel.text = [self.searchResult objectAtIndex:indexPath.row];
        cell.userNameLabel.text = [self.searchResult objectAtIndex:indexPath.row];
    }
    
    else
    {
        //cell.textLabel.text = self.userData[indexPath.row];
        Invite *userItem = (self.userData)[indexPath.row];
        cell.userNameLabel.text = userItem.title;
        cell.userImage.image = [UIImage imageNamed:userItem.image];
    }
    return cell;
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    [self.searchResult removeAllObjects];
    
    
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@", searchText];
    
    self.searchResult = [NSMutableArray arrayWithArray: [self.userData filteredArrayUsingPredicate:resultPredicate]];
    //self.searchResult = [self.userData filterUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
}

//*******************   SEARCH_BAR Delegate ************************



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)InviteBtn:(id)sender {
    
    mailComposer = [[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate = self;
    [mailComposer setSubject:@"Invite Email"];
    [mailComposer setToRecipients:inviteEmail];
    [mailComposer setMessageBody:inviteMesaage isHTML:NO];
    [self presentViewController:mailComposer animated:YES completion:nil];
    
}

#pragma mark - mail compose delegate

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
   
    if (result){
        
        NSLog(@"Result :%d",result);
        
        if(result ==1){
            NSLog(@"Save on the draft");
        }
        else{
            
            NSLog(@"SUCCESS TO SEND ");
            
            [self.connection cancel];
            //initialize new mutable data
            NSMutableData *data = [[NSMutableData alloc] init];
            self.receivedData = data;
            //initialize url that is going to be fetched.
            NSURL *url = [NSURL URLWithString:@"http://localhost/chat_api/Invite.php"];
            //initialize a request from url
            NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
            //set http method
            [request setHTTPMethod:@"POST"];
            //initialize a post data
            NSString *postData = [NSString stringWithFormat:@"userEmail=%@&inviteEmail=%@&inviteMessage=%@",userEmail,inviteEmail, inviteMesaage];
            
            NSLog(@"%@",userEmail);
            NSLog(@"%@",inviteEmail);
            NSLog(@"%@",inviteMesaage);
            
            //set request content type we MUST set this value.
            [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
            
            //set post data of request
            [request setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
            
            //initialize a connection from request
            NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
            NSLog(@"%@",connection);
            
            self.connection = connection;
            
            //start the connections
            [connection start];
            
            }
    }
    if (error) {
        
        NSLog(@"Error :%@",error);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    
    [self.receivedData appendData:data];
    body = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Response Body:\n%@\n", body);
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    NSLog(@"%@", error);
    NSLog(@"Connection could not be made");
    NSLog(@"%@",body);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                    message:@"Can't connect to server!"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSLog(@"Connection Success");
    NSLog(@"%@",body);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                    message:@"Invite message sent to your friend!"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];

}

@end
