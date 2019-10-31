//
//  XAMPMap.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/28.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <AMapFoundationKit/AMapFoundationKit.h>
#import "XAMPMap.h"

#import "XAMPMapView.h"
#import "XAMPMarker.h"
#import "XAMPPanoramaView.h"
#import "XAMPPolyline.h"

@interface XAMPMap ()

@end

@implementation XAMPMap

- (instancetype)initMapWithKey:(NSString *)key {
  self = [super init];
  if (self) {
    [AMapServices sharedServices].apiKey = key;
  }
  return self;
}

- (nonnull id<XMapViewProtocol>)mapViewWithFrame:(CGRect)frame
                                      Coordinate:(CLLocationCoordinate2D)coord
                                       ZoomLevel:(float)level {
  return [[XAMPMapView alloc] initMapViewWithFrame:frame Coordinate:coord ZoomLevel:level];
}

- (nonnull id<XMarkerProtocol>)markerWithView:(nonnull UIView *)view
                                   Coordinate:(CLLocationCoordinate2D)coord
                                     UserData:(nonnull NSDictionary *)userData {
  return [[XAMPMarker alloc] initMarkerViewWithView:view Coordinate:coord UserData:userData];
}

- (nonnull id<XPolylineProtocol>)polylineWithCoordinates:(nonnull CLLocationCoordinate2D *)coords
                                                   Count:(NSUInteger)count
                                             StrokeColor:(UIColor *)strokeColor
                                             StrokeWidth:(CGFloat)strokeWidth {
  return [[XAMPPolyline alloc] initPolylineWithCoordinates:coords
                                                     Count:count
                                               StrokeColor:strokeColor
                                               StrokeWidth:strokeWidth];
}

- (nonnull id<XPanoramaViewProtocol>)panoramaViewWithFrame:(CGRect)frame
                                                       Key:(nonnull NSString *)key {
  return [[XAMPPanoramaView alloc] initPanoramaViewWithFrame:frame Key:key];
}

@end
