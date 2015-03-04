//
//  Hospital.h
//  AchouSaude
//
//  Created by Rubens Gondek on 3/4/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Hospital : NSObject

@property NSString* name;
@property NSString* address;
@property NSMutableArray* convenios;
@property NSString* phone;
@property NSString* time;
@property UIImage* image;
@property CLLocationCoordinate2D coordinate;

-(instancetype)initWithName:(NSString*)nome andAddress:(NSString*)add andPhone:(NSString*)phone andTime:(NSString*)time andImage:(NSString*)img;

@end