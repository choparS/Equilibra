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

+(MenuItem*)initialize:(enum CellType)cellType :(NSString*)title :(NSString*)iconName :(NSString*)iconType :(NSInteger)indexParent :(NSMutableArray*)submenu;

@end
