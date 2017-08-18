//
//  CreatingViewController.m
//  receipts
//
//  Created by Jaewon Kim on 2017-08-17.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import "CreatingViewController.h"
#import "AppDelegate.h"
#import "TagTableViewCell.h"

@interface CreatingViewController () <UITableViewDelegate,UITableViewDataSource, UITableViewDelegate>

@property NSArray<Tag*> *tags;
@property NSPersistentContainer *persistentContainer;
@property AppDelegate *appDelegate;
@property NSMutableSet<Tag*> *selectedTags;

@property (weak, nonatomic) IBOutlet UITextView *noteTextView;

@end

@implementation CreatingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    self.persistentContainer = self.appDelegate.persistentContainer;
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"firstRun"] == YES)
    {
        Tag *familyTag = [[Tag alloc]initWithContext:self.persistentContainer.viewContext];
        familyTag.tagName = @"Family";
        
        Tag *businessTag = [[Tag alloc]initWithContext:self.persistentContainer.viewContext];
        businessTag.tagName = @"Business";
    
        Tag *personalTag = [[Tag alloc]initWithContext:self.persistentContainer.viewContext];
        personalTag.tagName = @"Personal";
        
        
        [self.appDelegate saveContext];
    }
    self.selectedTags = [NSMutableSet new];
    NSError *error = nil;
    NSFetchRequest<Tag*> *fetchTagsRequest = [Tag fetchRequest];
    self.tags = [self.persistentContainer.viewContext executeFetchRequest:fetchTagsRequest error:&error];

}

//-(void)setCategories{
//    
//}

#pragma mark - tableView methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    

    return self.tags.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TagTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cvctccell" forIndexPath:indexPath];
    Tag *tag = [self.tags objectAtIndex:indexPath.row];
    [cell configureWithTag:tag];
    
    return cell;
    
}
- (IBAction)saveButton:(UIButton *)sender {
    
    Receipt *receipt = [[Receipt alloc]initWithContext:self.persistentContainer.viewContext];
    receipt.note = self.noteTextView.text;
    receipt.tags = self.selectedTags;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.selectedTags addObject:self.tags[indexPath.row]];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.selectedTags removeObject:self.tags[indexPath.row]];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
