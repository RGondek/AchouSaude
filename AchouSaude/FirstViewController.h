//
//  FirstViewController.h
//  AchouSaude
//
//  Created by Rubens Gondek on 2/26/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface FirstViewController : UIViewController <CLLocationManagerDelegate>

@property NSMutableArray *matchingItems;

- (IBAction)btnVoltar:(id)sender;

@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property (strong, retain) CLLocationManager *gerenciadorDeLocalizacao;

- (IBAction)tipoMapa:(id)sender;

@end

