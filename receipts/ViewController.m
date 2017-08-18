//
//  ViewController.m
//  receipts
//
//  Created by Jaewon Kim on 2017-08-17.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import "ViewController.h"
#import "receipts+CoreDataModel.h"
#import "Tag+CoreDataClass.h"
#import "ReceiptTableViewCell.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property NSArray<Receipt*> *receipts;
@property NSArray<Tag*> *tags;
@property NSPersistentContainer *persistentContainer;
@property AppDelegate *appDelegate;

@property NSMutableArray<NSMutableArray<Receipt*>*> *organizedReceipts;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    self.persistentContainer = self.appDelegate.persistentContainer;
    
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    NSError *error = nil;
    
    NSFetchRequest<Receipt*> *fetchReceiptsReqeust = [Receipt fetchRequest];
    self.receipts = [self.persistentContainer.viewContext executeFetchRequest:fetchReceiptsReqeust error:&error];
    
    NSFetchRequest<Tag*> *fetchTagsRequest = [Tag fetchRequest];
    self.tags = [self.persistentContainer.viewContext executeFetchRequest:fetchTagsRequest error:&error];
    
    self.organizedReceipts = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < self.tags.count; i++) {
        NSMutableArray *array = [NSMutableArray new];
        Tag* tag = self.tags[i];
        for (Receipt* reciept in tag.reciepts) {
            [array addObject:reciept];
        }
        [self.organizedReceipts addObject:array];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return self.tags.count;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.organizedReceipts[section].count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ReceiptTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rtvc" forIndexPath:indexPath];
    
    Receipt *receipt = self.organizedReceipts[indexPath.section][indexPath.row];
    
    [cell configureWithReceipts:receipt];
    
    return cell;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return self.tags[section].tagName;
    
}



@end
