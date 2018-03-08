//
//  IssueDetailViewController.m
//  RabobankTest
//
//  Created by Jibin Raju on 08/03/2018.
//  Copyright © 2018 Jibin Raju. All rights reserved.
//

#import "IssueDetailViewController.h"
#import "IssueDetailViewModel.h"

@interface IssueDetailViewController ()

@property(nonatomic, weak) IBOutlet UILabel *firstName;
@property(nonatomic, weak) IBOutlet UILabel *surName;
@property(nonatomic, weak) IBOutlet UILabel *issueCount;
@property(nonatomic, weak) IBOutlet UILabel *dateOfBirth;

@property (nonatomic, strong) IssueDetailViewModel *viewModel;

@end

@implementation IssueDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewModel = [[IssueDetailViewModel alloc] initWithUserIssue:self.userIssue];
    self.title = self.viewModel.title;
    self.firstName.text = self.viewModel.firstName;
    self.surName.text = self.viewModel.surName;
    self.issueCount.text = self.viewModel.issueCount;
    self.dateOfBirth.text = self.viewModel.dateOfBirth;
}

@end
