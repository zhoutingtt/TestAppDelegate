//
//  NewsViewController.m
//  TestAppDelegate
//
//  Created by Apple on 15/9/28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "NewsViewController.h"
#import "ProductListTableViewCell.h"

@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *_productListArr;
}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

//-(UITableViewCell *)tableView:(UITableViewCell *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *identifier = @"ProductCell";
//    ProductListTableViewCell *cell = [tableView dequeuerReusableCellWithIdentifier:identifier];
//    return cell;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"ProductCell";
    ProductListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.productName.text = (NSString *) _productListArr[indexPath.row][@"productName"];
    return cell;
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
