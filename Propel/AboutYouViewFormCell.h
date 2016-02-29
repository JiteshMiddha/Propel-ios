//
//  AboutYouViewFormCell.h
//  Propel
//
//  Created by Jitesh Middha on 2/27/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginSignupTextField.h"


@interface AboutYouViewFormCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;

@property (weak, nonatomic) IBOutlet UILabel *genderTextLabel;

@property (weak, nonatomic) IBOutlet UILabel *ageTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *heightTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *weightTextLabel;

@property (weak, nonatomic) IBOutlet UIButton *femaleButton;

@property (weak, nonatomic) IBOutlet UIButton *maleButton;

@property (weak, nonatomic) IBOutlet LoginSignupTextField *ageTextField;
@property (weak, nonatomic) IBOutlet LoginSignupTextField *heightTextField;
@property (weak, nonatomic) IBOutlet LoginSignupTextField *weightTextField;




@end
