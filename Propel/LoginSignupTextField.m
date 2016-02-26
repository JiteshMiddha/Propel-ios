//
//  LoginSignupTextField.m
//  Jupo
//
//  Created by Jitesh Middha on 10/8/15.
//  Copyright © 2015 Jitesh Middha. All rights reserved.
//

#import "LoginSignupTextField.h"

@implementation LoginSignupTextField
- (void)drawRect:(CGRect)rect {
    
    self.layer.borderWidth = 0;
}



-(void)awakeFromNib
{
    self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.3];
}
@end
