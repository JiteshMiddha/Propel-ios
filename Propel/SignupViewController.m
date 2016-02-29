//
//  SignupViewController.m
//  Propel
//
//  Created by Jitesh Middha on 2/26/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import "SignupViewController.h"
#import "SignupManager.h"
#import "Macros.h"


@interface SignupViewController ()

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.backButton addTarget:self action:@selector(backButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.emailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: [UIColor lightTextColor]}];
    self.passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: [UIColor lightTextColor]}];
    
    self.confirmPasswordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Confirm Password" attributes:@{NSForegroundColorAttributeName: [UIColor lightTextColor]}];
    
    
    [self.signupButton addTarget:self action:@selector(signupButtonPressed) forControlEvents:UIControlEventTouchUpInside];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backButtonPressed:(UIButton *)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"modalDismissed" object:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



-(void)signupButtonPressed
{
#warning -
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backToSignUp) name:@"backToSignUp" object:nil];
    [self hideAll:YES];
    [self performSegueWithIdentifier:SEGUE_SIGNUP_TO_ABOUT sender:nil];
//    
//    if (self.emailTextField.text.length > 0 && self.passwordTextField.text.length > 0 && self.confirmPasswordTextField.text.length > 0)
//    {
//        if ([self.passwordTextField.text isEqualToString:self.confirmPasswordTextField.text])
//        {
//            
//            User *newUser = [User new];
//            
//            newUser.email = self.emailTextField.text;
//            newUser.password = self.passwordTextField.text;
//            
//            SignupManager *signupManager = [SignupManager new];
//            
//            [signupManager signupUser:newUser success:^(User *response, RKObjectRequestOperation *operation) {
//
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(backToSignUp) name:@"backToSignUp" object:nil];
//    [self hideAll:YES];
//                [self performSegueWithIdentifier:SEGUE_SIGNUP_TO_ABOUT sender:nil];
//                
//            } failure:^(RKObjectRequestOperation *operation, NSError *error) {
//                
//                // alert
//                
//                [self showAlertWithTitle:@"Could not signin" message:@"There was some error. Please try again."];
//                
//            }];
//        }
//        else
//        {
//            // alert - Password & confirm password should be same.
//            [self showAlertWithTitle:@"Pwasswords does not match" message:@"Password & confirm password should be same."];
//        }
//    }
//    else
//    {
//        // alert - Enter all fields
//        
//        [self showAlertWithTitle:@"Incomplete data" message:@"Fill all fields"];
//    }
}


-(void)showAlertWithTitle:(NSString *)title message:(NSString *)message
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   //Handel your yes please button action here
                                   [alertController dismissViewControllerAnimated:YES completion:nil];
                                   
                               }];
    
    [alertController addAction:okButton];
    
    [self presentViewController:alertController animated:YES completion:nil];
}



-(void)hideAll:(BOOL)hide
{
    self.emailTextField.hidden = hide;
    self.passwordTextField.hidden = hide;
    self.confirmPasswordTextField.hidden = hide;
    
    self.signupButton.hidden = hide;
}

-(void)backToSignUp
{
    [self hideAll:NO];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
