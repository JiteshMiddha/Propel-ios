//
//  LoginManager.h
//  Propel
//
//  Created by Jitesh Middha on 2/27/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomObjectManager.h"

@interface LoginManager : NSObject

@property (nonatomic, retain) CustomObjectManager *objectManager;

-(void)authenticateLoginForUser:(User *)user success:(void(^)(User *response, RKObjectRequestOperation *operation))success failure:(void (^)(RKObjectRequestOperation *operation, NSError *error))failure;


@end
