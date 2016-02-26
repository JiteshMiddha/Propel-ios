//
//  ContainerViewController.m
//  Propel
//
//  Created by Jitesh Middha on 2/26/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import "ContainerViewController.h"

@interface ContainerViewController ()

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *images = [NSArray arrayWithObjects:
                       [UIImage imageNamed:@"fitness-1"],
                       [UIImage imageNamed:@"fitness-2"],
                       [UIImage imageNamed:@"fitness-3"],
                       [UIImage imageNamed:@"fitness-4"],
                       [UIImage imageNamed:@"fitness-5"],
                       [UIImage imageNamed:@"fitness-6"],
                       [UIImage imageNamed:@"fitness-8"],
                       [UIImage imageNamed:@"fitness-9"],
                       [UIImage imageNamed:@"fitness-10"], nil];

    
    self.backgroundImageView.animationImages = images;
    self.backgroundImageView.animationDuration = 60;
    
    
    [self.backgroundImageView startAnimating];
    
    
    UIView *overlay = [[UIView alloc] initWithFrame:self.view.frame];
    [overlay setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5]];
    [self.backgroundImageView addSubview:overlay];
    
}

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

@end
