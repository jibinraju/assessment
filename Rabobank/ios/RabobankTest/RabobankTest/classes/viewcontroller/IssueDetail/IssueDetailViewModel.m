//
//  IssueDetailViewModel.m
//  RabobankTest
//
//  Created by Jibin Raju on 08/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

#import "IssueDetailViewModel.h"
#import "UserIssue.h"

@interface IssueDetailViewModel()

@property (nonatomic, strong) UserIssue *userIssue;

@end

@implementation IssueDetailViewModel

- (instancetype)initWithUserIssue:(UserIssue *)userIssue {
    self = [super init];
    self.userIssue = userIssue;
    
    return self;
}

- (NSString *)title {
    return @"Issue Detail";
}

- (NSString *)firstName {
    return self.userIssue.firstName;
}

- (NSString *)surName {
    return self.userIssue.surName;
}

- (NSString *)issueCount {
    return self.userIssue.issueCount;
}

- (NSString *)dateOfBirth {
    NSString *dateOfBirth = [NSDateFormatter localizedStringFromDate:self.userIssue.dateOfBirth dateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterNoStyle];
    
    return dateOfBirth;
}

@end
