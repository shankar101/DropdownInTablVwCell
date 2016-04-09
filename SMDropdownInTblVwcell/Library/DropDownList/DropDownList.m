//
//  DDList.m
//  DropDownList
//
//  Created by Shankar on 09/04/16.
//  Copyright © 2016 Shankar. All rights reserved.
//

#import "DropDownList.h"
#import <QuartzCore/QuartzCore.h>


@implementation DropDownList
{
    NSInteger selectedCell;
    NSString *text2Show;
   
}

@synthesize _resultList, _delegate;
@synthesize  str4Which;
#pragma mark -
#pragma mark Initialization


- (id)initWithStyle:(UITableViewStyle)style ArrData:(NSMutableArray *)arrData {

    self = [super initWithStyle:style];
    if (self) {
        
        _resultList = [NSMutableArray array];
        _resultList=arrData;

    }
    return self;
}



#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.layer.borderColor=[UIColor colorWithRed:185.0/255.0 green:185.0/255.0 blue:185.0/255.0 alpha:1].CGColor;
    self.tableView.layer.borderWidth=2;
    self.tableView.clipsToBounds=YES;
    selectIndexpath=0;
 
	
}


- (void)updateDataArrData:(NSMutableArray *)arrData {
	//[_resultList removeAllObjects];
    
	[self.tableView reloadData];
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)DDnumberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [self DDnumberOfSectionsInTableView:tableView];
}

- (NSInteger)DDtableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_arrPrice count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self DDtableView:tableView numberOfRowsInSection:section];
}


// Customize the appearance of table view cells.

- (UITableViewCell *)DDtableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor=[UIColor clearColor];
    }
    cell.textLabel.numberOfLines=0;
    cell.textLabel.text=[self.arrPrice objectAtIndex:indexPath.row];
//    if ([str4Which isEqualToString:@"location"])
//    {
//        NSLog(@"%@",self.arrPrice);
//        CountryList *objcntryList=[self.arrPrice objectAtIndex:indexPath.row];
//        
//        cell.textLabel.text=objcntryList.countryname;
//        //cell.textLabel.text=[self.arrPrice objectAtIndex:indexPath.row];
//        NSLog(@"%@",cell.textLabel.text);
//    }
//    
//   
//    else if ([str4Which isEqualToString:@"category"])
//    {
//        
//            NSLog(@"%lu",(unsigned long)self.arrPrice.count);
//            CategoryList *objCategoryList;
//             objCategoryList=[_arrPrice objectAtIndex:indexPath.row];
//            cell.textLabel.text=objCategoryList.categoryname;
//            NSLog(@"%@",cell.textLabel.text);
//        
//    }else if ([str4Which isEqualToString:@"GropName"])
//    {
//        NSLog(@"%lu",(unsigned long)self.arrPrice.count);
//        Grouplist *objGroupList;
//        objGroupList=[_arrPrice objectAtIndex:indexPath.row];
//        cell.textLabel.text=objGroupList.groupname;
//        NSLog(@"%@",cell.textLabel.text);
//    }else if ([str4Which isEqualToString:@"MemberList"])
//    {
//        MemberList *objMembr;
//        objMembr=[_arrPrice objectAtIndex:indexPath.row];
//        cell.textLabel.text=objMembr.membername;
//    }
//    else
//    {
//        cell.textLabel.text = [_arrPrice objectAtIndex:indexPath.row];
//        NSLog(@"%@",cell.textLabel.text);
//    }
    
    cell.backgroundColor=[UIColor lightTextColor];
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica Neue" size:14.0];
    cell.selectionStyle=UITableViewCellSelectionStyleGray;
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [self DDtableView:tableView cellForRowAtIndexPath:indexPath];
}


#pragma mark -
#pragma mark Table view delegate

- (CGFloat)DDtableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    UIFont *font = [UIFont fontWithName:@"Helvetica Neue" size:16.0];
    NSString *str=[self.arrPrice objectAtIndex:indexPath.row];
    
    NSDictionary *attributes = @{NSFontAttributeName: font,
                                 };
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString: str attributes: attributes];
    CGRect rect = [attributedString boundingRectWithSize:CGSizeMake(self.tableView.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil];
    CGSize size4answere=rect.size;
     return size4answere.height;;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return [self DDtableView:tableView heightForRowAtIndexPath:indexPath];
}

- (void)DDtableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    selectIndexpath=(int)indexPath.row;
    NSIndexPath *rowPath=[NSIndexPath indexPathForRow:selectIndexpath inSection:1];
    UITableViewCell *cell=[tableView cellForRowAtIndexPath:rowPath];
    text2Show=cell.textLabel.text;
    NSLog(@"%@",text2Show);

       selectedCell=indexPath.row;
    _selectedCellText=[self.arrPrice objectAtIndex:indexPath.row];
//    if ([str4Which isEqualToString:@"location"])
//    {
//        NSLog(@"%@",self.arrPrice);
//        CountryList *objcntryList=[self.arrPrice objectAtIndex:indexPath.row];
//        _selectedCellText=objcntryList.countryname;
//        _selectedCellCountryId=objcntryList.countryid;
//        NSLog(@"%@",cell.textLabel.text);
//    }
//    else if ([str4Which isEqualToString:@"category"])
//    {
//        NSLog(@"%lu",(unsigned long)self.arrPrice.count);
//        CategoryList *objCategoryList;
//        objCategoryList=[_arrPrice objectAtIndex:indexPath.row];
//        _selectedCellText=objCategoryList.categoryname;
//        _selectedCellCategoryId=objCategoryList.categoryid;
//        
//    }else if ([str4Which isEqualToString:@"GropName"])
//    {
//        NSLog(@"%lu",(unsigned long)self.arrPrice.count);
//        Grouplist *objGroupList;
//        objGroupList=[_arrPrice objectAtIndex:indexPath.row];
//        _selectedCellText=objGroupList.groupname;
//        _selectedId=objGroupList.groupid;
//        NSLog(@"%@",cell.textLabel.text);
//    }else if ([str4Which isEqualToString:@"MemberList"])
//    {
//        MemberList *objMemberList;
//        objMemberList=[_arrPrice objectAtIndex:indexPath.row];
//        _selectedCellText=objMemberList.membername;
//        _selectedId=objMemberList.memberid;
//    }
//    else
//    {
//        _selectedCellText = [_arrPrice objectAtIndex:indexPath.row];
//        
//        NSLog(@"%@",cell.textLabel.text);
//    }

    //_selectedCellText=[_arrPrice objectAtIndex:indexPath.row];
    NSLog(@"%@",self.selectedCellText);
    [_delegate setText];
    
    
    [tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self DDtableView:tableView didSelectRowAtIndexPath:indexPath];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewDidUnload {

}


- (void)dealloc {
    
}


@end

