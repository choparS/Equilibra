//
//  Dialog.h
//  Equilibra
//
//  Created by Steeve Chopart on 2/23/14.
//  Copyright (c) 2014 Equilibra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dialog : NSObject

+(void)informDialog:(NSString*)title :(NSString*)message :(id)view;
+(void)confirmDialog:(NSString*)title :(NSString*)message :(id)view;
        
@end
