//
//  taskDetails.h
//  Todo
//
//  Created by Raman Singh on 2018-04-24.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "todo.h"
#import "TodoTableViewController.h"

@class taskDetails;

@protocol UserChangedStatus <NSObject>
-(void)changedStaus:(taskDetails *)thisTaskDetails didModifyStatusOfToDo:(todo *)modifiedTodo;
@end
@interface taskDetails : UIViewController <todoDetailsViewControllerDelegate>
@property (nonatomic) todo *thisTodo;
@property (nonatomic) id <UserChangedStatus> delegate;
@end
