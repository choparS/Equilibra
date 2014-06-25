//
//  ArticleDetailViewController.m
//  Equilibra
//
//  Created by Brice LE BAIL on 19/06/2014.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "ArticleDetailViewController.h"

@interface ArticleDetailViewController ()

@end

@implementation ArticleDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // BackgroundColor
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]]];

    // Do any additional setup after loading the view.
    WebServices *wbs = [[WebServices alloc] init];
    
    NSDictionary *articleConsult =  [wbs WBSArticleConsult:[_idArticle integerValue]];
    
    /*
     * Article
     */
    NSDictionary *article = articleConsult[@"article"];
    
    // Set variables to page
    _AuteurLabel.text = [NSString stringWithFormat:@"par %@",article[@"author_name"]];
    _DateLabel.text = article[@"date"];
    _ImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@:%@@www.equi-libra.fr/uploads/%@", @"equilibra2015", @"equilibrawebsite2015", article[@"image_name"]]]]];
    //Mettre un titre a la view
    self.navigationItem.title = article[@"title"];
    //WebView Step HTML
    [_Content loadHTMLString:article[@"content"] baseURL:nil];
    [_Content setBackgroundColor:[UIColor clearColor]];
    [_Content setOpaque:NO];
    /*********************************************************************************/
    
    /*
     * Commentaire
     */
    _comments = articleConsult[@"comment"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"ShowComments"]) {
        
        ArticleCommentViewController *comments = [segue destinationViewController];
        
        comments.comments = _comments;
    }
}

@end
