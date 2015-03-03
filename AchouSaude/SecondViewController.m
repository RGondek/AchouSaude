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
    convenios = @[@"AMIL",@"UNIMED"];
    [convenioHosp addObject:convenios];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
