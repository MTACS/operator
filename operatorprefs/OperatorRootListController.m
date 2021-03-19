#include "OperatorRootListController.h"

@implementation OperatorRootListController
@synthesize applyButton;
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}
	return _specifiers;
}
- (void)apply:(id)sender {
	// AudioServicesPlaySystemSound(1519);
	pid_t pid;
	const char *args[] = {"killall", "backboardd", NULL};
	posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char *const *)args, NULL);
}
- (void)viewDidLoad {
	[super viewDidLoad];

	UIButton *apply = [UIButton buttonWithType:UIButtonTypeCustom];
    apply.frame = CGRectMake(0,0,30,30);
    apply.layer.cornerRadius = apply.frame.size.height / 2;
    apply.layer.masksToBounds = YES;
    [apply setImage:[UIImage systemImageNamed:@"checkmark.circle.fill"] forState:UIControlStateNormal];
    [apply addTarget:self action:@selector(apply:) forControlEvents:UIControlEventTouchUpInside];
    
    applyButton = [[UIBarButtonItem alloc] initWithCustomView:apply];
    
    self.navigationItem.rightBarButtonItems = @[applyButton];
}
- (void)source {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/MTACS/operator"]];
}
@end

@implementation SIMOneController
@synthesize doneButton;
- (void)viewDidLoad {
	[super viewDidLoad];

	UIButton *done = [UIButton buttonWithType:UIButtonTypeCustom];
    done.frame = CGRectMake(0,0,30,30);
    done.layer.cornerRadius = done.frame.size.height / 2;
    done.layer.masksToBounds = YES;
    [done setImage:[UIImage systemImageNamed:@"keyboard.chevron.compact.down"] forState:UIControlStateNormal];
    [done addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    
    doneButton = [[UIBarButtonItem alloc] initWithCustomView:done];
    
    self.navigationItem.rightBarButtonItems = @[doneButton];
}
- (void)loadView {
	[super loadView];
	((UITableView *)[self table]).keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
}
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"SIMOne" target:self];
	}
	return _specifiers;
}
- (void)dismiss:(id)sender {
	[self.view endEditing:YES];
}
@end

@implementation SIMTwoController
@synthesize doneButton;
- (void)viewDidLoad {
	[super viewDidLoad];

	UIButton *done = [UIButton buttonWithType:UIButtonTypeCustom];
    done.frame = CGRectMake(0,0,30,30);
    done.layer.cornerRadius = done.frame.size.height / 2;
    done.layer.masksToBounds = YES;
    [done setImage:[UIImage systemImageNamed:@"keyboard.chevron.compact.down"] forState:UIControlStateNormal];
    [done addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    
    doneButton = [[UIBarButtonItem alloc] initWithCustomView:done];
    
    self.navigationItem.rightBarButtonItems = @[doneButton];
}
- (void)loadView {
	[super loadView];
	((UITableView *)[self table]).keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
}
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"SIMTwo" target:self];
	}
	return _specifiers;
}
- (void)dismiss:(id)sender {
	[self.view endEditing:YES];
}
@end

