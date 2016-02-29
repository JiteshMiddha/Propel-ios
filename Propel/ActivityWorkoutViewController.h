//
//  ActivityWorkoutViewController.h
//  Propel
//
//  Created by Jitesh Middha on 2/27/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityCell.h"

@interface ActivityWorkoutViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *headingLabel;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
