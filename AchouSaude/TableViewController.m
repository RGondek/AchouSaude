//
//  TableViewController.m
//  AchouSaude
//
//  Created by Rubens Gondek on 2/26/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "Hospital.h"

@interface TableViewController ()

@end

@implementation TableViewController{
    Hospital *hosp;
}

@synthesize vetEnd, convenios, convenioHosp, hospitais, vetImg, vetNome;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIEdgeInsets inset = UIEdgeInsetsMake(25, 0, 0, 0);
    self.tableView.contentInset = inset;
    
    vetNome = [[NSMutableArray alloc] initWithObjects:@"ALBERT EINSTEIN", @"ALBERT SABIN", @"HOSPITAL ALVORADA", @"HOSPITAL BANDEIRANTES", @"HOSPITAL BENEFICIENCIA PORTUGUESA", nil];
    vetEnd = [[NSMutableArray alloc] initWithObjects:@"Avenida Albert Einstein, 627 - Bairro: Morumbi -São Paulo", @"Rua Brigadeiro Gavião Peixoto, 123 - Bairro: Lapa - São Paulo", @"Avenida Min Gabriel Resende Passos, 550 - Bairro: Moema - São paulo", @"Rua Barão de Iguape, 209 - Bairro: Liberdade", @"Rua Maestro Cardim, 769 - Bela Vista - Bairro: Paraíso -São Paulo", nil];
    vetImg = [[NSMutableArray alloc] initWithObjects:@"img01.png", @"img02.png", @"img03.png", @"img04.png", @"img05.png",@"img06.png",nil];
    
    for (int i = 0; i < [vetNome count]; i++) {
        hosp = [Hospital instanceWithName:vetNome[i] andAddress:vetEnd[i] andPhone:@"(11) 4446-7890" andTime:@"09:00 as 22:00" andImage:vetImg[i]];
        [hospitais addObject:hosp];
    }
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setValue:hospitais forKey:@"vetHospitais"];
    [user synchronize];
    
    
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
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(instancetype)init{
    self = [super init];
    
    if(self){
        vetNome = [[NSMutableArray alloc] initWithObjects:@"ALBERT EINSTEIN", @"ALBERT SABIN", @"HOSPITAL ALVORADA", @"HOSPITAL BANDEIRANTES", @"HOSPITAL BENEFICIENCIA PORTUGUESA", nil];
        vetEnd = [[NSMutableArray alloc] initWithObjects:@"Avenida Albert Einstein, 627 - Bairro: Morumbi -São Paulo", @"Rua Brigadeiro Gavião Peixoto, 123 - Bairro: Lapa - São Paulo", @"Avenida Min Gabriel Resende Passos, 550 - Bairro: Moema - São paulo", @"Rua Barão de Iguape, 209 - Bairro: Liberdade", @"Rua Maestro Cardim, 769 - Bela Vista - Bairro: Paraíso -São Paulo", nil];
        vetImg = [[NSMutableArray alloc] initWithObjects:@"img01.png", @"img02.png", @"img03.png", @"img04.png", @"img05.png",@"img06.png",nil];
    }
    return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [vetNome count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppCell" forIndexPath:indexPath];
    
    long row = [indexPath row];
    
    [cell.lblNomeCell setText:vetNome[row]];
    [cell.imgCell setImage:[UIImage imageNamed:vetImg[row]]];
    [cell.lblEndCell setText:vetEnd[row]];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [vetNome removeObjectAtIndex:[indexPath row]];
        [vetEnd removeObjectAtIndex:[indexPath row]];
        [vetImg removeObjectAtIndex:[indexPath row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
