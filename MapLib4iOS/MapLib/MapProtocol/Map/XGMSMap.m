//
//  XGMSMapFactory.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/28.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <GoogleMaps/GoogleMaps.h>
#import "XGMSMap.h"

#import "XGMSMapView.h"
#import "XGMSMarker.h"
#import "XGMSPolyline.h"

@interface XGMSMap ()

@end

@implementation XGMSMap

- (instancetype)initMapWithKey:(NSString *)key {
  self = [super init];
  if (self) {
    [GMSServices provideAPIKey:key];
  }
  return self;
}

- (nonnull id<XMapViewProtocol>)mapViewWithFrame:(CGRect)frame
									  Coordinate:(CLLocationCoordinate2D)coord
                                       ZoomLevel:(float)level {
  return [[XGMSMapView alloc] initMapViewWithFrame:frame Coordinate:coord ZoomLevel:level];
}

- (nonnull id<XMarkerProtocol>)markerWithView:(nonnull UIView *)view
								   Coordinate:(CLLocationCoordinate2D)coord
                                     UserData:(nonnull NSDictionary *)userData {
  return [[XGMSMarker alloc] initMarkerViewWithView:view Coordinate:coord UserData:userData];
}

- (nonnull id<XPolylineProtocol>)polylineWithCoordinates:(nonnull CLLocationCoordinate2D *)coords
                                                   Count:(NSUInteger)count
                                             StrokeColor:(UIColor *)strokeColor
                                             StrokeWidth:(CGFloat)strokeWidth {
  return [[XGMSPolyline alloc] initPolylineWithCoordinates:coords
                                                     Count:count
                                               StrokeColor:strokeColor
                                               StrokeWidth:strokeWidth];
}

@end
