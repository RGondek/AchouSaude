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
#import "TableViewController.h"

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
    
    convenioNome = [[NSMutableArray alloc]initWithObjects:@"Allianz",@"Amil",@"Amil Blue", @"Bradesco", @"Care Plus", @"Dix/Amil", @"Intermédica", @"Gama Saúde",@"Golden Cross", @"Green Line", @"Itaú",@"Marítima",@"Medial",@"Med Service",@"Porto Seguro", @"Sul América", @"Unimed Paulistana", @"Unimed Seguros",nil];
    //com
    
    convenioImg= [[NSMutableArray alloc]initWithObjects:@"cimg01.png", @"cimg02.png", @"cimg03.png", @"cimg04.png", @"cimg05.png",@"cimg06.png", @"cimg07.png", @"cimg08.png", @"cimg09.png", @"cimg10.png", @"cimg11.png",@"cimg12.png", @"cimg13.png", @"cimg14.png",@"cimg15.png", @"cimg16.png", @"cimg17.png",@"cimg18.png", nil];
    // Dispose of any resources that can be recreated.
    
    // Criação dos Dados
    
    NSArray *vetNome = [[NSArray alloc] initWithObjects:@"Albert Einstein", @"Albert Sabin", @"Hospital Alvorada", @"Hospital Bandeirantes", @"Hospital Beneficiência Portuguesa", @"Cema Hospital Especializado",@"Cruz Vermelha", @"HCor", @"Edmundo Vasconcelos", @"InCor", @"Hospital Metropolitano",@"Oswaldo Cruz", @"Hospital Paulista", @"Ruben Berta", @"Hospital Sammaritano", @"Santa Cruz",@"Santa Isabel",@"Santa Joana", @"Santa Marcelina", @"Sino Brasileiro", nil];
    
    NSArray *vetEnd = [[NSArray alloc] initWithObjects:@"Avenida Albert Einstein, 627 - Bairro: Morumbi -São Paulo", @"Rua Brigadeiro Gavião Peixoto, 123 - Bairro: Lapa - São Paulo", @"Avenida Min Gabriel Resende Passos, 550 - Bairro: Moema - São paulo", @"Rua Barão de Iguape, 209 - Bairro: Liberdade", @"Rua Maestro Cardim, 769 - Bela Vista - Bairro: Paraíso -São Paulo",@"Rua do Oratório, 1369 - Bairro: Mooca - São Paulo",@"Avenida Moreira Guimarães, 699 - Bairro: Indianópolis - São Paulo",@"Rua Desembargador Eliseu Guilherme, 147 - Bairro: Paraíso - São Paulo", @"Rua Borges Lagoa, 1450 - Bairro: Vila Clementino - São Paulo", @"Avenida Doutor Enéas Carvalho Aguiar, 44 - Bairro: Cerqueira César - São Paulo", @"Rua Marcelina, 441 -  Bairro: Vila Romana - São Paulo",@"Rua João Julião, 331 - Bairro: Paraíso -São Paulo", @"Rua Dr. Diogo de Faria, 780 - Bairro: Vila Clementino - São Paulo", @"Avenida Ruben Berta, 1100 - Bairro: Indianópolis - São Paulo", @"Rua Conselheiro Brotero, 1486 - Bairro: Higienópolis - São Paulo", @"Rua Santa Cruz, 398 - Bairro: Vila Mariana - São Paulo", @"Rua Dona Veridiana, 311 - Bairro: Higienópolis - São Paulo", @"Rua do Paraíso, 432 - Bairro: Paraíso - São Paulo", @"Rua Santa Marcelina, 177 - Bairro: Itaquera - São Paulo", @"Rua Marechal Rondon, 299 - Centro - Osasco",nil];
    
    NSArray *vetImg = [[NSArray alloc] initWithObjects:@"img01.png", @"img02.png", @"img03.png", @"img04.png", @"img05.png",@"img06.png", @"img07.png", @"img08.png", @"img08.png", @"img10.png",@"img11.png",@"img12.png",@"img13.png",@"img14.png",@"img15.png",@"img16.png",@"img17.png",@"img18.png",@"img19.png",@"img20.png", nil];
    
    NSArray *vetPhone = [[NSArray alloc]initWithObjects:@"(11) 2151-1233", @"(11) 2189-1199", @"(11) 2186-9900", @"(11) 3345-2000", @"(11) 3505-1000", @"(11) 2602-8000", @"(11) 5056-8714", @"(11) 3053-6611", @"(11) 5080-4300", @"(11) 3069-5000", @"(11) 3677-2000", @"(11) 3549-0000", @"(11) 5087-8700", @"(11) 5908-6474", @"(11) 3821-5300", @"(11) 5080-2002", @"(11) 2176-7700", @"(11) 5080-6000", @"(11) 2070-6000", @"(11) 3652-8015", nil];
    
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
    convenios = @[@"Allianz",@"Amil", @"Bradesco", @"Care Plus",@"Golden Cross", @"Green Line", @"Intermédica",@"Marítima",@"Medial",@"Porto Seguro", @"Sul América", @"Unimed Paulistana"];
    [convenioHosp addObject:convenios];
    convenios = @[@"Allianz",@"Amil", @"Bradesco", @"Golden Cross", @"Intermédica", @"Medial",@"Porto Seguro", @"Sul América", @"Unimed Paulistana"];
    [convenioHosp addObject:convenios];
    convenios = @[@"Allianz",@"Amil", @"Bradesco", @"Care Plus", @"Golden Cross", @"Medial",@"Porto Seguro"];
    [convenioHosp addObject:convenios];
    convenios = @[@"Allianz",@"Amil", @"Bradesco", @"Care Plus", @"Marítima",@"Med Service",@"Porto Seguro", @"Sul América"];
    [convenioHosp addObject:convenios];
    convenios = @[@"Allianz",@"Amil", @"Bradesco", @"Care Plus",@"Golden Cross",@"Itaú",@"Marítima",@"Medial",@"Porto Seguro"];
    [convenioHosp addObject:convenios];
    convenios = @[@"Allianz",@"Amil", @"Bradesco", @"Care Plus",@"Dix/Amil", @"Golden Cross", @"Marítima",@"Medial",@"Med Service",@"Porto Seguro", @"Sul América"];
    [convenioHosp addObject:convenios];
    convenios = @[@"Allianz",@"Amil", @"Bradesco", @"Care Plus",@"Dix/Amil", @"Itaú", @"Golden Cross", @"Intermédica", @"Marítima",@"Medial",@"Med Service", @"Porto Seguro", @"Sul América", @"Unimed Paulistana"];
    [convenioHosp addObject:convenios];
    convenios = @[@"Allianz",@"Amil", @"Amil Blue", @"Bradesco", @"Care Plus",@"Dix/Amil", @"Itaú", @"Gama Saúde", @"Golden Cross", @"Green Line", @"Intermédica", @"Marítima", @"Med Service", @"Porto Seguro", @"Sul América", @"Unimed Paulistana", @"Unimed Seguros"];
    [convenioHosp addObject:convenios];
    convenios = @[@"Allianz",@"Amil", @"Bradesco", @"Care Plus",@"Dix/Amil",@"Gama Saúde", @"Marítima", @"Med Service", @"Porto Seguro", @"Sul América", @"Unimed Paulistana", @"Unimed Seguros"];
    [convenioHosp addObject:convenios];
    convenios = @[@"Allianz",@"Amil", @"Amil Blue", @"Bradesco", @"Care Plus",@"Dix/Amil",@"Gama Saúde", @"Golden Cross",@"Intermédica", @"Itaú", @"Marítima",@"Medial", @"Med Service", @"Sul América", @"Unimed Seguros"];
    [convenioHosp addObject:convenios];
    convenios = @[@"Allianz",@"Amil",  @"Bradesco", @"Care Plus",@"Dix/Amil", @"Gama Saúde", @"Intermédica", @"Marítima", @"Medial", @"Med Service", @"Porto Seguro", @"Sul América", @"Unimed Paulistana"];
    [convenioHosp addObject:convenios];
    convenios = @[@"Allianz",@"Amil", @"Amil Blue", @"Bradesco", @"Care Plus",@"Dix/Amil", @"Itaú", @"Gama Saúde", @"Golden Cross", @"Intermédica", @"Marítima", @"Med Service", @"Porto Seguro", @"Sul América", @"Unimed Paulistana"];
    [convenioHosp addObject:convenios];
    convenios = @[@"Allianz",@"Amil",@"Amil Blue", @"Bradesco", @"Care Plus", @"Dix/Amil", @"Intermédica", @"Gama Saúde",@"Golden Cross", @"Green Line", @"Itaú",@"Marítima",@"Medial",@"Med Service",@"Porto Seguro", @"Sul América", @"Unimed Paulistana", @"Unimed Seguros"];
    [convenioHosp addObject:convenios];
    convenios = @[@"Allianz",@"Amil", @"Bradesco", @"Care Plus", @"Dix/Amil", @"Intermédica", @"Gama Saúde",@"Golden Cross", @"Marítima",@"Medial",@"Med Service",@"Porto Seguro", @"Sul América", @"Unimed Paulistana"];
    [convenioHosp addObject:convenios];
    convenios = @[@"Allianz",@"Amil",@"Amil Blue", @"Bradesco", @"Care Plus", @"Dix/Amil", @"Gama Saúde",@"Golden Cross", @"Green Line", @"Marítima",@"Medial",@"Med Service",@"Porto Seguro", @"Unimed Seguros"];
    [convenioHosp addObject:convenios];
    
    
    
    
    
    
    hospitais = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [vetNome count]; i++) {
        hospit = [[Hospital alloc] initWithName:vetNome[i] andAddress:vetEnd[i] andPhone:vetPhone[i] andTime:@"15h" andImage:vetImg[i] andConvenios:convenioHosp[i]];
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
        
        //UITabBarController *tab = (UITabBarController *) segue.destinationViewController;
        FirstViewController *map = [[segue.destinationViewController viewControllers] objectAtIndex:0];
        TableViewController *list = [[segue.destinationViewController viewControllers] objectAtIndex:1];

        NSMutableArray *hospPlano = [[NSMutableArray alloc] init];
        for (Hospital *hosp in hospitais) {
            if ([[hosp convenios] containsObject:convenioNome[row]]) {
                [hospPlano addObject:hosp];
            }
        }
        map.hospitais = [[NSMutableArray alloc] initWithArray:hospPlano];
        list.hospitais = [[NSMutableArray alloc] initWithArray:hospPlano];
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
