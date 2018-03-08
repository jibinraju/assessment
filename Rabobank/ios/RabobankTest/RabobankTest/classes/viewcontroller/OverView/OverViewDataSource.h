//
//  OverViewDataSource.h
//  RabobankTest
//
//  Created by Jibin Raju on 08/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserIssue;
@protocol OverViewDataSourceDelegate;

@interface OverViewDataSource : NSObject<UITableViewDataSource, UITableViewDelegate>

- (nullable instancetype)initWithDataModel:(nonnull NSArray<UserIssue *> *)usersList andDelegate:(nullable id<OverViewDataSourceDelegate>) delegate;

@end

@protocol OverViewDataSourceDelegate<NSObject>

@optional
- (void)dataSource:(nonnull OverViewDataSource *)dataSource didSelectedData:(nullable UserIssue *)userIssue;

@end
