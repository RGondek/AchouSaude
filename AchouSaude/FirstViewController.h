//
//  FirstViewController.h
//  AchouSaude
//
//  Created by Rubens Gondek on 2/26/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Hospital.h"

@interface FirstViewController : UIViewController <CLLocationManagerDelegate>

@property NSMutableArray *annot;

@property NSMutableArray *hospitais;
@property Hospital *hospit;

@property BOOL selected;
@property Hospital *selectedHosp;
@property CLLocationCoordinate2D selectedCoord;

@property CLPlacemark *itemDestino;
@property MKMapItem *mapIt;

@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property (weak, nonatomic) IBOutlet UISegmentedControl *detalheTipoMapa;
@property (weak, nonatomic) IBOutlet UIButton *botaoMinhaLocalizacao;
@property (strong, retain) CLLocationManager *gerenciadorDeLocalizacao;

- (IBAction)tipoMapa:(id)sender;
- (IBAction)minhaLocalizacao:(id)sender;
- (IBAction)btnVoltar:(id)sender;
- (void) gerarRotaPara;


@end

