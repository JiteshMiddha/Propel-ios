//
//  LoginManager.m
//  Propel
//
//  Created by Jitesh Middha on 2/27/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import "LoginManager.h"
#import "Macros.h"

@implementation LoginManager



-(CustomObjectManager *)objectManager
{
    if (!_objectManager) {
        _objectManager = [CustomObjectManager sharedManager];
    }
    return _objectManager;
}


-(void)setupRequestDescriptors
{
    // Inverse Mapping for POST
    RKRequestDescriptor *requestDescriptor = [RKRequestDescriptor requestDescriptorWithMapping:[[MappingProvider loginRequestMapping] inverseMapping] objectClass:[User class] rootKeyPath:nil method:RKRequestMethodAny];
    [self.objectManager addRequestDescriptor:requestDescriptor];
    
}

-(void)setupResponseDescriptors
{
    // Response Descriptor
    // Anything in 2xx
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful);
    
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:[MappingProvider loginResponseMapping] method:RKRequestMethodAny pathPattern:nil keyPath:nil statusCodes:statusCodes];
    
    
    
    
//    NSIndexSet *errorCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassClientError); // response with 4xx status codes
//    

    
    [self.objectManager addResponseDescriptorsFromArray:@[responseDescriptor]];
}




-(void)authenticateLoginForUser:(User *)user success:(void (^)(User *, RKObjectRequestOperation *))success failure:(void (^)(RKObjectRequestOperation *, NSError *))failure
{
    [self setupResponseDescriptors];
    [self setupRequestDescriptors];
    
    self.objectManager.requestSerializationMIMEType = RKMIMETypeJSON;
    
    [self.objectManager.HTTPClient setDefaultHeader:@"Content-Type" value:@"application/json"];
    
    
    [self.objectManager postObject:user path:URL_PATH_LOGIN parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult)
     {
         
         User *responseObj = [mappingResult.array firstObject];
         success(responseObj, operation);
     } failure:^(RKObjectRequestOperation *operation, NSError *error) {
         
         failure(operation, error);
     }];
    
}

@end
