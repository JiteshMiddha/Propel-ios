//
//  ActivityProgressViewController.h
//  Propel
//
//  Created by Jitesh Middha on 2/27/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityProgressViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

@property (weak, nonatomic) IBOutlet UILabel *averageSpeedValueLabel;

@property (weak, nonatomic) IBOutlet UILabel *distanceValueLabel;

@property (weak, nonatomic) IBOutlet UIButton *highFiveButton;
@property (weak, nonatomic) IBOutlet UILabel *highFiveTextLabel;


@property (weak, nonatomic) IBOutlet UIButton *playPauseButton;

@end
