//
//  NewsTableViewController.m
//  网易新闻
//
//  Created by iMac on 16/7/20.
//  Copyright © 2016年 iMac. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsModel.h"
#import "NewsTableviewCell.h"
@interface NewsTableViewController ()
@property (nonatomic, strong) NSArray * dataArr;
@end

@implementation NewsTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 90;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;\
    
   
}
-(void)setUrlStr:(NSString *)urlStr{
    _urlStr = urlStr;
    [NewsModel downloadUrlstr:_urlStr uccessBlock:^(NSArray *arr) {
        NSLog(@"******%@",arr);
        self.dataArr = arr;
        [self.tableView reloadData];
        
    } failureBlock:^(NSError *error) {
        NSLog(@"NewsTableViewController---error  -- %@",error);
        
    }];
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier;
   
    
    // Configure the cell...
   
    NewsModel *model = self.dataArr[indexPath.row];
    
    
    if (model.imgType) {
        //大图
        identifier = @"bigCell";
        
    }else if (model.imgextra.count == 2){
    
    identifier = @"manyCell";
    
    }else {
    
    identifier = @"NewsTableviewCell";
    
    }
     NewsTableviewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.model = model;
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsModel *model = self.dataArr[indexPath.row];
    if (model.imgType) {
        //大图
        return 180;
        
    }else if (model.imgextra.count == 2){
        
        return 130;
        
    }else {
        
        return 80;
        
    }
    
}


@end
