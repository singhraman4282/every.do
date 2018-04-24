//
//  TodoDetailsViewController.h
//  Todo
//
//  Created by Raman Singh on 2018-04-24.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "todo.h"
#import "PriorityPicker.h"

@protocol todoDetailsViewControllerDelegate <NSObject>
- (void)todoDetailsViewControllerUserCancelled:(todo *)controller;
- (void)todoDetailsViewControllerUserAddedToDo:(todo *)controller didAddTodo:(todo *)todoo;
@end


@interface TodoDetailsViewController : UITableViewController <PriorityPickerViewControllerDelegate>
@property (nonatomic, weak) id <todoDetailsViewControllerDelegate> delegate;
@end
