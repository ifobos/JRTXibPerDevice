//
//  ViewController+XibPerDevice.m
//  JRTXibPerDevice
//
//  Created by Juan Garcia on 8/21/15.
//  Copyright (c) 2015 Juan Garcia. All rights reserved.
//

#import "ViewController+XibPerDevice.h"

@implementation UIViewController (XibPerDevice)

- (instancetype)initWithNibForActualDevice
{
    return [self initWithNibForActualDeviceInBundle:nil];
}

- (instancetype)initWithNibForActualDeviceInBundle:(NSBundle *)nibBundleOrNil
{
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat portraitHeight = 0;
    CGFloat portraitWidth = 0;
    
    if (screenSize.height > screenSize.width)
    {
        portraitHeight = screenSize.height;
        portraitWidth  = screenSize.width;
    }
    else
    {
        portraitHeight = screenSize.width;
        portraitWidth  = screenSize.height;
    }
    
    //    4s	3.5 	- 320 x 480
    //    5     4       - 320 x 568
    //    6     4.7     - 375 x 667
    //    6+	5.5 	- 414 x 736
    //    iPad	iPad	- 768 x 1024
    
    NSString *nibName = nil;
    
    if (portraitWidth == 320 && portraitHeight == 480)
    {
        nibName = [self xibName320x480];
    }
    else if(portraitWidth == 320 && portraitHeight == 568)
    {
        nibName = [self xibName320x568];
    }
    else if(portraitWidth == 375 && portraitHeight == 667)
    {
        nibName = [self xibName375x667];
    }
    else if(portraitWidth == 414 && portraitHeight == 736)
    {
        nibName = [self xibName414x736];
    }
    else if(portraitWidth == 768 && portraitHeight == 1024)
    {
        nibName = [self xibName768x1024];
    }
    
    NSString *pathAndFileName =  nil;
    
    if (nibBundleOrNil)
    {
        pathAndFileName = [nibBundleOrNil pathForResource:nibName ofType:@"nib"];
    }
    else
    {
        pathAndFileName = [[NSBundle mainBundle] pathForResource:nibName ofType:@"nib"];
    }
    
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:pathAndFileName])
    {
        self = [self initWithNibName:nibName bundle:nibBundleOrNil];
    }
    else
    {
        self = [self initWithNibName:nil bundle:nil];
    }
    
    return self;
}




- (NSString *)abstractClassName
{
    NSString *className = NSStringFromClass([self class]);
    return className;
}


- (NSString *)xibName320x480
{
    return [NSString stringWithFormat:@"%@%@", [self abstractClassName], @"35"];
}

- (NSString *)xibName320x568
{
    return [NSString stringWithFormat:@"%@%@", [self abstractClassName], @"4"];
}

- (NSString *)xibName375x667
{
    return [NSString stringWithFormat:@"%@%@", [self abstractClassName], @"47"];
}

- (NSString *)xibName414x736
{
    return [NSString stringWithFormat:@"%@%@", [self abstractClassName], @"55"];
}

- (NSString *)xibName768x1024
{
    return [NSString stringWithFormat:@"%@%@", [self abstractClassName], @"IPad"];
}

@end