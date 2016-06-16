
#import "SignUpViewController.h"
#import "WelcomeViewController.h"

@interface SignUpViewController()

@property (retain, nonatomic) NSURLConnection *connection;
@property (retain, nonatomic) NSMutableData *receivedData;

@end

@implementation SignUpViewController

@synthesize receivedData = _receivedData;


NSString *body;
NSString *userName;
NSString *userEmail;
NSString *phoneNumber;
NSString *password;

-(void)viewDidLoad

{
    [super viewDidLoad];
    
    [_txtUserName setDelegate:self];
    [_txtUserEmail setDelegate:self];
    [_txtUserPhoneNumber setDelegate:self];
    [_txtUserPassword setDelegate:self];
    
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)ChooseImage:(id)sender {
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertController * alert= [UIAlertController
                                    alertControllerWithTitle:@"Device has no camera"
                                    message:@"Would you please use the browser?"
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"Yes, please"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action)
                                    {
                                        //Handel your yes please button action here
                                        
                                        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
                                        picker.delegate = self;
                                        picker.allowsEditing = YES;
                                        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                        [self presentViewController:picker animated:YES completion:NULL];
                                        
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
        
    }
    
    else {
        //other action
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:NULL];

    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *selectedImage = info[UIImagePickerControllerEditedImage];
    self.UserImage.image = selectedImage;
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)sign_up:(id)sender {
    
    userName =self.txtUserName.text;
    userEmail = self.txtUserEmail.text;
    phoneNumber = self.txtUserPhoneNumber.text;
    password = self.txtUserPassword.text;
    
    if ([userName isEqualToString:@""]||[userEmail isEqualToString:@""]||[phoneNumber isEqualToString:@""]||[password isEqualToString:@""]) {
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
        NSURL *url = [NSURL URLWithString:@"http://localhost/chat_api/signUp.php"];
        
        //initialize a request from url
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
        
        //set http method
        
        [request setHTTPMethod:@"POST"];
        
        //initialize a post data
        NSString *postData = [NSString stringWithFormat:@"userName=%@&userEmail=%@&phoneNumber=%@&password=%@",userName,userEmail,phoneNumber,password];
        
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
                                message:@"You can't access into server!"
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
    
    
    if([body isEqualToString: @"SignUp Success"]) {
        
        NSLog(@"%@",body);
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
        UITabBarController *destinationController = (UITabBarController *)[storyboard instantiateViewControllerWithIdentifier:@"tabBar"];
        //        destinationController.urlnames = urlName;
        [self.navigationController pushViewController:destinationController animated:YES];
        
    } else {
        
        NSLog(@"Connection could not be made");
        NSLog(@"%@",body);
        
        UIAlertController * alert= [UIAlertController
                                    alertControllerWithTitle:@"oo"
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
                                   actionWithTitle:@"No, Thanks!"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       //Handel no, thanks button
                                       
                                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
                                        WelcomeViewController *destinationController = (WelcomeViewController *)[storyboard instantiateViewControllerWithIdentifier:@"welcomeViewController"];
                                       //       destinationController.urlnames = urlName;
                                        [self.navigationController pushViewController:destinationController animated:YES];
                                       
                                   }];
        
        [alert addAction:yesButton];
        [alert addAction:noButton];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}


//        NSString *post = [NSString stringWithFormat:@"userName=%@&userEmail=%@&phoneNumber=%@&password=%@",userName,userEmail,phoneNumber,password];
//        NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
//        NSString *postLength = [NSString stringWithFormat:@"%lu" , (unsigned long)[postData length]];
//        NSURL *url = [NSURL URLWithString:@"http://localhost/chat_api/signUp.php"];
//        //NSURL *url = [NSURL URLWithString:@"http://urban_feast/Kostas_api/signup_api.php"];
//
//
//        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//        [request setURL:url];
//        [request setHTTPMethod:@"POST"];
//        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
//        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Current-Type"];
//        [request setHTTPBody:postData];
//        NSURLSession *session = [NSURLSession sharedSession];
//
//        NSURLSessionDataTask *task = [session dataTaskWithRequest:request
//                                                completionHandler:
//                                      ^(NSData *data, NSURLResponse *response, NSError *error) {
//
//                                          if (error) {
//                                              // Handle error...
//
//                                              UIAlertController* alert= [UIAlertController
//                                                                          alertControllerWithTitle:@"Title"
//                                                                          message:@"Conect failed!"
//                                                                          preferredStyle:UIAlertControllerStyleAlert];
//
//
//                                              UIAlertAction* yesButton = [UIAlertAction
//                                                                          actionWithTitle:@"Yes, please"
//                                                                          style:UIAlertActionStyleDefault
//                                                                          handler:^(UIAlertAction * action)
//                                                                          {
//                                                                              //Handel your yes please button action here
//
//                                                                          }];
//
//                                              UIAlertAction* noButton = [UIAlertAction
//                                                                         actionWithTitle:@"No, thanks"
//                                                                         style:UIAlertActionStyleDefault
//                                                                         handler:^(UIAlertAction * action)
//                                                                         {
//                                                                             //Handel no, thanks button
//
//                                                                         }];
//
//                                              [alert addAction:yesButton];
//                                              [alert addAction:noButton];
//
//                                              [self presentViewController:alert animated:YES completion:nil];
//
//                                              return;
//                                          }
//
//                                          if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
//                                              NSLog(@"Response HTTP Status code: %ld\n", (long)[(NSHTTPURLResponse *)response statusCode]);
//                                              NSLog(@"Response HTTP Headers:\n%@\n", [(NSHTTPURLResponse *)response allHeaderFields]);
//                                          }
//
//                                          NSString* body = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//                                          NSLog(@"Response Body:\n%@\n", body);
//                                      }];
//        [task resume];
//
////        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
////        UITabBarController *destinationController = (UITabBarController *)[storyboard instantiateViewControllerWithIdentifier:@"tabBar"];
////        //                                              destinationController.urlnames = urlName;
////        [self.navigationController pushViewController:destinationController animated:YES];
//
//    }
//  }


@end
