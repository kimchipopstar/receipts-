//
//  TagTableViewCell.h
//  receipts
//
//  Created by Jaewon Kim on 2017-08-17.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tag+CoreDataClass.h"

@interface TagTableViewCell : UITableViewCell

- (void) configureWithTag:(Tag *)tag;

@end
