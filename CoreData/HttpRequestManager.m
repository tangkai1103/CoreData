//
//  HttpRequestManager.m
//  CoreData
//
//  Created by John on 15/12/2.
//  Copyright © 2015年 Mr Tang. All rights reserved.
//

#import "HttpRequestManager.h"
@interface HttpRequestManager ()
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSMutableArray *allData;
@end
@implementation HttpRequestManager
- (void)httpRrequestForDataWithUrl:(NSString *)url reloadDataBlock:(Block)block {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray *array = [NSArray arrayWithContentsOfURL:[NSURL URLWithString:url]];
        for (NSDictionary *dic in array) {
            NSEntityDescription *musicListED = [NSEntityDescription entityForName:@"MusicList" inManagedObjectContext:self.managedObjectContext];
            MusicList *musicList = [[MusicList alloc] initWithEntity:musicListED insertIntoManagedObjectContext:self.managedObjectContext];
            musicList.name = dic[@"name"];
            musicList.singer = dic[@"singer"];
            musicList.picUrl = dic[@"picUrl"];
            [self.allData addObject:musicList];
            NSError *error = nil;
            [self.managedObjectContext save:&error];
            if (error) {
                NSLog(@"存储失败 错误原因 %@",error);
            } else {
                NSLog(@"存储成功");
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            block(self.allData);
        });
        
    });
}


/**
 @brief   懒加载
 */

- (NSManagedObjectContext *)managedObjectContext {
    if (!_managedObjectContext) {
        _managedObjectContext = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
    }
    return _managedObjectContext;
}

- (NSMutableArray *)allData {
    if (!_allData) {
        _allData = [NSMutableArray array];
    }
    return _allData;
}





@end
