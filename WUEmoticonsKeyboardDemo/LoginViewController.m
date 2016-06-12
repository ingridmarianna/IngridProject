//
//  LoginViewController.m
//  WUEmoticonsKeyboardDemo
//
//  Created by akira on 5/12/16.
//  Copyright (c) 2016 YuAo. All rights reserved.
//

#import "LoginViewController.h"
#import "ContactsTableViewController.h"

@interface LoginViewController ()

@property (retain, nonatomic) NSURLConnection *connection;
@property (retain, nonatomic) NSMutableData *receivedData;


@end

@implementation LoginViewController

@synthesize receivedData = _receivedData;

            NSString* body;
            NSString* email;
            NSString* password;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnLogin:(id)sender {

//    NSString *email = self.txtUserEmail.text;
//    NSString *password = self.txtUserPassword.text;
    
    email = @"aaa";
    password = @"aaa";
    
    if ([email isEqualToString:@""]||[password isEqualToString:@""]) {
        NSLog(@"Please input user infomation");
        //alert(@"Please input user infomation");
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                        message:@"Please input user infomation."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    } else {
 
        [self.connection cancel];
        
        //initialize new mutable data
        
        NSMutableData *data = [[NSMutableData alloc] init];
        
        self.receivedData = data;
        
        //initialize url that is going to be fetched.
        NSURL *url = [NSURL URLWithString:@"http://localhost/chat_api/login.php"];
        //NSURL *url = [NSURL URLWithString:@"http://www.onestopfeast.com/urban_feast/Kostas_api/login_api.php"];
        //NSURL *url = [NSURL URLWithString:@"http://localhost/Kostas_api/login_api.php"];
        
        //initialize a request from url
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
        
        //set http method
        [request setHTTPMethod:@"POST"];
        
        //initialize a post data
         NSString *postData = [NSString stringWithFormat:@"userEmail=%@&password=%@",email,password];
        
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
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    UITabBarController *destinationController = (UITabBarController *)[storyboard instantiateViewControllerWithIdentifier:@"tabBar"];
    //        destinationController.urlnames = urlName;
    [self.navigationController pushViewController:destinationController animated:YES];

}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    
    if([body isEqualToString: @"success"]) {
        
        NSLog(@"%@",body);
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        UITabBarController *destinationController = (UITabBarController *)[storyboard instantiateViewControllerWithIdentifier:@"tabBar"];
//        destinationController.urlnames = urlName;
        [self.navigationController pushViewController:destinationController animated:YES];
        
    } else {
        
        NSLog(@"Connection could not be made");
        NSLog(@"%@",body);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                        message:@"Failed Login!"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}
//
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
