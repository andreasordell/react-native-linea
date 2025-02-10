//
//  RCTLinea.m
//  react-native-linea
//

#import "RCTLinea.h"

#define BUTTON_ENABLED 1
#define BUTTON_DISABLED 0
#define MODE_MULTI_SCAN 2
#define MODE_SINGLE_SCAN 3
#define MODE_MOTION_DETECT 4
#define MODE_SINGLE_SCAN_RELEASE 5
#define MODE_MULTI_SCAN_NO_DUPLICATES 6

@implementation RCTLinea

RCT_EXPORT_MODULE();

+ (BOOL)requiresMainQueueSetup {
    return NO;
}

- (NSArray<NSString *> *)supportedEvents {
    return @[@"connectionState", @"rfcardInfo", @"debug", @"magneticInfo", @"barcodeInfo"];
}

- (NSDictionary *)constantsToExport {
    return @{
        @"BUTTON_ENABLED": @(BUTTON_ENABLED),
        @"BUTTON_DISABLED": @(BUTTON_DISABLED),
        @"MODE_MULTI_SCAN": @(MODE_MULTI_SCAN),
        @"MODE_SINGLE_SCAN": @(MODE_SINGLE_SCAN),
        @"MODE_MOTION_DETECT": @(MODE_MOTION_DETECT),
        @"MODE_SINGLE_SCAN_RELEASE": @(MODE_SINGLE_SCAN_RELEASE),
        @"MODE_MULTI_SCAN_NO_DUPLICATES": @(MODE_MULTI_SCAN_NO_DUPLICATES)
    };
}

RCT_EXPORT_METHOD(initializeScanner) {
    self.linea = [DTDevices sharedDevice];
    [self.linea setDelegate:self];
    [self.linea connect];
    self.rfidOn = NO;
}

RCT_EXPORT_METHOD(scanRfId) {
    [self.linea connect];
    int methods = CARD_SUPPORT_TYPE_A + CARD_SUPPORT_TYPE_B + CARD_SUPPORT_FELICA + CARD_SUPPORT_NFC;
    [self.linea rfInit:methods error:nil];
}

RCT_EXPORT_METHOD(setBarcodeScanMode:(int)mode) {
    [self.linea barcodeSetScanMode:mode error:nil];
}

RCT_EXPORT_METHOD(setBarcodeScanBeep:(BOOL)enabled) {
    [self.linea barcodeSetScanBeep:enabled volume:0 beepData:nil length:0 error:nil];
}

RCT_EXPORT_METHOD(setBarcodeScanButtonMode:(int)mode) {
    [self.linea barcodeSetScanButtonMode:mode error:nil];
}

@end