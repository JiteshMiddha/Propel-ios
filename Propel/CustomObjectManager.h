//
//  CustomObjectManager.h
//  Propel
//
//  Created by Jitesh Middha on 2/27/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MappingProvider.h"

@interface CustomObjectManager : RKObjectManager

+(instancetype)sharedManager;

@end
