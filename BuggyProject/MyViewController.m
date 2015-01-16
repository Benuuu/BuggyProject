//
//  MyViewController.m
//  BuggyProject
//
//  Created by Benjamin Wu on 1/15/15.
//  Copyright (c) 2015 Intrepid Pursuits. All rights reserved.
//

#import "MyViewController.h"

#import "SearchesViewController.h"
#import <UIImageView+AFNetworking.h>

@interface MyViewController () <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UIImageView *validImageview;
@property (nonatomic, strong) NSArray *searches;

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.validImageview.backgroundColor = [UIColor redColor];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textFieldDidChange:)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:self.textField];
}

#pragma mark - Actions

// TODO: Change the name of this action.
- (IBAction)bTap:(id)sender {
}

- (IBAction)historyButtonTapped:(id)sender {
//    SearchesViewController *searchesViewController = [[SearchesViewController alloc] initWithNibName:nil bundle:nil];
//    searchesViewController.searches = self.searches;
//    [self presentViewController:searchesViewController animated:YES completion:nil];
}

#pragma mark - Helpers

//- (void)addSearch:(NSString *)search {
//    NSMutableArray *mutableSearches = [self.searches mutableCopy];
//    [mutableSearches addObject:search];
//    self.searches = [mutableSearches copy];
//}

- (NSURLRequest *)imgurURLRequest {
    NSString *urlString = [NSString stringWithFormat:@"http://i.imgur.com/%@.png", self.textField.text];
    return [[NSURLRequest alloc] initWithURL:[[NSURL alloc] initWithString:urlString]];
}

- (BOOL)isValidString:(NSString *)string {
    return string.length >= 4 && string.length <= 7;
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidChange:(NSNotification *)textFieldDidChangeNotification {
    if ([self isValidString:self.textField.text]) {
        self.validImageview.backgroundColor = [UIColor greenColor];
    } else {
        self.validImageview.backgroundColor = [UIColor redColor];
    }
}

@end
