//
//  PriorityPicker.h
//  Todo
//
//  Created by Raman Singh on 2018-04-24.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PriorityPicker;
@protocol PriorityPickerViewControllerDelegate <NSObject>
- (void)priorityPickerViewController:(PriorityPicker *)controller didSelectPriority:(NSString *)priority;
@end
@interface PriorityPicker : UITableViewController
@property (nonatomic, weak) id <PriorityPickerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *priority;

@end
