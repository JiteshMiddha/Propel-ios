//
//  AboutYouViewHeaderCell.h
//  Propel
//
//  Created by Jitesh Middha on 2/27/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutYouViewHeaderCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *headingTextLabel;

@property (weak, nonatomic) IBOutlet UILabel *subheadingTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end
