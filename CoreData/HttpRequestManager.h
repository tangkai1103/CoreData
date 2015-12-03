//
//  HttpRequestManager.h
//  CoreData
//
//  Created by John on 15/12/2.
//  Copyright © 2015年 Mr Tang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^Block) (NSArray *array);
@interface HttpRequestManager : NSObject
- (void)httpRrequestForDataWithUrl:(NSString *)url reloadDataBlock:(Block)block;
@end
