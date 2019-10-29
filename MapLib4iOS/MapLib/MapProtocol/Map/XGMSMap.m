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
                                       LocationX:(double)x
                                       LocationY:(double)y
                                       ZoomLevel:(float)level {
  return [[XGMSMapView alloc] initMapViewWithFrame:frame LocationX:x LocationY:y ZoomLevel:level];
}

- (nonnull id<XMarkerProtocol>)markerWithView:(nonnull UIView *)view
                                    LocationX:(double)x
                                    LocationY:(double)y
                                     UserData:(nonnull NSDictionary *)userData {
  return [[XGMSMarker alloc] initMarkerViewWithView:view LocationX:x LocationY:y UserData:userData];
}

@end
