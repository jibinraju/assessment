//
//  OverViewDataSource.m
//  RabobankTest
//
//  Created by Jibin Raju on 08/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

#import "OverViewDataSource.h"
#import "UserIssue.h"

@interface OverViewDataSource()

@property (nonatomic, strong) NSArray<UserIssue *> *usersList;
@property (nonatomic, weak) id<OverViewDataSourceDelegate> delegate;

@end

@implementation OverViewDataSource

- (instancetype)initWithDataModel:(NSArray<UserIssue *> *)usersList andDelegate:(id<OverViewDataSourceDelegate>) delegate {
    self = [super init];
    self.usersList = usersList;
    self.delegate = delegate;
    
    return self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.usersList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"IssueCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    UserIssue *userIssue = self.usersList[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", userIssue.firstName, userIssue.surName];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Issue Count: %@", userIssue.issueCount];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UserIssue *userIssue = self.usersList[indexPath.row];
    if(self.delegate && [self.delegate respondsToSelector:@selector(dataSource:didSelectedData:)]) {
        [self.delegate dataSource:self didSelectedData:userIssue];
    }
}

@end
