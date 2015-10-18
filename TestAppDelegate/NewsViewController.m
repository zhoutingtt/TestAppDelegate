//
//  NewsViewController.m
//  TestAppDelegate
//
//  Created by Apple on 15/9/28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "NewsViewController.h"
#import "ProductListTableViewCell.h"
#import "AFHTTPRequestOperationManager.h"


@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *_productListArr;
    NSMutableArray *_imgUrlArr;
}
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self getProductList:nil categoryId:nil priceorder:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    return _productListArr.count;
}

//-(UITableViewCell *)tableView:(UITableViewCell *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *identifier = @"ProductCell";
//    ProductListTableViewCell *cell = [tableView dequeuerReusableCellWithIdentifier:identifier];
//    return cell;
//}
-(void)getProductList:(NSString *)productName categoryId:(NSString *)category priceorder:(NSString *)priceorder{
    NSString *url = [NSString stringWithFormat:@"http://www.jxshshop.cn/phone/baseshop/queryShopProductlist?corpid=1&start=0&limit=100"];
    
    NSString *urlString = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPRequestOperationManager *managers = [AFHTTPRequestOperationManager manager];
    managers.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [managers GET:urlString parameters:nil success:^void(AFHTTPRequestOperation * operation, id responseObject) {
        //        [hud hide:YES];
        //        [hud removeFromSuperview];
        NSDictionary *dic = [[NSDictionary alloc]initWithDictionary:responseObject];
        _productListArr = dic[@"data"];
        _imgUrlArr = [[NSMutableArray alloc]init];
        [self.tableview reloadData];
    } failure:^void(AFHTTPRequestOperation * operation, NSError * error) {
        NSLog(@"error:%@",error);
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *identifier = @"ProductCell";
    ProductListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
//       cell = [[ProductListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
       cell = [[[NSBundle mainBundle]loadNibNamed:@"ProductListTableViewCell" owner:self options:nil]objectAtIndex:0];
    }
    cell.productName.text = _productListArr[indexPath.row][@"productname"];
    cell.nowPrice.text = [NSString stringWithFormat:@"现价：%@", _productListArr[indexPath.row][@"shopprice"]];
    cell.oldPrice.text = [NSString stringWithFormat:@"原价：%@",_productListArr[indexPath.row][@"oldprice"]];
    cell.specification.text = [NSString stringWithFormat:@"规格：%@",_productListArr[indexPath.row][@"productspec"]];
    cell.unit.text = [NSString stringWithFormat:@"单位：%@",_productListArr[indexPath.row][@"measureunit"]];
    cell.shopName.text = [NSString stringWithFormat:@"店铺：%@",_productListArr[indexPath.row][@"shopname"]];
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 124;
}
@end
