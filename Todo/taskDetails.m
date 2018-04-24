//
//  taskDetails.m
//  Todo
//
//  Created by Raman Singh on 2018-04-24.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import "taskDetails.h"

@interface taskDetails ()
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *taskDetailsLabel;
@property (strong, nonatomic) IBOutlet UILabel *priorityLabel;
@property (strong, nonatomic) IBOutlet UILabel *status;





@end

@implementation taskDetails

- (void)viewDidLoad {
    [super viewDidLoad];
   self.titleLabel.text = self.thisTodo.title;
   self.taskDetailsLabel.text = self.thisTodo.taskDescription;
    self.priorityLabel.text = self.thisTodo.priority;
    self.status.text = self.thisTodo.status;
    
    
    
    
}

-(void) userViewedTask:(TodoTableViewController *)controller didViewTask:(todo *)viewTodo {
    
    self.thisTodo = viewTodo;
    NSLog(@"todo title is %@", self.thisTodo.title);
    self.titleLabel.text = self.thisTodo.title;
    
}


- (IBAction)changeStatus:(UIButton *)sender {


    self.thisTodo.status = @"Complete!";



}//changeStatus











@end
