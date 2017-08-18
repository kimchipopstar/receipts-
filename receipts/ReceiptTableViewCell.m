//
//  ReceiptTableViewCell.m
//  receipts
//
//  Created by Jaewon Kim on 2017-08-17.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import "ReceiptTableViewCell.h"

@interface ReceiptTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ReceiptTableViewCell

-(void)configureWithReceipts:(Receipt *)receipt{
    self.titleLabel.text = receipt.note;
}

@end
