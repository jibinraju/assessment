//
//  OverViewController.m
//  RabobankTest
//
//  Created by Jibin Raju on 08/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

#import "OverViewController.h"
#import "OverViewViewModel.h"
#import "OverViewDataSource.h"
#import "ParserBuilder.h"
#import "UserIssue.h"
#import "IssueDetailViewController.h"

@interface OverViewController ()<OverViewDataSourceDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) OverViewViewModel *viewModel;
@property (nonatomic, strong) OverViewDataSource *dataSource;
@property (nonatomic, strong) NSArray<UserIssue *> *dataModels;
@property (nonatomic, strong) id<BaseParser> csvParser;

@end

@implementation OverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[OverViewViewModel alloc] init];
    self.title = self.viewModel.title;
    [self prepareDataModel];
}

#pragma mark - Private

- (void)prepareDataModel {
    NSString *csvFilePath = [[NSBundle mainBundle] pathForResource:@"issues" ofType:@"csv"];
    __typeof(self) weakSelf = self;
    self.csvParser = [ParserBuilder parserForType:CSV_FILE_TYPE filePath:csvFilePath andCallBackBlock:^(NSArray<UserIssue *> *dataModels) {
        [weakSelf setupDataSource:dataModels];
    }];
    
    [self.csvParser parse];
}


- (void)setupDataSource:(NSArray<UserIssue *> *)dataModels {
    self.dataSource = [[OverViewDataSource alloc] initWithDataModel:dataModels andDelegate:self];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
    [self.tableView reloadData];
}

#pragma mark - OverViewDataSourceDelegate

- (void)dataSource:(OverViewDataSource *)dataSource didSelectedData:(UserIssue *)userIssue {
    [self performSegueWithIdentifier:@"ShowIssueDetail" sender:userIssue];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UserIssue *)userIssue {
    if ([segue.identifier isEqualToString:@"ShowIssueDetail"]) {
        IssueDetailViewController *issueViewController = (IssueDetailViewController *)[segue destinationViewController];
        issueViewController.userIssue = userIssue;
    }
}

@end
