//
//  XBMKMarker.h
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/28.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKMapComponent.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYZBMKMarker : BMKPointAnnotation
@property (nonatomic,strong) NSDictionary *userData;
@property (nonatomic,strong) UIView *markerView;
@end

NS_ASSUME_NONNULL_END
