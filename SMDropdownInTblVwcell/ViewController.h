//
//  ViewController.h
//  SMDropdownInTblVwcell
//
//  Created by Shankar on 09/04/16.
//  Copyright © 2016 Shankar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDownList.h"

@interface ViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate,PassValueDelegate>
{
    NSMutableArray *arr4name;
    __weak IBOutlet UITableView *tblVw4datashow;
    NSString *str4studentId;
    NSString *strWhoObserv;
    NSString *strrelateddemographics;
    NSString *stridictrCltrPlcy;
    NSString *strstndrdPrctc;
    NSString *strEvidenceObsrvtn;
    NSString *strEvidncQuote;
    NSString *strProbingQstn;
    NSString *strcmnts;
    UIView *vw4dropdown;
    NSMutableArray *arr4sclNtwrk;
    NSMutableArray *arr4EductnQualification;
    NSMutableArray *arrjbPrfl;
    int selectedIndexpath;
    
}
@property (nonatomic, strong) DropDownList *ddList;

@end

