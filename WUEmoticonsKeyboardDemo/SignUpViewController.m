
#import "SignUpViewController.h"
//#import "ContactsTableViewController.h"

@interface SignUpViewController()


@end

@implementation SignUpViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
}


- (IBAction)sign_up:(id)sender {
    
    NSString *username =self.txtUserName.text;
    NSString *email = self.txtUserEmail.text;
    NSString *phoneNumber = self.txtUserPhoneNumber.text;
    NSString *password = self.txtUserPassword.text;
    
    if ([username isEqualToString:@""]||[email isEqualToString:@""]||[phoneNumber isEqualToString:@""]||[password isEqualToString:@""]) {
        NSLog(@"Please input user infomation");
        //alert(@"Please input user infomation");
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                        message:@"Please input the user infomation."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    } else {
        
        
        NSString *post = [NSString stringWithFormat:@"userName=%@&userEmail=%@&phoneNumber=%@&password=%@",username,email,phoneNumber,password];
        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%lu" , (unsigned long)[postData length]];
        NSURL *url = [NSURL URLWithString:@"http://localhost/chat_api/signUp.php"];
        //NSURL *url = [NSURL URLWithString:@"http://urban_feast/Kostas_api/signup_api.php"];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
        [request setHTTPBody:postData];
        NSURLSession *session = [NSURLSession sharedSession];
        
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                                completionHandler:
                                      ^(NSData *data, NSURLResponse *response, NSError *error) {
                                          
                                          if (error) {
                                              // Handle error...
                                              return;
                                          }
                                          
                                          if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                                              NSLog(@"Response HTTP Status code: %ld\n", (long)[(NSHTTPURLResponse *)response statusCode]);
                                              NSLog(@"Response HTTP Headers:\n%@\n", [(NSHTTPURLResponse *)response allHeaderFields]);
                                          }
                                
                                          NSString* body = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                          NSLog(@"Response Body:\n%@\n", body);
                                      }];
        [task resume];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        UITabBarController *destinationController = (UITabBarController *)[storyboard instantiateViewControllerWithIdentifier:@"tabBar"];
        //                                              destinationController.urlnames = urlName;
        [self.navigationController pushViewController:destinationController animated:YES];

    }
  }

@end
