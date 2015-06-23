//
//  ToDo.h
//  
//
//  Created by satsumasadaaki on 2015/06/23.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ToDo : NSManagedObject

@property (nonatomic, retain) NSString * task;
@property (nonatomic, retain) NSDate * date;

@end
