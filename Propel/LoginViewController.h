//
//  LoginViewController.h
//  Propel
//
//  Created by Jitesh Middha on 2/26/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginSignupTextField.h"
#import "CustomButton.h"
#import "SignupViewController.h"
#import "LoginManager.h"


@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet LoginSignupTextField *emailTextField;

@property (weak, nonatomic) IBOutlet LoginSignupTextField *passwordTextField;

@property (weak, nonatomic) IBOutlet CustomButton *loginButton;

@property (weak, nonatomic) IBOutlet UIButton *forgotButton;

@property (weak, nonatomic) IBOutlet UIButton *signupButton;
@property (weak, nonatomic) IBOutlet UILabel *seperatorLabel;
@property (weak, nonatomic) IBOutlet UILabel *signupTextLabel;

@end
