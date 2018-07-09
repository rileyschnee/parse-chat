//
//  LoginViewController.m
//  ParseChat
//
//  Created by Riley Schnee on 7/9/18.
//  Copyright © 2018 Riley Schnee. All rights reserved.
//

#import "LoginViewController.h"
#import "Parse.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginButton:(id)sender {
    if([self.passwordField.text isEqual:@""]){
        UIAlertController *emptyPWDAlert = [UIAlertController alertControllerWithTitle:@"Empty Password" message:@"You must enter a password" preferredStyle:(UIAlertControllerStyleAlert)];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { // handle response here.
        }];
        // add the OK action to the alert controller
        [emptyPWDAlert addAction:okAction];
        [self presentViewController:emptyPWDAlert animated:YES completion:nil];
    } else if([self.usernameField.text isEqual:@""]){
        UIAlertController *emptyUSRAlert = [UIAlertController alertControllerWithTitle:@"Empty Username" message:@"You must enter a username" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { // handle response here.
        }];
        // add the OK action to the alert controller
        [emptyUSRAlert addAction:okAction];
        [self presentViewController:emptyUSRAlert animated:YES completion:nil];
    }else{
        [self loginUser];
    }
}

- (void)loginUser{
    NSString *username = self.usernameField.text;
    NSString *password = self.passwordField.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
            
            // Present error alert controller
            UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"An Error Occurred" message:@"Please try again later" preferredStyle:(UIAlertControllerStyleAlert)];
            // create an OK action
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { // handle response here.
            }];
            // add the OK action to the alert controller
            [errorAlert addAction:okAction];
            [self presentViewController:errorAlert animated:YES completion:nil];

        } else {
            NSLog(@"User logged in successfully");
            // display view controller that needs to shown after successful login
            [self performSegueWithIdentifier:@"loginSegue" sender:nil];

        }
    }];
}

- (IBAction)signupButton:(id)sender {
    if([self.passwordField.text isEqual:@""]){
        UIAlertController *emptyPWDAlert = [UIAlertController alertControllerWithTitle:@"Empty Password" message:@"You must enter a password" preferredStyle:(UIAlertControllerStyleAlert)];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { // handle response here.
        }];
        // add the OK action to the alert controller
        [emptyPWDAlert addAction:okAction];
        [self presentViewController:emptyPWDAlert animated:YES completion:nil];
    } else if([self.usernameField.text isEqual:@""]){
        UIAlertController *emptyUSRAlert = [UIAlertController alertControllerWithTitle:@"Empty Username" message:@"You must enter a username" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { // handle response here.
        }];
        // add the OK action to the alert controller
        [emptyUSRAlert addAction:okAction];
        [self presentViewController:emptyUSRAlert animated:YES completion:nil];
    }else{
        [self registerUser];
    }
}

- (void)registerUser {
    // initialize a user object
    PFUser *newUser = [PFUser user];
    
    // set user properties
    newUser.username = self.usernameField.text;
    newUser.password = self.passwordField.text;
    
    // call sign up function on the object
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
            
            UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"An Error Occurred" message:@"Please try again later" preferredStyle:(UIAlertControllerStyleAlert)];
            // create an OK action
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) { // handle response here.
            }];
            // add the OK action to the alert controller
            [errorAlert addAction:okAction];
            [self presentViewController:errorAlert animated:YES completion:nil];
        } else {
            NSLog(@"User registered successfully");
            // manually segue to logged in view
            [self performSegueWithIdentifier:@"loginSegue" sender:nil];
        }
    }];
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
