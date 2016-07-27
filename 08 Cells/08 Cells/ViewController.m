//
//  ViewController.m
//  08 Cells
//
//  Created by tomandhua on 16/6/18.
//  Copyright © 2016年 tomandhua. All rights reserved.
//

#import "ViewController.h"
#import "NameAndColorCell.h"

static NSString *CellTableIdentifier = @"CellTableIdentifier";

@interface ViewController ()

@property (nonatomic, strong) NSArray * computers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.computers = @[@{@"name":@"Macbook Air", @"color":@"Silver"},
                       @{@"name":@"Macbook Pro", @"color":@"Silver"},
                       @{@"name":@"iMac", @"color":@"Silver"},
                       @{@"name":@"Mac mini", @"color":@"Silver"},
                       @{@"name":@"Mac Pro", @"color":@"Silver"}];
    
    UITableView *tableView = (id)[self.view viewWithTag:1];
//    [tableView registerClass:[NameAndColorCell class] forCellReuseIdentifier:CellTableIdentifier];
    tableView.rowHeight = 65;
    UINib * nib = [UINib nibWithNibName:@"NameAndColorCell" bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:CellTableIdentifier];
    
    UIEdgeInsets contentInset = tableView.contentInset;
    contentInset.top = 20;
    [tableView setContentInset:contentInset];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.computers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NameAndColorCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier forIndexPath:indexPath];
    
    NSDictionary *rowData = self.computers[indexPath.row];
    
    cell.name = rowData[@"name"];
    cell.color = rowData[@"color"];
    
    return cell;
}

@end
