//
//  MusicList+CoreDataProperties.h
//  CoreData
//
//  Created by John on 15/12/3.
//  Copyright © 2015年 Mr Tang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "MusicList.h"

NS_ASSUME_NONNULL_BEGIN

@interface MusicList (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *singer;
@property (nullable, nonatomic, retain) NSString *picUrl;

@end

NS_ASSUME_NONNULL_END
