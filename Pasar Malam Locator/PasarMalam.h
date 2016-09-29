//
//  PasarMalam.h
//  Pasar Malam Locator
//
//  Created by Chui Wei Wai on 14/09/2016.
//  Copyright © 2016 Chui Wei Wai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PasarMalam : NSObject
@property(strong, nonatomic) NSString *uid;
@property(strong, nonatomic) NSString *author;
@property(strong, nonatomic) NSString *title;
@property(strong, nonatomic) NSString *body;
@property(assign, nonatomic) int starCount;
@property(strong, nonatomic) NSDictionary <NSString *, NSNumber *> *stars;

- (instancetype)initWithUid:(NSString *)uid
                  andAuthor:(NSString *)author
                   andTitle:(NSString *)title
                    andBody:(NSString *)body;
@end
