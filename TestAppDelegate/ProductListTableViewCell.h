//
//  ProductListTableViewCell.h
//  TestAppDelegate
//
//  Created by Apple on 15/10/6.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *productName;
@property (weak, nonatomic) IBOutlet UILabel *nowPrice;
@property (weak, nonatomic) IBOutlet UILabel *oldPrice;
@property (weak, nonatomic) IBOutlet UILabel *specification;
@property (weak, nonatomic) IBOutlet UILabel *unit;
@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UIImageView *productLogo;
@property (weak, nonatomic) IBOutlet UIButton *btnBuy;

@end
