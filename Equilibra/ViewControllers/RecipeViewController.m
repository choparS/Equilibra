//
//  RecipeViewController.m
//  Equilibra
//
//  Created by Brice LE BAIL on 17/06/2014.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "RecipeViewController.h"

@interface RecipeViewController ()

@property (nonatomic, strong) UIPanGestureRecognizer*   dynamicTransitionPanGesture;

@end

@implementation RecipeViewController

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
    
    
    // On lance le webservice pour récupérer la liste des recettes
    WebServices *wbs = [[WebServices alloc] init];
    NSDictionary *recipes = [wbs WBSRecipe:0];
    
    // Ajout des informations envoyées par le WebService dans des tableau afin de les load en boucle
    // sur la view
    _Title = [recipes valueForKey:@"title"];
    _Auteur = [recipes valueForKey:@"author_name"];
    _PrepaTime = [recipes valueForKey:@"preparation_time"];
    _CookingTime = [recipes valueForKey:@"cooking_time"];
    _Difficulty = [recipes valueForKey:@"difficulty"];
    _AverageNote = [recipes valueForKey:@"title"];
    _Images = [recipes valueForKey:@"image_name"];
    _Steps = [recipes valueForKey:@"steps"];
    _IdRecipes = [recipes valueForKey:@"id"];
}

/*
 * Menu Functions
 */
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    Settings*   settings = [Settings getInstance];
    
    // Initialisation du texte dans la langue paramétrée
    [_viewTitle setText:NSLocalizedStringFromTable(@"ForumViewTitle", settings.language, @"")];
    
    // Initialisation de la transition et du contrôle gestuel permettant d'ouvrir le menu en glissant le doigt de gauche à droite
    if ([(NSObject *)self.slidingViewController.delegate isKindOfClass:[MEDynamicTransition class]]) {
        MEDynamicTransition *dynamicTransition = (MEDynamicTransition *)self.slidingViewController.delegate;
        if (!self.dynamicTransitionPanGesture)
            self.dynamicTransitionPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:dynamicTransition action:@selector(handlePanGesture:)];
        
        [self.navigationController.view removeGestureRecognizer:self.slidingViewController.panGesture];
        [self.navigationController.view addGestureRecognizer:self.dynamicTransitionPanGesture];
    }
    else {
        [self.navigationController.view removeGestureRecognizer:self.dynamicTransitionPanGesture];
        [self.navigationController.view addGestureRecognizer:self.slidingViewController.panGesture];
    }
}

- (IBAction)menuButtonTapped:(id)sender {
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}

/*****************************************************************************************************/


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _Title.count;
}

// Configuration des cellules de la liste
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"RecipeTableCell";
    RecipeTableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier           forIndexPath:indexPath];
    
    // Configure the cell...
    int row = [indexPath row];
    cell.TitleLabel.text = _Title[row];
    cell.UsernameLabel.text = _Auteur[row];
    cell.PrepaTimeLabel.text = [NSString stringWithFormat:@"%@ min",_PrepaTime[row]];
    cell.CookingTimeLabel.text = [NSString stringWithFormat:@"%@ min",_CookingTime[row]];
    cell.ImageDifficulty.image = [UIImage imageNamed: [cell recupeImgNoteFromDiffulty:[_Difficulty[row] integerValue]]];
//    cell.AverageNoteLabel.text = _AverageNote[row];
    cell.ThumbImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@:%@@www.equi-libra.fr/uploads/crop/zoom/zoomCrop-%@", @"equilibra2015", @"equilibrawebsite2015", _Images[row]]]]];
    
    return cell;
}


// Envoie des informations present dans la cellule selectionnée vers la nouvelle view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"ShowDetails"]) {
        
        RecipeDetailViewController *Recipedetailviewcontroller = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        int row = [myIndexPath row];
        Recipedetailviewcontroller.IdRecipe = _IdRecipes[row];
    }
}


@end
