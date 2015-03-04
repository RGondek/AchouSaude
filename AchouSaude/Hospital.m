//
//  Hospital.m
//  AchouSaude
//
//  Created by Rubens Gondek on 3/4/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import "Hospital.h"
#import <CoreLocation/CoreLocation.h>

@implementation Hospital

@synthesize name, phone, address, time, convenios, image;

- (instancetype)initWithName:(NSString *)nome andAddress:(NSString *)end andPhone:(NSString *)tel andTime:(NSString *)hora andImage:(NSString *)img andConvenios:(NSArray*)conv{
    self = [super init];
    
    if (self) {
        name = nome;
        address = end;
        phone = tel;
        time = hora;
        image = [UIImage imageNamed:img];
        convenios = [[NSArray alloc] initWithArray:conv];
    }
    return self;
}

@end
