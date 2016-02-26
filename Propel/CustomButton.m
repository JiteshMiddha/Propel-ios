//
//  CustomButton.m
//  Jupo
//
//  Created by Jitesh Middha on 8/26/15.
//  Copyright (c) 2015 Jitesh Middha. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (void)drawRect:(CGRect)rect {
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [[UIColor whiteColor] CGColor];
    
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}



@end
