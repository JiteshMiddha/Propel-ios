//
//  CustomObjectManager.m
//  Propel
//
//  Created by Jitesh Middha on 2/27/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import "CustomObjectManager.h"
#import "Macros.h"


@implementation CustomObjectManager

+(instancetype) sharedManager
{
    NSURL *baseURL = [NSURL URLWithString:URL_BASE];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    CustomObjectManager *objectManager = [[CustomObjectManager alloc] initWithHTTPClient:client];
    
    
    return objectManager;
    
}

@end
