//
//  UserIssue.h
//  RabobankTest
//
//  Created by Jibin Raju on 08/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserIssue : NSObject

@property (nonnull, nonatomic, strong) NSString *firstName;
@property (nonnull, nonatomic, strong) NSString *surName;
@property (nonnull, nonatomic, strong) NSString *issueCount;
@property (nonnull, nonatomic, strong) NSDate *dateOfBirth;


- (nullable instancetype)initWithRowData:(nonnull NSString *)rowData;

@end
