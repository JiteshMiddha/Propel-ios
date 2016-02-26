//
//  MappingProvider.h
//  Propel
//
//  Created by Jitesh Middha on 2/27/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
#import "User.h"


@interface MappingProvider : NSObject


+(RKObjectMapping *)loginRequestMapping;
+(RKObjectMapping *)loginResponseMapping;

+(RKObjectMapping *)signupRequestMapping;
+(RKObjectMapping *)signupResponseMapping;

@end
