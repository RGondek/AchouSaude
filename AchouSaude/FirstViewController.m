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

@synthesize gerenciadorDeLocalizacao, mapa, botaoMinhaLocalizacao, detalheTipoMapa, hospitais, hospit, selected, selectedCoord, selectedHosp, annot;

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
    
    annot = [[NSMutableArray alloc] init];
    
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
                annotation.subtitle = [hosp time];
                [mapa addAnnotation:annotation];
                [annot addObject:annotation];
            }
        }];
    }
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    if (selected) {
        for (MKPointAnnotation *annotation in annot) {
            if ([selectedHosp name] == annotation.title) {
                selectedCoord = annotation.coordinate;
            }
        }
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(selectedCoord, 500, 500);
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
            pinView.calloutOffset = CGPointMake(0, 32);
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
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 500, 500);
    [mapa setRegion:region animated:YES];
    [gerenciadorDeLocalizacao stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)btnVoltar:(id)sender {
//    MKLocalSearchRequest *pedido = [[MKLocalSearchRequest alloc] init];
//    pedido.naturalLanguageQuery = @"Hosp ital";
//    pedido.region = mapa.region;
//    
//    MKLocalSearch *pesquisa = [[MKLocalSearch alloc] initWithRequest:pedido];
//    
//    _matchingItems = [[NSMutableArray alloc] init];
//    
//    [pesquisa startWithCompletionHandler:^(MKLocalSearchResponse
//                                           *response, NSError *error) {
//        if (response.mapItems.count == 0)
//            NSLog(@"No Matches");
//        else
//            for (MKMapItem *item in response.mapItems)
//            {
//                [_matchingItems addObject:item];
//                MKPointAnnotation *annotation =
//                [[MKPointAnnotation alloc]init];
//                annotation.coordinate = item.placemark.coordinate;
//                annotation.title = item.name;
//                [mapa addAnnotation:annotation];
//            }
//    }];
//
//}


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
    gerenciadorDeLocalizacao = [[CLLocationManager alloc] init];
    [gerenciadorDeLocalizacao setDesiredAccuracy:kCLLocationAccuracyBest];
    [gerenciadorDeLocalizacao setDelegate:self];
    [gerenciadorDeLocalizacao startUpdatingLocation];
}

- (IBAction)btnVoltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
