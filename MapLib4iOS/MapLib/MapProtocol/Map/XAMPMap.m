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
                                       LocationX:(double)x
                                       LocationY:(double)y
                                       ZoomLevel:(float)level {
  return [[XAMPMapView alloc] initMapViewWithFrame:frame LocationX:x LocationY:y ZoomLevel:level];
}

- (nonnull id<XMarkerProtocol>)markerWithView:(nonnull UIView *)view
                                    LocationX:(double)x
                                    LocationY:(double)y
                                     UserData:(nonnull NSDictionary *)userData {
  return [[XAMPMarker alloc] initMarkerViewWithView:view LocationX:x LocationY:y UserData:userData];
}

- (nonnull id<XPolylineProtocol>)polylineWithCoordinates:(nonnull CLLocationCoordinate2D *)coords
                                                   Count:(NSUInteger)count {
  return [[XAMPPolyline alloc] initPolylineWithCoordinates:coords Count:count];
}

@end
