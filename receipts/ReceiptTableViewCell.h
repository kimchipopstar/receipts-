//
//  ReceiptTableViewCell.h
//  receipts
//
//  Created by Jaewon Kim on 2017-08-17.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "receipts+CoreDataModel.h"

@interface ReceiptTableViewCell : UITableViewCell

-(void)configureWithReceipts:(Receipt*)receipt;

@end
