//
//  MenuItem.m
//  Equilibra
//
//  Created by Steeve Chopart on 2/24/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import "MenuItem.h"

@implementation MenuItem

@synthesize cellType = _cellType;
@synthesize title = _title;
@synthesize iconName = _iconName;
@synthesize iconType = _iconType;
@synthesize indexParent = _indexParent;
@synthesize isOpen = _isOpen;
@synthesize submenu = _submenu;

+ (MenuItem*)initialize:(enum CellType)cellType :(NSString *)title :(NSString *)iconName :(NSString *)iconType :(NSInteger)indexParent :(NSMutableArray*)submenu {
    MenuItem*   item = [MenuItem new];
    
    item.cellType = cellType;
    item.title = title;
    item.iconName = iconName;
    item.iconType = iconType;
    item.indexParent = indexParent;
    item.isOpen = FALSE;
    item.submenu = submenu;
    return item;
}

@end
