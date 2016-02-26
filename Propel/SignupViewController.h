//
//  SignupViewController.h
//  Propel
//
//  Created by Jitesh Middha on 2/26/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginSignupTextField.h"
#import "CustomButton.h"


@interface SignupViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *backButton;

@property (weak, nonatomic) IBOutlet LoginSignupTextField *emailTextField;

@property (weak, nonatomic) IBOutlet LoginSignupTextField *passwordTextField;

@property (weak, nonatomic) IBOutlet LoginSignupTextField *confirmPasswordTextField;

@property (weak, nonatomic) IBOutlet CustomButton *signupButton;

@end
