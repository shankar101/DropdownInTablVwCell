//
//  DDList.h
//  DropDownList
//
//  Created by Shankar on 09/04/16.
//  Copyright © 2016 Shankar. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol PassValueDelegate;

@protocol PassValueDelegate <NSObject>

@optional
- (void)passValue:(NSString *)value Corelavelid:(int)_corelavelid pricelist:(NSMutableArray *)arr4priceList selecteedRow:(int)_selecteedrow;
-(void)setText;
-(void)categoryList;

@end

@interface DropDownList : UITableViewController {
	NSMutableArray	*_resultList;
	id <PassValueDelegate> _delegate;
    int selectIndexpath;
}
@property(nonatomic, strong)  NSMutableArray *arrPrice;
@property(nonatomic, strong) NSString *selectedCellText;
@property(nonatomic, strong) NSString *selectedCellCountryId;

@property(nonatomic, strong) NSString *selectedCellCategoryId;
@property(nonatomic, strong) NSString *selectedId;
@property (nonatomic, strong) NSMutableArray *_resultList;
@property (nonatomic, strong) id <PassValueDelegate> _delegate;
@property (nonatomic, weak) NSString *str4Which;
- (id)initWithStyle:(UITableViewStyle)style ArrData:(NSMutableArray *)arrData;
- (void)updateDataArrData:(NSMutableArray *)arrData;

- (NSInteger)DDnumberOfSectionsInTableView:(UITableView *)tableView;
- (NSInteger)DDtableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)DDtableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)DDtableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)DDtableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
