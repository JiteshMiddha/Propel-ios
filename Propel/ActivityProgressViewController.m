//
//  ActivityProgressViewController.m
//  Propel
//
//  Created by Jitesh Middha on 2/27/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import "ActivityProgressViewController.h"

@interface ActivityProgressViewController ()

@end

@implementation ActivityProgressViewController
{
    NSTimer *mainTimer;
    int seconds;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    seconds = 0;
    
    [self.highFiveButton addTarget:self action:@selector(highFiveButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.playPauseButton addTarget:self action:@selector(playPauseButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)highFiveButtonPressed:(UIButton *)button
{
    if ([button isSelected])
    {
        [button setImage:[UIImage imageNamed:@"high-five"] forState:UIControlStateNormal];
        [button setSelected:NO];
        self.highFiveTextLabel.text = @"High-fives are disabled";
        self.highFiveTextLabel.textColor = [UIColor lightGrayColor];
    }
    else
    {
        [button setImage:[UIImage imageNamed:@"high-five-colored"] forState:UIControlStateSelected];
        [button setSelected:YES];
        self.highFiveTextLabel.text = @"High-fives are enabled";
        self.highFiveTextLabel.textColor = [UIColor colorWithRed:235/255.f green:205/255.f blue:255/255.f alpha:1];
    }
    
}



-(void)playPauseButtonPressed:(UIButton *)button
{
    
    
    
    if ([button isSelected])
    {
        [button setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        [button setSelected:NO];
        
        [mainTimer invalidate];
    }
    else
    {
        [button setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateSelected];
        [button setSelected:YES];
        
        mainTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                              target:self
                                                            selector:@selector(timerController)
                                                            userInfo:nil
                                                             repeats:YES];
    }
}

- (NSString*)getTimeStr : (int) secondsElapsed {
    int sseconds = secondsElapsed % 60;
    int minutes = secondsElapsed / 60;
    return [NSString stringWithFormat:@"%02d:%02d", minutes, sseconds];
}

- (void)timerController {
    seconds++;
    [[self timerLabel] setText:[self getTimeStr:seconds]];
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
