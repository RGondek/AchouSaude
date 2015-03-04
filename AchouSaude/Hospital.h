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
@property NSArray* convenios;
@property NSString* phone;
@property NSString* time;
@property UIImage* image;

-(instancetype) initWithName:(NSString*)nome andAddress:(NSString*)end andPhone:(NSString*)tel andTime:(NSString*)hora andImage:(NSString*)img andConvenios:(NSArray*)conv;

@end