//
//  TodoTableViewController.h
//  Todo
//
//  Created by Raman Singh on 2018-04-24.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "todo.h"
#import "TodoDetailsViewController.h"
#import "TableViewCell.h"
#import "taskDetails.h"

@class TodoTableViewController;

@protocol TodoTableViewControllerViewedTaskDelegate <NSObject>
-(void) userViewedTask:(TodoTableViewController *)controller didViewTask:(todo *)viewTodo;
@end
@interface TodoTableViewController : UITableViewController <todoDetailsViewControllerDelegate>
@property (nonatomic) NSMutableArray *todoArray;
@property (nonatomic) id <TodoTableViewControllerViewedTaskDelegate> delegate;
@end
