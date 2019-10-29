//
//  XMapViewProtocol.h
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/28.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XMapViewProtocol <NSObject>

/// initMapView
/// @param frame frame description
/// @param x x description
/// @param y y description
/// @param level level description
- (instancetype)initMapViewWithFrame:(CGRect)frame
                           LocationX:(double)x
                           LocationY:(double)y
                           ZoomLevel:(float)level;

/// mapView
- (id)mapView;

/// addMarker
/// @param marker marker description
- (void)addMarker:(id)marker;

/// addOverlay
/// @param polyline polyline description
- (void)addOverlay:(id)polyline;

@end

NS_ASSUME_NONNULL_END
