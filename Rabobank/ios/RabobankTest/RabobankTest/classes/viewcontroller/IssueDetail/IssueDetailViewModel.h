//
//  IssueDetailViewModel.h
//  RabobankTest
//
//  Created by Jibin Raju on 08/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UserIssue;

@interface IssueDetailViewModel : NSObject

@property(nullable, nonatomic, readonly) NSString *title;
@property(nullable, nonatomic, readonly) NSString *firstName;
@property(nullable, nonatomic, readonly) NSString *surName;
@property(nullable, nonatomic, readonly) NSString *issueCount;
@property(nullable, nonatomic, readonly) NSString *dateOfBirth;

- (nullable instancetype)initWithUserIssue:(nonnull UserIssue *)userIssue;

@end
