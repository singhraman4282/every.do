//
//  TodoTableViewController.m
//  Todo
//
//  Created by Raman Singh on 2018-04-24.
//  Copyright © 2018 Raman Singh. All rights reserved.
//

#import "TodoTableViewController.h"

@interface TodoTableViewController ()
//@property (nonatomic) todo *selectedTodo;
@end

@implementation TodoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.todoArray) {
        
        self.todoArray = [NSMutableArray new];
        
    }
        todo *newtodo = [todo new];
        newtodo.title = @"raman";
        newtodo.taskDescription = @"raman";
        newtodo.priority = @"High";
        newtodo.status = @"Incomplete";
        [self.todoArray addObject:newtodo];
        [self.tableView reloadData];

    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideToRightWithGestureRecognizer:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    swipeRight.delegate = self;
    
    
    
    
    [self.tableView addGestureRecognizer:swipeRight];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.todoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"todoCell"];
    
    todo *todoo = (self.todoArray)[indexPath.row];
    cell.titleLabel.text = todoo.title;
    cell.descLabel.text = todoo.taskDescription;
    cell.prioLabel.text = todoo.priority;
    cell.statusLabel.text = todoo.status;
    
    
    return cell;
}


- (void)todoDetailsViewControllerUserCancelled:(todo *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}//todoDetailsViewControllerUserCancelled


- (void)todoDetailsViewControllerUserAddedToDo:(todo *)controller didAddTodo:(todo *)todoo {
    
    [self.todoArray addObject:todoo];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.todoArray count] - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"todo Added");
    
}//todoDetailsViewControllerUserAddedToDo



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddTodo"]) {
        
        UINavigationController *navigationController = segue.destinationViewController;
        TodoDetailsViewController *todoDetailsViewController = [navigationController viewControllers][0];
        todoDetailsViewController.delegate = self;
    }
    
    if ([segue.identifier isEqualToString:@"taskDetails"]) {
        
       
        taskDetails *taskDetailsView = segue.destinationViewController;

        UITableViewCell *cell = (UITableViewCell *) sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];

        
        todo *selectedTodo = [self.todoArray objectAtIndex:indexPath.row];

        taskDetailsView.thisTodo = selectedTodo;
    }
    
}//prepareForSegue

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}//didSelectRow

-(void)slideToRightWithGestureRecognizer:(UISwipeGestureRecognizer *)gesture {
    NSLog(@"Swiped");
    

    CGPoint location = [gesture locationInView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:location];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    
    
    
    
/*    if(indexPath)
    {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    todo *this = [self.todoArray objectAtIndex:indexPath.row];
        this.status = @"completed";
        [self.tableView reloadData];
    }*/
}





@end


/*
 
 
 -(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 return true;
 }
 
 -(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 todo *thisTodo = [self.todoArray objectAtIndex:indexPath.row];
 thisTodo.status = @"Completed";
 [self.tableView reloadData];
 }//edit
 
 
 -(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
 NSString *completionString = @"Mark Complete?";
 return completionString;
 }

 */
