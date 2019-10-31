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
#import "XPanoramaViewProtocol.h"
#import "XPolylineProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol XMapProtocol <NSObject>

/// initMap
/// @param key key description
- (instancetype)initMapWithKey:(NSString *)key;

/// mapView
/// @param frame frame description
/// @param coord x description
/// @param level level description
- (id<XMapViewProtocol>)mapViewWithFrame:(CGRect)frame
                              Coordinate:(CLLocationCoordinate2D)coord
                               ZoomLevel:(float)level;

/// marker
/// @param view view description
/// @param coord x description
/// @param userData userData description
- (id<XMarkerProtocol>)markerWithView:(UIView *)view
                           Coordinate:(CLLocationCoordinate2D)coord
                             UserData:(NSDictionary *)userData;

/// polyline
/// @param coords coords description
/// @param count count description
/// @param strokeColor strokeColor description
/// @param strokeWidth strokeWidth description
- (id<XPolylineProtocol>)polylineWithCoordinates:(CLLocationCoordinate2D *)coords
                                           Count:(NSUInteger)count
                                     StrokeColor:(UIColor *)strokeColor
                                     StrokeWidth:(CGFloat)strokeWidth;

/// panoramaView
/// @param frame frame description
/// @param key key description
- (id<XPanoramaViewProtocol>)panoramaViewWithFrame:(CGRect)frame Key:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
