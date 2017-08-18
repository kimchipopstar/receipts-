//
//  TagTableViewCell.m
//  receipts
//
//  Created by Jaewon Kim on 2017-08-17.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import "TagTableViewCell.h"

@interface TagTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *tagTitleLabel;

@end

@implementation TagTableViewCell

- (void) configureWithTag:(Tag *)tag
{
    self.tagTitleLabel.text = tag.tagName;
}

@end
