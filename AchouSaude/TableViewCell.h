//
//  TableViewCell.h
//  AchouSaude
//
//  Created by Rubens Gondek on 2/26/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgCell;
@property (weak, nonatomic) IBOutlet UILabel *lblNomeCell;
@property (weak, nonatomic) IBOutlet UILabel *lblEndCell;


@end
