//
//  PlanoTable.h
//  AchouSaude
//
//  Created by Rubens Gondek on 3/3/15.
//  Copyright (c) 2015 Ckode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hospital.h"

@interface PlanoTable : UITableViewController

@property NSMutableArray *convenioNome;
@property NSMutableArray *convenioImg;

@property NSMutableArray *hospitais;
@property Hospital *hospit;

@end
