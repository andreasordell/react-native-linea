//
//  RCTLinea.h
//  react-native-linea
//

#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
#import "DTDevices.h"

@interface RCTLinea : RCTEventEmitter <RCTBridgeModule, DTDeviceDelegate>
@property (nonatomic, strong) DTDevices *linea;
@property (nonatomic, assign) BOOL isConnected;
@property (nonatomic, assign) BOOL rfidOn;
@end