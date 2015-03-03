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
@property NSMutableArray *annot;

@property (weak, nonatomic) IBOutlet MKMapView *mapa;
@property (weak, nonatomic) IBOutlet UISegmentedControl *detalheTipoMapa;
@property (weak, nonatomic) IBOutlet UIButton *botaoMinhaLocalizacao;
@property (strong, retain) CLLocationManager *gerenciadorDeLocalizacao;

- (IBAction)btnVoltar:(id)sender;
- (IBAction)tipoMapa:(id)sender;
- (IBAction)minhaLocalizacao:(id)sender;


@end

