//
//  AboutYouViewController.m
//  Propel
//
//  Created by Jitesh Middha on 2/27/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import "AboutYouViewController.h"
#import "AppDelegate.h"

@interface AboutYouViewController ()

@end

@implementation AboutYouViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
}


-(void)viewDidAppear:(BOOL)animated
{
    [self getHealthKitData];
}

-(void)getHealthKitData
{
    HKHealthStore *healthStore = [[HKHealthStore alloc] init];
    
    // Share body mass, height and body mass index
    NSSet *shareObjectTypes = [NSSet setWithObjects:
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMassIndex],
                               nil];
    
    // Read date of birth, biological sex and step count
    NSSet *readObjectTypes  = [NSSet setWithObjects:
                               [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierDateOfBirth],
                               [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierBiologicalSex],
                               [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount],
                               nil];
    
    // Request access
    [healthStore requestAuthorizationToShareTypes:shareObjectTypes readTypes:readObjectTypes completion:^(BOOL success, NSError *error) {
        
        if(success == YES)
        {
            
            // Gender
            NSError *error;
            HKBiologicalSexObject *bioSex = [healthStore biologicalSexWithError:&error];
            
            switch (bioSex.biologicalSex)
            {
                case HKBiologicalSexNotSet:
                    // undefined
                    break;
                case HKBiologicalSexFemale:
                {    dispatch_async(dispatch_get_main_queue(), ^{
                        [self genderSelected:0];
                    });
                    break;
                }
                case HKBiologicalSexMale:
                    // ...
                    break;
                default:
                    break;
            }
        }
        else
        {
            // Determine if it was an error or if the
            // user just canceld the authorization request
        }
        
    }];
    
    // get weight
    NSError *error;
    NSDate *dob = [healthStore dateOfBirthWithError:&error];
    
    if (!error) {
        
        NSDate* now = [NSDate date];
        NSDateComponents* ageComponents = [[NSCalendar currentCalendar]
                                           components:NSCalendarUnitYear
                                           fromDate:dob
                                           toDate:now
                                           options:0];
        NSInteger age = [ageComponents year];
        
        
        AboutYouViewFormCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        
        cell.ageTextField.text = [NSString stringWithFormat:@"%ld",(long)age];
        
        
        
    }
    
    
    
    
    
    
//    // Update Weight
//    
//    // Some weight in gram
//    double weightInGram = 83400.f;
//    
//    // Create an instance of HKQuantityType and
//    // HKQuantity to specify the data type and value
//    // you want to update
//    NSDate *now = [NSDate date];
//    HKQuantityType  *hkQuantityType = [HKQuantityType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass];
//    HKQuantity *hkQuantity = [HKQuantity quantityWithUnit:[HKUnit gramUnit] doubleValue:weightInGram];
//    
//    // Create the concrete sample
//    HKQuantitySample *weightSample = [HKQuantitySample quantitySampleWithType:hkQuantityType
//                                                                     quantity:hkQuantity
//                                                                    startDate:now
//                                                                      endDate:now];
//    
//    
//    
//    // Update the weight in the health store
//    [healthStore saveObject:weightSample withCompletion:^(BOOL success, NSError *error) {
//        // ..
//        
//        if (success) {
//            
//            
//        }
//        
//    }];
    
    
}


-(void)genderSelected:(NSInteger)gender
{
    // 0 = Female
    // 1 = Male
    
    AboutYouViewFormCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    if (gender == 0)
    {
        [cell.femaleButton setBackgroundColor:[UIColor whiteColor]];
        [cell.femaleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [cell.maleButton setBackgroundColor:[UIColor clearColor]];
        [cell.maleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        
    }
    else
    {
        [cell.femaleButton setBackgroundColor:[UIColor clearColor]];
        [cell.femaleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [cell.maleButton setBackgroundColor:[UIColor whiteColor]];
        [cell.maleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    [cell.contentView layoutIfNeeded];
    [cell layoutIfNeeded];

    [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)backToSignup
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backToSignUp" object:nil];
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AboutYouViewFormCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FormCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.backgroundColor = [UIColor blackColor];
    
    cell.profileImageView.layer.cornerRadius = 40;
    
    cell.profileImageView.layer.masksToBounds = YES;
    
    cell.femaleButton.tag = 0;
    cell.maleButton.tag = 1;
    
    [cell.femaleButton addTarget:self action:@selector(genderButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.maleButton addTarget:self action:@selector(genderButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(void)genderButtonPressed:(UIButton *)button
{
        [self genderSelected:button.tag];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    AboutYouViewHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeaderCell"];
    
    [cell.backButton addTarget:self action:@selector(backToSignup) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 400;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 64;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
