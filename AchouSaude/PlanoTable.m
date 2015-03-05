//
//  PlanoTable.m
//  AchouSaude
//
//  Created by Rubens Gondek on 3/3/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import "PlanoTable.h"
#import "PlanoTableCell.h"
#import "Hospital.h"
#import "FirstViewController.h"

@interface PlanoTable ()

@end

@implementation PlanoTable

@synthesize convenioImg, convenioNome, hospit, hospitais;

- (void)viewDidLoad {
    [super viewDidLoad];
    UIEdgeInsets inset = UIEdgeInsetsMake(25, 0, 0, 0);
    self.tableView.contentInset = inset;
    
    
//    NSArray *Teste = [[NSArray alloc]initWithArray:hospitais];
//    [[NSUserDefaults standardUserDefaults] setObject:Teste forKey:@"vetHospitais"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
    
    convenioNome = [[NSMutableArray alloc]initWithObjects:@"Allianz",@"Amil",@"Amil Blue", @"Bradesco", @"Care Plus", @"Dix Amil", @"Intermédica", @"Gama Saúde",@"Golden Cross", @"Green Line", @"Itaú",@"Marítima",@"Medial",@"Med Service",@"Porto Seguro", @"Sul América", nil];
    //com
    
    convenioImg= [[NSMutableArray alloc]initWithObjects:@"cimg01.png", @"cimg02.png", @"cimg03.png", @"cimg04.png", @"cimg05.png",@"cimg06.png", @"cimg07.png", @"cimg08.png", @"cimg09.png", @"cimg10.png", @"cimg11.png",@"cimg12.png", @"cimg13.png", @"cimg14.png",@"cimg15.png", @"cimg16.png",nil];
    // Dispose of any resources that can be recreated.
    
    // Criação dos Dados
    
    NSArray *vetNome = [[NSArray alloc] initWithObjects:@"Albert Einstein", @"Albert Sabin", @"Hospital Alvorada", @"Hospital Bandeirantes", @"Hospital Beneficiência Portuguesa", nil];
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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    // Return the number of rows in the section.
    return convenioNome.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // Configure the cell...
    
    PlanoTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlanoCell" forIndexPath:indexPath];
    long row = [indexPath row];
    
    [cell.namePlano setText:convenioNome [row]];
    [cell.imgPlano setImage:[UIImage imageNamed:convenioImg[row]]];
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]isEqualToString:@"showMap"]) {
        [segue destinationViewController];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        long row = [indexPath row];
        
        FirstViewController *map = (FirstViewController *) segue.destinationViewController;
        NSMutableArray *hospPlano = [[NSMutableArray alloc] init];
        for (Hospital *hosp in hospitais) {
            if ([[hosp convenios] containsObject:convenioNome[row]]) {
                [hospPlano addObject:hosp];
            }
        }
        map.hospitais = [[NSMutableArray alloc] initWithArray:hospPlano];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
