//
//  FirstViewController.m
//  AchouSaude
//
//  Created by Rubens Gondek on 2/26/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import "FirstViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "TableViewController.h"
#import "Hospital.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize gerenciadorDeLocalizacao, mapa, botaoMinhaLocalizacao, detalheTipoMapa, hospitais, hospit, selected, selectedCoord, selectedHosp, itemDestino, mapIt;

- (void)viewDidLoad {
    [super viewDidLoad];
    mapa.delegate = self;
    [botaoMinhaLocalizacao.layer setBorderColor: [UIColor colorWithRed:0 green:0.4 blue:1 alpha:1].CGColor];
    [botaoMinhaLocalizacao.layer setBorderWidth:1.0f];
    [botaoMinhaLocalizacao.layer setCornerRadius:5.0f];
    [botaoMinhaLocalizacao setClipsToBounds:YES];
    
    [detalheTipoMapa.layer setBorderColor: [UIColor colorWithRed:0 green:0.4 blue:1 alpha:1].CGColor];
    [detalheTipoMapa.layer setBorderWidth:1.0f];
    [detalheTipoMapa.layer setCornerRadius:5.0f];
    [detalheTipoMapa setClipsToBounds:YES];
    
    gerenciadorDeLocalizacao = [[CLLocationManager alloc] init];
    [gerenciadorDeLocalizacao setDesiredAccuracy:kCLLocationAccuracyBest];
    [gerenciadorDeLocalizacao setDelegate:self];
    [gerenciadorDeLocalizacao startUpdatingLocation];
    
    //Permissão do iOS 8
    if ([gerenciadorDeLocalizacao respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [gerenciadorDeLocalizacao requestWhenInUseAuthorization];
    }
    
    mapa.showsUserLocation = YES;

    for (Hospital *hosp in hospitais) {
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder geocodeAddressString:[hosp address] completionHandler:^(NSArray *placemarks, NSError *error) {
            if (error) {
                NSLog(@"%@", error);
            } else {
                CLPlacemark *placemark = [placemarks lastObject];
                MKPointAnnotation *annotation = [[MKPointAnnotation alloc]init];
                annotation.coordinate = placemark.location.coordinate;
                annotation.title = [hosp name];
                annotation.subtitle = [hosp phone];
                [mapa addAnnotation:annotation];
                hosp.placemark = (MKPlacemark*)placemark;
            }
        }];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    if (selected) {
        itemDestino = selectedHosp.placemark;
        selectedCoord = itemDestino.location.coordinate;
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(selectedCoord, 1000, 1000);
        [mapa setRegion:region animated:YES];
    }
    selected = NO;
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    if ([annotation isKindOfClass:[MKPointAnnotation class]]) {
        MKAnnotationView *pinView = (MKAnnotationView*) [mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
        if (!pinView) {
            pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.canShowCallout = YES;
            pinView.image = [UIImage imageNamed:@"hospIcon.png"];
            pinView.calloutOffset = CGPointMake(0, 5);
            
            UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            UIControlState status = [rightButton state];
            [rightButton setTitle:@"Rota" forState:status];
            [rightButton setImage:[UIImage imageNamed:@"route.png"] forState:status];
            [rightButton addTarget:self action:@selector(gerarRotaPara) forControlEvents:UIControlEventTouchUpInside];
            pinView.rightCalloutAccessoryView = rightButton;
            
            UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"hosp.png"]];
            pinView.leftCalloutAccessoryView = iconView;
            pinView.leftCalloutAccessoryView.center = CGPointMake(0, 20);
        } else {
            pinView.annotation = annotation;
        }
        return pinView;
    }
    return nil;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocationCoordinate2D coord = [[locations lastObject]coordinate];
    if (selected) { coord = selectedCoord; }
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 1000, 1000);
    [mapa setRegion:region animated:YES];
    mapa.userTrackingMode = YES;
    [gerenciadorDeLocalizacao stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) gerarRotaPara{
    MKDirectionsRequest * request = [[MKDirectionsRequest alloc] init];
    request.source = [MKMapItem mapItemForCurrentLocation];
    mapIt = [[MKMapItem alloc] initWithPlacemark:itemDestino];
    NSLog(@"%@ , %.2f, %.2f, %@", mapIt.placemark.title, mapIt.placemark.coordinate.latitude, mapIt.placemark.coordinate.longitude, mapIt.placemark.thoroughfare);
    request.destination = mapIt;
    //request.requestsAlternateRoutes = YES;
    MKDirections *directions = [[MKDirections alloc] initWithRequest:request];
    [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
        if (error) {
            NSLog(@"ERRO %@", error);
        } else {
            if ([response.routes count] > 0) {
                [mapa removeOverlays:mapa.overlays];
                
                MKRoute *rota = response.routes[0];
                [mapa addOverlay:rota.polyline level:MKOverlayLevelAboveRoads];
            } else {
                NSLog(@"Não há rotas alternativas");
            }
        }
    }];
    [gerenciadorDeLocalizacao startUpdatingLocation];
}


- (MKOverlayRenderer *)mapView:(MKMapView *) mapView rendererForOverlay:(id<MKOverlay>)overlay {
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithOverlay:overlay];
    renderer.strokeColor = [UIColor redColor];
    renderer.lineWidth = 3.0;
    return renderer;
}


//Definindo o tipo de mapa.
- (IBAction)tipoMapa:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if(selectedSegment == 0) {
        [mapa setMapType:MKMapTypeStandard];
    }
    else if (selectedSegment == 1) {
        [mapa setMapType:MKMapTypeSatellite];
    }
    else {
        [mapa setMapType:MKMapTypeHybrid];
    }
}


- (IBAction)minhaLocalizacao:(id)sender {
    [gerenciadorDeLocalizacao startUpdatingLocation];
}

- (IBAction)btnVoltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
