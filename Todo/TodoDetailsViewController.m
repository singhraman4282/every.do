//
//  TodoDetailsViewController.m
//  Todo
//
//  Created by Raman Singh on 2018-04-24.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import "TodoDetailsViewController.h"

@interface TodoDetailsViewController ()
@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextField *descTextField;
@property (strong, nonatomic) IBOutlet UILabel *prioLable;
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;


@end

@implementation TodoDetailsViewController
{
    NSString *_priority;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.prioLable.text = @"Low";
    self.titleTextField.delegate = self;
    self.descTextField.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.titleTextField becomeFirstResponder];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"pickPriority"]) {
        PriorityPicker *priorityPicker = segue.destinationViewController;
        priorityPicker.delegate = self;
        priorityPicker.priority = _priority;
    }
}


- (void)priorityPickerViewController:(PriorityPicker *)controller didSelectPriority:(NSString *)priority {
    _priority = priority;
    self.prioLable.text = priority;
}





- (IBAction)done:(UIBarButtonItem *)sender {
    
    if (![self.titleTextField.text isEqualToString:@""] && ![self.descTextField.text isEqualToString:@""]) {
        
        todo *todoo = [[todo alloc] init];
        todoo.title = self.titleTextField.text;
        todoo.taskDescription = self.descTextField.text;
        todoo.priority = self.prioLable.text;
        todoo.status = @"Incompete";
        todoo.deadline = self.datePicker.date;
        
        [self.delegate todoDetailsViewControllerUserAddedToDo:self didAddTodo:todoo];
    }
    
    else {
        [self.delegate todoDetailsViewControllerUserCancelled:self];
    }
    
    
}//done


- (IBAction)cancel:(UIBarButtonItem *)sender {
    
    [self.delegate todoDetailsViewControllerUserCancelled:self];
    
}//cancel


- (IBAction)datePickerValueChanged:(id)sender {
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    //    [formatter setDateFormat:@"dd/MMM/YYYY hh:min a"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    self.dateLabel.text=[NSString stringWithFormat:@"%@",[formatter stringFromDate:self.datePicker.date]];
    
    
    
}//datePickerValueChanged

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self.titleTextField resignFirstResponder];
    [self.descTextField resignFirstResponder];
    
    return true;
}
    



@end
