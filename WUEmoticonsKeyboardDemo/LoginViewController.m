//
//  LoginViewController.m
//  WUEmoticonsKeyboardDemo
//
//  Created by akira on 5/12/16.
//  Copyright (c) 2016 YuAo. All rights reserved.
//

#import "LoginViewController.h"
#import "ContactsTableViewController.h"
#import "WelcomeViewController.h"
#import "WUDemoViewController.h"

@interface LoginViewController ()

@property (retain, nonatomic) NSURLConnection *connection;
@property (retain, nonatomic) NSMutableData *receivedData;


@end

@implementation LoginViewController

@synthesize receivedData = _receivedData;

            NSString* body;
            NSString* userEmail;
            NSString* password;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_txtUserEmail setDelegate:self];
    [_txtUserPassword setDelegate:self];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *userEmail = [defaults objectForKey:@"userEmail"];
    NSString *password = [defaults objectForKey:@"password"];
    
    [defaults synchronize];
    
    _txtUserEmail.text = userEmail;
    _txtUserPassword.text = password;
    
    // Do any additional setup after loading the view.
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnLogin:(id)sender {

    
    userEmail = self.txtUserEmail.text;
    password = self.txtUserPassword.text;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:userEmail forKey:@"userEmail"];
    [defaults setObject:password forKey:@"password"];
    
    [defaults synchronize];
    
    if ([userEmail isEqualToString:@""]||[password isEqualToString:@""]) {
        NSLog(@"Please input user infomation");
       
        
        UIAlertController * alert= [UIAlertController
                                    alertControllerWithTitle:@"Title"
                                    message:@"Please input user infomation."
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"Yes, please"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        //Handel your yes please button action here
                                        
                                    }];
        
        UIAlertAction* noButton = [UIAlertAction
                                   actionWithTitle:@"No, thanks"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       //Handel no, thanks button
                                       
                                   }];
        
        [alert addAction:yesButton];
        [alert addAction:noButton];
        
        [self presentViewController:alert animated:YES completion:nil];

        
    } else {
 
        [self.connection cancel];
        
        //initialize new mutable data
        
        NSMutableData *data = [[NSMutableData alloc] init];
        
        self.receivedData = data;
        
        //initialize url that is going to be fetched.
        NSURL *url = [NSURL URLWithString:@"http://localhost/chat_api/login.php"];
        
        //initialize a request from url
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
        
        //set http method
        [request setHTTPMethod:@"POST"];
        
        //initialize a post data
         NSString *postData = [NSString stringWithFormat:@"userEmail=%@&password=%@",userEmail,password];
        
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
    
    UIAlertController * alert= [UIAlertController
                                alertControllerWithTitle:@"Title"
                                message:@"Can't connect to server!"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* yesButton = [UIAlertAction
                                actionWithTitle:@"Yes, please"
                                style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action)
                                
                                {
                                    //Handel your yes please button action here
                                    
                                }];
    
    UIAlertAction* noButton = [UIAlertAction
                               actionWithTitle:@"No, thanks"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   //Handel no, thanks button
                                   
                                   NSLog(@"%@",body);
                                   UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
                                   UITabBarController *destinationController = (UITabBarController *)[storyboard instantiateViewControllerWithIdentifier:@"tabBar"];
                                   //        destinationController.urlnames = urlName;
                                   [self.navigationController pushViewController:destinationController animated:YES];

                                   
                               }];
    
    [alert addAction:yesButton];
    [alert addAction:noButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    
    if([body isEqualToString: @"Login success"]) {
        
        NSLog(@"%@",body);
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        WUDemoViewController *destinationController = (WUDemoViewController *)[storyboard instantiateViewControllerWithIdentifier:@"wUDemoViewController"];
//        destinationController.urlnames = urlName;
        [self.navigationController pushViewController:destinationController animated:YES];
        
    } else {
        
        NSLog(@"Connection could not be made");
        NSLog(@"%@",body);
        UIAlertController * alert= [UIAlertController
                                    alertControllerWithTitle:@"Please input correct user information!"
                                    message:@"Could you please let me try again?"
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"Yes, please!"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    
                                    {
                                        //Handel your yes please button action here
                                        
                                    }];
        
        UIAlertAction* noButton = [UIAlertAction
                                   actionWithTitle:@"No, thanks!"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       //Handel no, thanks button
                                       
                                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
                                    UITabBarController *destinationController = (UITabBarController *)[storyboard instantiateViewControllerWithIdentifier:@"tabBar"];
                                        //       destinationController.urlnames = urlName;
                                    [self.navigationController pushViewController:destinationController animated:YES];
                                       
                                   }];
        
        [alert addAction:yesButton];
        [alert addAction:noButton];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

@end
