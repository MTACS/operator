#import <Preferences/PSListController.h>
#import "spawn.h"

@interface OperatorRootListController : PSListController
@property (nonatomic, retain) UIBarButtonItem *applyButton;
@end

@interface SIMOneController : PSListController
@property (nonatomic, retain) UIBarButtonItem *doneButton;
@end

@interface SIMTwoController : PSListController
@property (nonatomic, retain) UIBarButtonItem *doneButton;
@end