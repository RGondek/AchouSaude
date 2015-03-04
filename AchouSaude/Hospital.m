//
//  Hospital.m
//  AchouSaude
//
//  Created by Rubens Gondek on 3/4/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import "Hospital.h"

@implementation Hospital

@synthesize name, phone, address, time, convenios, image, coordinate;

static Hospital *_instance = nil;

+(Hospital*) instanceWithName:(NSString *)nome andAddress:(NSString *)add andPhone:(NSString *)phone andTime:(NSString *)time andImage:(NSString *)img{
    if (_instance == nil) {
        _instance = [[Hospital alloc] initWithName:nome andAddress:add andPhone:phone andTime:time andImage:img];
    }
    return _instance;
}

- (instancetype)initWithName:(NSString *)nome andAddress:(NSString *)end andPhone:(NSString *)tel andTime:(NSString *)hora andImage:(NSString *)img{
    self = [super init];
    
    if (self) {
        name = nome;
        address = end;
        phone = tel;
        time = hora;
        image = [UIImage imageNamed:img];
    
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder geocodeAddressString:end completionHandler:^(NSArray *placemarks, NSError *error) {
            if (error) {
                NSLog(@"%@", error);
            } else {
                CLPlacemark *placemark = [placemarks lastObject];
                coordinate = placemark.location.coordinate;
            }
        }];
    }
    return self;
}

@end
