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

@synthesize gerenciadorDeLocalizacao, mapa, botaoMinhaLocalizacao, detalheTipoMapa, hospitais, hospit;

- (void)viewDidLoad {
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
    [super viewDidLoad];
    
    // UserDefaults
    // Criação dos Dados
    
    NSArray *vetNome = [[NSArray alloc] initWithObjects:@"ALBERT EINSTEIN", @"ALBERT SABIN", @"HOSPITAL ALVORADA", @"HOSPITAL BANDEIRANTES", @"HOSPITAL BENEFICIENCIA PORTUGUESA", nil];
    NSArray *vetEnd = [[NSArray alloc] initWithObjects:@"Avenida Albert Einstein, 627 - Bairro: Morumbi -São Paulo", @"Rua Brigadeiro Gavião Peixoto, 123 - Bairro: Lapa - São Paulo", @"Avenida Min Gabriel Resende Passos, 550 - Bairro: Moema - São paulo", @"Rua Barão de Iguape, 209 - Bairro: Liberdade", @"Rua Maestro Cardim, 769 - Bela Vista - Bairro: Paraíso -São Paulo", nil];
    NSArray *vetImg = [[NSArray alloc] initWithObjects:@"img01.png", @"img02.png", @"img03.png", @"img04.png", @"img05.png",@"img06.png",nil];
    
    NSMutableArray *convenioHosp = [[NSMutableArray alloc] init];
    NSArray *convenios = @[@"Allianz",@"Care Plus", @"Golden Cross", @"Dix Amil", @"Medial", @"Marítima"];
    [convenioHosp addObject:convenios];
    convenios = @[@"Allianz",@"Bradesco",@"Golden Cross", @"Dix/Amil",@"Intermédica", @"Marítima"];
    [convenioHosp addObject:convenios];
    convenios = @[@"Allianz",@"Amil",@"Amil Blue",@"Bradesco",@"Golden Cross", @"Dix/Amil",@"Intermédica", @"Itaú",@"Marítima",@"Med Service", @"Sul América"];
    [convenioHosp addObject:convenios];
    convenios = @[@"Allianz",@"Amil",@"Bradesco",@"Care Plus",@"Golden Cross", @"Green Line",@"Marítima",@"Medial",@"Med Service",@"Porto Seguro", @"Sul América"];
    [convenioHosp addObject:convenios];
    convenios = @[@"Allianz",@"Gama Saúde",@"Golden Cross", @"Intermédica",@"Marítima",@"Medial",@"Med Service",@"Porto Seguro", @"Sul América"];
    [convenioHosp addObject:convenios];
    
    hospitais = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [vetNome count]; i++) {
        hospit = [[Hospital alloc] initWithName:vetNome[i] andAddress:vetEnd[i] andPhone:@"98482397123" andTime:@"15h" andImage:vetImg[i] andConvenios:convenioHosp[i]];
        [hospitais addObject:hospit];
    }
    for (Hospital *hosp in hospitais) {
        NSLog(@"End: %@", [hosp address]);
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
            }
        }];
        NSLog(@"HOSPITAL: %@", [hosp name]);
    }
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocationCoordinate2D coord = [[locations lastObject]coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 150, 150);
    NSLog(@"Primeiro: %@", [locations lastObject]);
    
    // Insere Hospitais

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


- (IBAction)btnVoltar:(id)sender {
    
    
}

- (IBAction)minhaLocalizacao:(id)sender {
    gerenciadorDeLocalizacao = [[CLLocationManager alloc] init];
    [gerenciadorDeLocalizacao setDesiredAccuracy:kCLLocationAccuracyBest];
    [gerenciadorDeLocalizacao setDelegate:self];
    [gerenciadorDeLocalizacao startUpdatingLocation];
}

@end
