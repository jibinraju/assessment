//
//  UserIssue.m
//  RabobankTest
//
//  Created by Jibin Raju on 08/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

#import "UserIssue.h"

typedef  NS_ENUM(NSInteger, ColumnTypes){
    FirstName = 0,
    SurName,
    IssueCount,
    DateOfBirth
};

@implementation UserIssue

- (instancetype)initWithRowData:(NSString *)rowData {
    self = [super init];
    [self parseRowData:rowData];
    
    return self;
}

#pragma mark - private

- (void)parseRowData:(NSString *)rowData {
    NSArray<NSString *> *columnData = [rowData componentsSeparatedByString:@","];
    if (columnData.count > 0) {
        self.firstName = [columnData[FirstName] stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        self.surName = [columnData[SurName] stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        self.issueCount = columnData[IssueCount];
        NSString *dob = [columnData[DateOfBirth] stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        dob = [dob stringByReplacingOccurrencesOfString:@"\r" withString:@""];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY-MM-dd'T'HH:mm:ss"];
        self.dateOfBirth = [dateFormatter dateFromString:dob];
    }
}

@end
