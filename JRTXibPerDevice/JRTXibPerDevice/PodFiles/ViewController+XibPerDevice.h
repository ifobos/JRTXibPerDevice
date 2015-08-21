//
//  ViewController+XibPerDevice.h
//  JRTXibPerDevice
//
//  Created by Juan Garcia on 8/21/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (XibPerDevice)
- (instancetype)initWithNibForActualDevice;
- (instancetype)initWithNibForActualDeviceInBundle:(NSBundle *)nibBundleOrNil;
@end