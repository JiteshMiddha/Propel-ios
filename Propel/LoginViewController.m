//
//  LoginViewController.m
//  Propel
//
//  Created by Jitesh Middha on 2/26/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import "LoginViewController.h"
#import "Macros.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    [self.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    
    
    self.emailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email" attributes:@{NSForegroundColorAttributeName: [UIColor lightTextColor]}];
    self.passwordTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: [UIColor lightTextColor]}];
    
    
    
    [self.loginButton addTarget:self action:@selector(loginButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.forgotButton addTarget:self action:@selector(forgotButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.signupButton addTarget:self action:@selector(signupButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    
}



-(void)hideEverything:(BOOL)hide
{
    self.emailTextField.hidden = hide;
    self.passwordTextField.hidden = hide;
    self.loginButton.hidden =hide;
    self.forgotButton.hidden = hide;
    self.seperatorLabel.hidden = hide;
    self.signupTextLabel.hidden = hide;
    self.signupButton.hidden = hide;
}

//
//-(void)viewWillDisappear:(BOOL)animated{
//    
//    
//}
//
//- (void) viewWillAppear:(BOOL)animated{
//    
//    [self hideEverything:NO];
//}


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
//    UIAlertAction* noButton = [UIAlertAction
//                               actionWithTitle:@"Cancel"
//                               style:UIAlertActionStyleDefault
//                               handler:^(UIAlertAction * action)
//                               {
//                                   [alertController dismissViewControllerAnimated:YES completion:nil];
//                                   
//                               }];
    
    [alertController addAction:okButton];
//    [alertController addAction:noButton];
    
    
    [self presentViewController:alertController animated:YES completion:nil];
}



-(void)loginButtonPressed:(UIButton *)sender
{
    if (self.emailTextField.text.length >0 && self.passwordTextField.text.length>0)
    {
        [self hideEverything:YES];
        [self performSegueWithIdentifier:SEGUE_LOGIN_TO_HOME sender:nil];
    }
    else
    {
        [self showAlertWithTitle:@"Incomplete data" message:@"Please enter both email and password"];
    }
}


-(void)forgotButtonPressed:(UIButton *)sender
{
    [self showAlertWithTitle:@"Not Implemented yet" message:@""];
}


-(void)signupButtonPressed:(UIButton *)sender
{
//    [self performSegueWithIdentifier:SEGUE_LOGIN_TO_SIGNUP sender:nil];
    
    
    [self hideEverything:YES];
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UINavigationController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"SignupViewController"];
    
    SignupViewController *nextVC = (SignupViewController *)viewController.parentViewController;

    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(modalDismissed) name:@"modalDismissed" object:nil];

    
    
    nextVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    viewController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    viewController.view.backgroundColor = [UIColor clearColor];
    nextVC.view.backgroundColor = [UIColor clearColor];

    
    
    [self.navigationController presentViewController:viewController animated:YES completion:nil];
}


-(void)modalDismissed
{
    [self hideEverything:NO];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



@end
