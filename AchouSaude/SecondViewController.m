//
//  SecondViewController.m
//  AchouSaude
//
//  Created by Rubens Gondek on 2/26/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize convenioHosp, convenios;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    convenioHosp = [[NSMutableArray alloc] init];
    convenios = @[@"ALIANZ",@"CARE PLUS", @"GOLDEN CROSS", @"DIX AMIL", @"MEDIAL", @"MARITIMA", @"VOLKSWAGEN"];
    [convenioHosp addObject:convenios];
    convenios = @[@"ALIANZ",@"BRADESCO",@"GOLDEN CROSS", @"DIX/AMIL",@"INTERMEDICA", @"MARITIMA", @"VOLKSWAGEN"];
    [convenioHosp addObject:convenios];
    convenios = @[@"ALIANZ",@"AMIL",@"AMIL BLUE",@"BRADESCO",@"GOLDEN CROSS", @"DIX/AMIL",@"INTERMEDICA", @"ITAU",@"MARITIMA",@"MED SERVICE", @"SUL AMERICA",@"VOLKSWAGEN"];
    [convenioHosp addObject:convenios];
    convenios = @[@"ALIANZ",@"AMIL",@"BRADESCO",@"CARE PLUS",@"GOLDEN CROSS", @"GREEN LINE",@"MARITIMA",@"MEDIAL",@"MED SERVICE",@"PORTO SEGURO", @"SUL AMERICA",@"VOLKSWAGEN"];
    [convenioHosp addObject:convenios];
    convenios = @[@"ALIANZ",@"GAMA SAUDE",@"GOLDEN CROSS", @"INTERMEDICA",@"MARITIMA",@"MEDIAL",@"MED SERVICE",@"PORTO SEGURO", @"SUL AMERICA",@"VOLKSWAGEN"];
    [convenioHosp addObject:convenios];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
