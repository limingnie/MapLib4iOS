//
//  XMapProtocol.h
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/28.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMapViewProtocol.h"
#import "XMarkerProtocol.h"
#import "XPolylineProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol XMapProtocol <NSObject>

/// initMap
/// @param key key description
- (instancetype)initMapWithKey:(NSString *)key;

/// mapView
/// @param frame frame description
/// @param x x description
/// @param y y description
/// @param level level description
- (id<XMapViewProtocol>)mapViewWithFrame:(CGRect)frame
                               LocationX:(double)x
                               LocationY:(double)y
                               ZoomLevel:(float)level;

/// marker
/// @param view view description
/// @param x x description
/// @param y y description
/// @param userData userData description
- (id<XMarkerProtocol>)markerWithView:(UIView *)view
                            LocationX:(double)x
                            LocationY:(double)y
                             UserData:(NSDictionary *)userData;

/// polyline
/// @param coords coords description
/// @param count count description
- (id<XPolylineProtocol>)polylineWithCoordinates:(CLLocationCoordinate2D *)coords
                                           Count:(NSUInteger)count;

@end

NS_ASSUME_NONNULL_END
