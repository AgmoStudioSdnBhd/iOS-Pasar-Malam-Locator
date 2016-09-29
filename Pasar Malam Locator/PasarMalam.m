//
//  PasarMalam.m
//  Pasar Malam Locator
//
//  Created by Chui Wei Wai on 14/09/2016.
//  Copyright © 2016 Chui Wei Wai. All rights reserved.
//

#import "PasarMalam.h"

@implementation PasarMalam
- (instancetype)init {
    return [self initWithUid:@"" andAuthor:@"" andTitle:@"" andBody:@""];
}

- (instancetype)initWithUid:(NSString *)uid
                  andAuthor:(NSString *)author
                   andTitle:(NSString *)title
                    andBody:(NSString *)body {
    self = [super init];
    if (self) {
        self.uid = uid;
        self.author = author;
        self.title = title;
        self.body = body;
    }
    return self;
}
@end
