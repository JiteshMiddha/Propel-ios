//
//  AboutYouViewFormCell.m
//  Propel
//
//  Created by Jitesh Middha on 2/27/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import "AboutYouViewFormCell.h"

@implementation AboutYouViewFormCell

- (void)awakeFromNib {
    // Initialization code
    
    
    
    

    
    self.ageTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"25" attributes:@{NSForegroundColorAttributeName: [UIColor lightTextColor]}];
    self.heightTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"160" attributes:@{NSForegroundColorAttributeName: [UIColor lightTextColor]}];
    
    self.weightTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"69" attributes:@{NSForegroundColorAttributeName: [UIColor lightTextColor]}];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    
}

@end
