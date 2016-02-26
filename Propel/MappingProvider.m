//
//  MappingProvider.m
//  Propel
//
//  Created by Jitesh Middha on 2/27/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import "MappingProvider.h"

@implementation MappingProvider


+(RKObjectMapping *)loginRequestMapping
{
    NSDictionary *mappingDictionary = @{@"email":@"email",
                                        @"password":@"password"};
    
    RKObjectMapping *requestMapping = [RKObjectMapping requestMapping];
    [requestMapping addAttributeMappingsFromDictionary:mappingDictionary];
    
    return requestMapping;
}


+(RKObjectMapping *)loginResponseMapping
{
    NSDictionary *mappingDictionary = @{@"email":@"email",
                                        @"password":@"password",
                                        @"api_key":@"api_key"};
    
    RKObjectMapping *responseMapping = [RKObjectMapping mappingForClass:[User class]];
    
    [responseMapping addAttributeMappingsFromDictionary:mappingDictionary];
    
    return responseMapping;
}



+(RKObjectMapping *)signupRequestMapping
{
    NSDictionary *mappingDictionary = @{@"email":@"email",
                                        @"password":@"password"};
    
    RKObjectMapping *requestMapping = [RKObjectMapping requestMapping];
    [requestMapping addAttributeMappingsFromDictionary:mappingDictionary];
    
    return requestMapping;
}


+(RKObjectMapping *)signupResponseMapping
{
    NSDictionary *mappingDictionary = @{@"email":@"email",
                                        @"password":@"password",
                                        @"api_key":@"api_key"};
    
    RKObjectMapping *responseMapping = [RKObjectMapping mappingForClass:[User class]];
    
    [responseMapping addAttributeMappingsFromDictionary:mappingDictionary];
    
    return responseMapping;
}

@end
