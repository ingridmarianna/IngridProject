//
//  QMGroupContactListViewController.h

//
//  Created by Hideki on 3/18/16.
//  Copyright © 2016 Hideki_Ingrid. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QMGroupContactListViewController;

@protocol QMGroupContactListViewControllerDelegate <NSObject>

- (void)groupContactListViewController:(QMGroupContactListViewController *)groupContactListViewController didSelectUser:(QBUUser *)selectedUser;
- (void)groupContactListViewController:(QMGroupContactListViewController *)groupContactListViewController didDeselectUser:(QBUUser *)deselectedUser;
- (void)groupContactListViewController:(QMGroupContactListViewController *)groupContactListViewController didScrollContactList:(UIScrollView *)scrollView;

@end

@interface QMGroupContactListViewController : UITableViewController

@property (weak, nonatomic) id <QMGroupContactListViewControllerDelegate>delegate;

- (void)deselectUser:(QBUUser *)user;

- (void)performSearch:(NSString *)searchText;

@end
