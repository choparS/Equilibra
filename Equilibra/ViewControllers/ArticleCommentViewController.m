//
//  ArticleCommentViewController.m
//  Equilibra
//
//  Created by Brice LE BAIL on 21/06/2014.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "ArticleCommentViewController.h"

@interface ArticleCommentViewController ()

@end

@implementation ArticleCommentViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Chargement du background de la view
    UIImageView *tableImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.png"]];
    [tableImageView setFrame:self.tableView.frame];
    self.tableView.backgroundView = tableImageView;

    _Author = [_comments valueForKey:@"author_name"];
    _Date = [_comments valueForKey:@"date"];
    _Content = [_comments valueForKey:@"content"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _comments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ArticleCommentTableCell";
    ArticleCommentTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    ArticleCommentTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier      forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[ArticleCommentTableCell alloc] init];
    }
    // Configure the cell...
    int row = [indexPath row];
    
    cell.AuthorLabel.text = _Author[row];
    cell.DateLabel.text = _Date[row];
    
    //WebView Step HTML
    [cell.Content loadHTMLString:_Content[row] baseURL:nil];
    [cell.Content setBackgroundColor:[UIColor clearColor]];
    [cell.Content setOpaque:NO];

//    cell.DateLabel.text = [NSString stringWithFormat:@"par %@",_Auteur[row]];
    
    return cell;
}

@end
