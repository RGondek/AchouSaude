//
//  PlanoTable.m
//  AchouSaude
//
//  Created by Rubens Gondek on 3/3/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import "PlanoTable.h"
#import "PlanoTableCell.h"

@interface PlanoTable ()

@end

@implementation PlanoTable
@synthesize convenioImg, convenioNome;

- (void)viewDidLoad {
    [super viewDidLoad];
    UIEdgeInsets inset = UIEdgeInsetsMake(25, 0, 0, 0);
    self.tableView.contentInset = inset;
    
    convenioNome = [[NSMutableArray alloc]initWithObjects:@"Allianz",@"Amil",@"AMIL BLUE", @"BRADESCO", @"CARE PLUS", @"DIX AMIL", @"INTERMEDICA", @"GAMA SAUDE",@"GOLDEN CROSS", @"GREEN LINE", @"ITAU",@"MARITIMA",@"MEDIAL",@"MED SERVICE",@"PORTO SEGURO", @"SUL AMERICA", nil];
    //com
    
    convenioImg= [[NSMutableArray alloc]initWithObjects:@"cimg01.png", @"cimg02.png", @"cimg03.png", @"cimg04.png", @"cimg05.png",@"cimg06.png", @"cimg07.png", @"cimg08.png", @"cimg09.png", @"cimg10.png", @"cimg11.png",@"cimg12.png", @"cimg13.png", @"cimg14.png",@"cimg15.png", @"cimg16.png",nil];
    // Dispose of any resources that can be recreated.
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
