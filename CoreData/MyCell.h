//
//  MyCell.h
//  CoreDataDemo
//
//  Created by John on 15/12/2.
//  Copyright © 2015年 Mr Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *musicListImg;
@property (weak, nonatomic) IBOutlet UILabel *musicListSing;
@property (weak, nonatomic) IBOutlet UILabel *musicListSinger;

@end
