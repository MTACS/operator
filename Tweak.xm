#import <Foundation/Foundation.h>

@interface NSUserDefaults (Operator)
- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

@interface STTelephonyStatusDomainSIMInfo: NSObject
- (id)initWithSIMPresent:(BOOL)arg1 label:(id)arg2 shortLabel:(id)arg3 signalStrengthBars:(unsigned long long)arg4 maxSignalStrengthBars:(unsigned long long)arg5 serviceState:(unsigned long long)arg6 cellularServiceState:(unsigned long long)arg7 serviceDescription:(id)arg8 secondaryServiceDescription:(id)arg9 dataNetworkType:(unsigned long long)arg10 providingDataConnection:(BOOL)arg11 preferredForDataConnections:(BOOL)arg12 registeredWithoutCellular:(BOOL)arg13 callForwardingEnabled:(BOOL)arg14 ;
@end

static BOOL enabled;
static int primarySignalBars = 0;
static int secondarySignalBars = 0;
static int primaryDataType = 0;
static int secondaryDataType = 0;
static NSString *primaryCarrierName = nil;
static NSString *secondaryCarrierName = nil;
static NSString *primaryCarrierTag = nil;
static NSString *secondaryCarrierTag = nil;
static NSString *domainString = @"com.mtac.operator";
static NSString *notificationString = @"com.mtac.operator/preferences.changed";

%group Tweak
%hook STTelephonyStatusDomainData
- (STTelephonyStatusDomainSIMInfo *)primarySIMInfo {
	return [[%c(STTelephonyStatusDomainSIMInfo) alloc] initWithSIMPresent:YES label:@"Primary" shortLabel:primaryCarrierTag signalStrengthBars:primarySignalBars maxSignalStrengthBars:4 serviceState:2 cellularServiceState:2 serviceDescription:primaryCarrierName secondaryServiceDescription:nil dataNetworkType:primaryDataType providingDataConnection:YES preferredForDataConnections:YES registeredWithoutCellular:NO callForwardingEnabled:NO];
}
- (STTelephonyStatusDomainSIMInfo *)secondarySIMInfo {
	return [[%c(STTelephonyStatusDomainSIMInfo) alloc] initWithSIMPresent:YES label:@"Secondary" shortLabel:secondaryCarrierTag signalStrengthBars:secondarySignalBars maxSignalStrengthBars:4 serviceState:2 cellularServiceState:2 serviceDescription:secondaryCarrierName secondaryServiceDescription:nil dataNetworkType:secondaryDataType providingDataConnection:YES preferredForDataConnections:YES registeredWithoutCellular:NO callForwardingEnabled:NO];
}
%end
%end

static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
	NSNumber *enabledValue = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"enabled" inDomain:domainString];
	enabled = (enabledValue) ? [enabledValue boolValue] : YES;
	NSNumber *primarySignalBarsValue = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"primarySignalBars" inDomain:domainString];
	primarySignalBars = (primarySignalBarsValue) ? [primarySignalBarsValue intValue] : 0;
	NSNumber *secondarySignalBarsValue = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"secondarySignalBars" inDomain:domainString];
	secondarySignalBars = (secondarySignalBarsValue) ? [secondarySignalBarsValue intValue] : 0;
	NSNumber *primaryDataTypeValue = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryDataType" inDomain:domainString];
	primaryDataType = (primaryDataTypeValue) ? [primaryDataTypeValue intValue] : 0;
	NSNumber *secondaryDataTypeValue = (NSNumber *)[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryDataType" inDomain:domainString];
	secondaryDataType = (secondaryDataTypeValue) ? [secondaryDataTypeValue intValue] : 0;
	
	NSString *primaryCarrierNameValue = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryCarrierName" inDomain:domainString];
	primaryCarrierName = (primaryCarrierNameValue) ? primaryCarrierNameValue : @"";
	NSString *secondaryCarrierNameValue = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryCarrierName" inDomain:domainString];
	secondaryCarrierName = (secondaryCarrierNameValue) ? secondaryCarrierNameValue : @"";
	NSString *primaryCarrierTagValue = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"primaryCarrierTag" inDomain:domainString];
	primaryCarrierTag = (primaryCarrierTagValue) ? primaryCarrierTagValue : @"";
	NSString *secondaryCarrierTagValue = (NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"secondaryCarrierTag" inDomain:domainString];
	secondaryCarrierTag = (secondaryCarrierTagValue) ? secondaryCarrierTagValue : @"";
}

%ctor {
	notificationCallback(NULL, NULL, NULL, NULL, NULL);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)notificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);
	if (enabled) {
		NSLog(@"[+] OPERATOR DEBUG: INIT");
		%init(Tweak);
		return;
	}
}
