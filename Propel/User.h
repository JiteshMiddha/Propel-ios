//
//  User.h
//  Propel
//
//  Created by Jitesh Middha on 2/27/16.
//  Copyright © 2016 Jitesh Middha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *password;

//@property (nonatomic, strong) NSString *gender; 
//@property (nonatomic, strong) NSString *birthDate;

@property (nonatomic, strong) NSString *api_key;



@end
