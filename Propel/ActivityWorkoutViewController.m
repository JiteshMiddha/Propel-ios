//
//  ActivityWorkoutViewController.m
//  Propel
//
//  Created by Jitesh Middha on 2/27/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import "ActivityWorkoutViewController.h"

@interface ActivityWorkoutViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *activies;
@property (nonatomic, strong) NSArray *activiesIcons;

@end

@implementation ActivityWorkoutViewController

-(NSArray *)activies
{
    return @[@"Cycling", @"Running", @"Gym"];
}


-(NSArray *)activiesIcons
{
    return @[[UIImage imageNamed:@"cycling"], [UIImage imageNamed:@"running"], [UIImage imageNamed:@"gym"]];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - TableView Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.activies count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActivityCell" forIndexPath:indexPath];
    
    
    [cell.iconImageView setImage:self.activiesIcons[indexPath.row]];
    cell.activityTitleLabel.text = self.activies[indexPath.row];
    
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    [self performSegueWithIdentifier:@"ActivitiesToActivityProgress" sender:nil];
    
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
