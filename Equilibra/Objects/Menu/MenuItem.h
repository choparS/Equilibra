//
//  MenuItem.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/24/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItem : NSObject  {
    
    enum CellType {
        MENU,
        GROUP_MENU,
        SUBMENU
    };
    
    enum CellType   cellType;
    NSString*       title;
    NSString*       iconName;
    NSString*       iconType;
    NSInteger       indexParent;
    BOOL            isOpen;
    NSMutableArray* submenu;

}

@property enum CellType                         cellType;
@property (strong, nonatomic) NSString*         title;
@property (strong, nonatomic) NSString*         iconName;
@property (strong, nonatomic) NSString*         iconType;
@property NSInteger                             indexParent;
@property BOOL                                  isOpen;
@property (strong, nonatomic) NSMutableArray*   submenu;


/*
 Fonction qui permet d'initialiser les données de la classe
 
 Parametres:
    - cellType : le type du menu (MENU, GROUP_MENU ou SUBMENU)
    - title : le titre du menu
    - iconName : le nom de l'icone représentant le menu
    - iconType : l'extension de l'icone représentant le menu
    - indexParent : l'index du menu parent (dans le cas d'un SUBMENU) sinon -1
    - submenu : un tableau contenant les sous-menu (dans le cas d'un GROUP_MENU) sinon nil
 Retour:
    L'instance créée et initialisée
 */
+ (MenuItem*)initialize:(enum CellType)cellType :(NSString*)title :(NSString*)iconName :(NSString*)iconType :(NSInteger)indexParent :(NSMutableArray*)submenu;

@end
