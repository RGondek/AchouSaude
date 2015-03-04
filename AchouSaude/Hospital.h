//
//  Hospital.h
//  AchouSaude
//
//  Created by Rubens Gondek on 3/2/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface Hospital : NSObject

@property NSString* name;
@property NSString* address;
@property NSMutableArray* convenios;
@property NSArray* phone;
@property NSArray* time;
@property UIImage* image;
@property CLLocationCoordinate2D coordinate;

@end
