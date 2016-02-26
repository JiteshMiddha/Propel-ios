//
//  SignupManager.h
//  Propel
//
//  Created by Jitesh Middha on 2/27/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomObjectManager.h"


@interface SignupManager : NSObject


@property (nonatomic, retain) CustomObjectManager *objectManager;

-(void)signupUser:(User *)user success:(void(^)(User *response, RKObjectRequestOperation *operation))success failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure;


@end
