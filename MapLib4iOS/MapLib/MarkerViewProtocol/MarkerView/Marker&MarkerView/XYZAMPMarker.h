//
//  XYZAMPMarker.h
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/29.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYZAMPMarker : MAPointAnnotation
@property (nonatomic,strong) NSDictionary *userData;
@property (nonatomic,strong) UIView *markerView;
@end

NS_ASSUME_NONNULL_END
