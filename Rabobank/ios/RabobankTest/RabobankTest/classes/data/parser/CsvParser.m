//
//  CsvParser.m
//  RabobankTest
//
//  Created by Jibin Raju on 08/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

#import "CsvParser.h"
#import "UserIssue.h"

@interface CsvParser()

@property (nonnull, nonatomic, strong) NSString *filePath;
@property (nonnull, nonatomic, copy) ParsingFinished parsingFinishedBlk;

@end

@implementation CsvParser

- (instancetype)initWithFilePath:(NSString *)filePath andCallBackBlock:(ParsingFinished)parsingFinishedBlk {
    self = [super init];
    self.filePath = filePath;
    self.parsingFinishedBlk = parsingFinishedBlk;
    
    return self;
}

- (ParserType)getParserType {
    return CSV_FILE_TYPE;
}

#pragma mark - overriden

- (void)parse {
    [self start];
}

- (void)main {
    [self parseWithFilePath:self.filePath];
}

#pragma mark - private

- (void)parseWithFilePath:(NSString *)filePath {
    NSError *error;
    NSString *csvData = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    NSArray *rawData = [csvData componentsSeparatedByString:@"\n"];
    NSMutableArray<UserIssue *> *userIssuesList = [[NSMutableArray alloc] initWithCapacity:rawData.count];
    BOOL headerIngorned = NO;
    for (NSString *rowData in rawData) {
        if (headerIngorned) {
            UserIssue *userIssue = [[UserIssue alloc] initWithRowData:rowData];
            [userIssuesList addObject:userIssue];
        }
        headerIngorned = YES;
    }
    
    __typeof(self) weakSelf = self;
    dispatch_sync(dispatch_get_main_queue(), ^{
        weakSelf.parsingFinishedBlk(userIssuesList);
    });
}

@end
