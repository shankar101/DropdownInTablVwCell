//
//  ViewController.m
//  SMDropdownInTblVwcell
//
//  Created by Shankar on 09/04/16.
//  Copyright © 2016 Shankar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
//Cell Identifire-------------------
#define cellData @"cell4data"
#define Commentcell @"cell4comments"
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arr4name                =   [NSMutableArray arrayWithObjects:@"Name",@"Social Network",@"School Name",@"Education Qualification",@"Job Profile",@"Company Name",@"Collage Name",@"Profile Name",@"Comments", nil];
    arr4sclNtwrk            =   [NSMutableArray arrayWithObjects:@"Orkut",@"Facebook",@"Twitter",@"LinkedIn",@"Blogger",@"flickr",@"Youtube",@"Other", nil];
    arr4EductnQualification =   [NSMutableArray arrayWithObjects:@"1. BeTech",@"2. Bsc.",@"3. BCA",@"4.BCom",@"5. BA",nil];
    arrjbPrfl               =   [NSMutableArray arrayWithObjects:@"0. Engineer",@"1. Scientist",@"2. Accountant",@"3. Hr manager",@"4. Manager",@"5. Invoice data analysis",@"Other",nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    [self loadDropdownTable];
    tblVw4datashow.separatorStyle=UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark - TableView Datasource & Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arr4name count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==[arr4name count]-1){
        return 165;
    }
    return 61;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==[arr4name count]-1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Commentcell];
        
        UILabel *lbl4Nm = (UILabel *)[cell.contentView viewWithTag:101];
        lbl4Nm.text=[arr4name objectAtIndex:indexPath.row];
        UITextView *txtVw=(UITextView *)[cell viewWithTag:102];
        txtVw.layer.borderWidth=1;
        txtVw.layer.borderColor=[[UIColor grayColor] CGColor];
        txtVw.delegate=self;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellData];
        
        UILabel *lbl4Nm = (UILabel *)[cell.contentView viewWithTag:101];
        lbl4Nm.text=[arr4name objectAtIndex:indexPath.row];
        UITextField *txtFld=(UITextField *)[cell viewWithTag:102];
        txtFld.delegate=self;
        //txtFld.tag=indexPath.row;
        txtFld.placeholder=[arr4name objectAtIndex:indexPath.row];
        if(indexPath.row==1||indexPath.row==3 || indexPath.row==4){
            if(indexPath.row==1){
                txtFld.text=strWhoObserv;
            }else if(indexPath.row==3){
                txtFld.text=stridictrCltrPlcy;
            }else{
                txtFld.text=strstndrdPrctc;
            }
            txtFld.userInteractionEnabled=NO;
        }else{
            txtFld.userInteractionEnabled=YES;
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.view endEditing:YES];
    selectedIndexpath=(int)indexPath.row;
    switch (indexPath.row) {
        case 0:
            
            
            break;
            
        case 1:
        {
            [tblVw4datashow endEditing:YES];
            CGRect cellRect = [tblVw4datashow rectForRowAtIndexPath:indexPath];
            CGPoint offsetPoint = [tblVw4datashow contentOffset];
            // remove the offset from the rowRect
            cellRect.origin.y -= offsetPoint.y;
            NSLog(@"%f",cellRect.origin.y);
            // Move to the actual position of the tableView
            cellRect.origin.x += tblVw4datashow.frame.origin.x;
            cellRect.origin.y += tblVw4datashow.frame.origin.y;
            NSLog(@"%f",cellRect.origin.x);
            NSLog(@"%f",cellRect.origin.y);
            _ddList.arrPrice=arr4sclNtwrk;
            [_ddList.tableView reloadData];
            vw4dropdown.alpha=1;
            UITableViewCell *cell=[tblVw4datashow cellForRowAtIndexPath:indexPath];
            UITextField  *txt=(UITextField *)[cell viewWithTag:102];
            _ddList.view.frame=CGRectMake(txt.frame.origin.x, cellRect.origin.y+cell.frame.size.height-15, txt.frame.size.width, MIN(self.ddList.arrPrice.count*30, 120));
            
            
        }
            break;
            
        case 2:
            
            break;
            
        case 3:
        {
            [tblVw4datashow endEditing:YES];
            CGRect cellRect = [tblVw4datashow rectForRowAtIndexPath:indexPath];
            CGPoint offsetPoint = [tblVw4datashow contentOffset];
            // remove the offset from the rowRect
            cellRect.origin.y -= offsetPoint.y;
            NSLog(@"%f",cellRect.origin.y);
            // Move to the actual position of the tableView
            cellRect.origin.x += tblVw4datashow.frame.origin.x;
            cellRect.origin.y += tblVw4datashow.frame.origin.y;
            NSLog(@"%f",cellRect.origin.x);
            NSLog(@"%f",cellRect.origin.y);
            _ddList.arrPrice=arr4EductnQualification;
            [_ddList.tableView reloadData];
            vw4dropdown.alpha=1;
            UITableViewCell *cell=[tblVw4datashow cellForRowAtIndexPath:indexPath];
            UITextField  *txt=(UITextField *)[cell viewWithTag:102];
            _ddList.view.frame=CGRectMake(txt.frame.origin.x, cellRect.origin.y+cell.frame.size.height-15, txt.frame.size.width, MIN(self.ddList.arrPrice.count*30, 120));
        }
            break;
        case 4:
        {
            [tblVw4datashow endEditing:YES];
            CGRect cellRect = [tblVw4datashow rectForRowAtIndexPath:indexPath];
            CGPoint offsetPoint = [tblVw4datashow contentOffset];
            // remove the offset from the rowRect
            cellRect.origin.y -= offsetPoint.y;
            NSLog(@"%f",cellRect.origin.y);
            // Move to the actual position of the tableView
            cellRect.origin.x += tblVw4datashow.frame.origin.x;
            cellRect.origin.y += tblVw4datashow.frame.origin.y;
            NSLog(@"%f",cellRect.origin.x);
            NSLog(@"%f",cellRect.origin.y);
            _ddList.arrPrice=arrjbPrfl;
            [_ddList.tableView reloadData];
            vw4dropdown.alpha=1;
            UITableViewCell *cell=[tblVw4datashow cellForRowAtIndexPath:indexPath];
            UITextField  *txt=(UITextField *)[cell viewWithTag:102];
            _ddList.view.frame=CGRectMake(txt.frame.origin.x, cellRect.origin.y+cell.frame.size.height-15, txt.frame.size.width, MIN(self.ddList.arrPrice.count*30, 120));
        }
            break;
        default:
            break;
    }
    
}
#pragma mark---------------------
#pragma mark Keyboard Method
- (void)keyboardWillShow:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    tblVw4datashow.contentInset=UIEdgeInsetsMake(0, 0, kbSize.height-60, 0);
}
-(void)keyboardWillHide:(NSNotification *)note {
    tblVw4datashow.contentInset=UIEdgeInsetsMake(0, 0,0, 0);
}
#pragma mark-----------------------
#pragma mark TextField Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    UITableViewCell *cell;
    if(SYSTEM_VERSION>=8.0){
        cell = (UITableViewCell *)[[textField superview] superview];
    }else{
        cell = (UITableViewCell *)[[[textField superview] superview] superview];
        
    }
    NSIndexPath *indexpath4txtfld=[tblVw4datashow indexPathForCell:cell];
    NSIndexPath *indexPath= [NSIndexPath indexPathForRow:indexpath4txtfld.row+1 inSection:0];
    selectedIndexpath=(int)indexPath.row;
    if(indexpath4txtfld.row==0){
        
        [tblVw4datashow endEditing:YES];
        CGRect cellRect = [tblVw4datashow rectForRowAtIndexPath:indexPath];
        CGPoint offsetPoint = [tblVw4datashow contentOffset];
        // remove the offset from the rowRect
        cellRect.origin.y -= offsetPoint.y;
        NSLog(@"%f",cellRect.origin.y);
        // Move to the actual position of the tableView
        cellRect.origin.x += tblVw4datashow.frame.origin.x;
        cellRect.origin.y += tblVw4datashow.frame.origin.y;
        NSLog(@"%f",cellRect.origin.x);
        NSLog(@"%f",cellRect.origin.y);
        _ddList.arrPrice=arr4sclNtwrk;
        [_ddList.tableView reloadData];
        vw4dropdown.alpha=1;
        UITableViewCell *cell=[tblVw4datashow cellForRowAtIndexPath:indexPath];
        UITextField  *txt=(UITextField *)[cell viewWithTag:102];
        _ddList.view.frame=CGRectMake(txt.frame.origin.x, cellRect.origin.y+cell.frame.size.height-15, txt.frame.size.width, MIN(self.ddList.arrPrice.count*30, 120));
    }else if (indexpath4txtfld.row==2){
        [tblVw4datashow endEditing:YES];
        CGRect cellRect = [tblVw4datashow rectForRowAtIndexPath:indexPath];
        CGPoint offsetPoint = [tblVw4datashow contentOffset];
        // remove the offset from the rowRect
        cellRect.origin.y -= offsetPoint.y;
        NSLog(@"%f",cellRect.origin.y);
        // Move to the actual position of the tableView
        cellRect.origin.x += tblVw4datashow.frame.origin.x;
        cellRect.origin.y += tblVw4datashow.frame.origin.y;
        NSLog(@"%f",cellRect.origin.x);
        NSLog(@"%f",cellRect.origin.y);
        _ddList.arrPrice=arr4EductnQualification;
        [_ddList.tableView reloadData];
        vw4dropdown.alpha=1;
        UITableViewCell *cell=[tblVw4datashow cellForRowAtIndexPath:indexPath];
        UITextField  *txt=(UITextField *)[cell viewWithTag:102];
        _ddList.view.frame=CGRectMake(txt.frame.origin.x, cellRect.origin.y+cell.frame.size.height-15, txt.frame.size.width, MIN(self.ddList.arrPrice.count*30, 120));
    }else if(indexpath4txtfld.row==arr4name.count-2){
        UITableViewCell *tablecell = [tblVw4datashow cellForRowAtIndexPath:indexPath];
        UITextView *txtVw=(UITextView *)[tablecell viewWithTag:102];
        txtVw.text=@"";
        txtVw.textColor=[UIColor blackColor];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, .1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [txtVw becomeFirstResponder];
        });
        
    }else{
        
        UITableViewCell *tablecell = [tblVw4datashow cellForRowAtIndexPath:indexPath];
        UITextField *txtfld=(UITextField *)[tablecell viewWithTag:102];
        [txtfld becomeFirstResponder];
    }
    return YES;
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    UITableViewCell *cell;
    if(SYSTEM_VERSION>=8.0){
        cell = (UITableViewCell *)[[textField superview] superview];
    }else{
        cell = (UITableViewCell *)[[[textField superview] superview] superview];
        
    }
    NSIndexPath *indexpath4txtfld=[tblVw4datashow indexPathForCell:cell];
    
    switch (indexpath4txtfld.row) {
        case 0:
            
            str4studentId=[textField.text stringByReplacingCharactersInRange:range withString:string];
            break;
            
        case 1:
            strWhoObserv=[textField.text stringByReplacingCharactersInRange:range withString:string];
            break;
        case 2:
            strrelateddemographics=[textField.text stringByReplacingCharactersInRange:range withString:string]   ;
            break;
            
        case 5:
            strEvidenceObsrvtn=[textField.text stringByReplacingCharactersInRange:range withString:string];
            break;
        case 6:
            strEvidncQuote=[textField.text stringByReplacingCharactersInRange:range withString:string];
            break;
        case 7:
            strProbingQstn=[textField.text stringByReplacingCharactersInRange:range withString:string];
            break;
            
        default:
            break;
    }
    return YES;
}
#pragma mark-------------------
#pragma mark TextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    if([textView.text isEqualToString:@"Comment"]){
        textView.text=@"";
        textView.textColor=[UIColor blackColor];
    }
    
    return YES;
}
- (void)textViewDidBeginEditing:(UITextView *)textView{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:8 inSection:0];
    [tblVw4datashow scrollToRowAtIndexPath:indexPath
                          atScrollPosition:UITableViewScrollPositionMiddle
                                  animated:NO];
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    if(textView.text.length==0){
        textView.textColor=[UIColor grayColor];
        textView.text=@"Comment";
    }
    
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    strcmnts=[textView.text stringByReplacingCharactersInRange:range withString:text];
    
    return YES;
}
#pragma mark DropDown Table
-(void)loadDropdownTable
{
    self.ddList = [[DropDownList alloc] initWithStyle:UITableViewStylePlain ArrData:arr4sclNtwrk];
    self.ddList.view.userInteractionEnabled = YES;
    vw4dropdown=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    vw4dropdown.backgroundColor=[UIColor clearColor];
    vw4dropdown.alpha=0;
    [vw4dropdown addSubview:_ddList.view];
    self.ddList.tableView.tag = 97531;
    self.ddList._delegate = self;
    [self.view addSubview:vw4dropdown];
    
}
#pragma mark---------------
#pragma mark DropDwnListDelegate
-(void)setText{
    if(selectedIndexpath==1){
        strWhoObserv=_ddList.selectedCellText;
    }else if(selectedIndexpath==3){
        stridictrCltrPlcy=_ddList.selectedCellText;
    }else{
        strstndrdPrctc=_ddList.selectedCellText;
    }
    vw4dropdown.alpha=0;
    [tblVw4datashow reloadData];
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    vw4dropdown.alpha=0;
}
@end
