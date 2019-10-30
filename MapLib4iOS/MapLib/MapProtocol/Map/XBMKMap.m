//
//  XBMKMapFactory.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/28.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import "XBMKMap.h"

#import "XBMKMapView.h"
#import "XBMKMarker.h"
#import "XBMKPolyline.h"

@interface XBMKMap () <BMKGeneralDelegate>

@end

@implementation XBMKMap

- (instancetype)initMapWithKey:(NSString *)key {
  self = [super init];
  if (self) {
    [BMKMapManager setCoordinateTypeUsedInBaiduMapSDK:BMK_COORDTYPE_COMMON];
    BMKMapManager *mapManager = [[BMKMapManager alloc] init];
    [mapManager start:key generalDelegate:self];
  }
  return self;
}

- (nonnull id<XMapViewProtocol>)mapViewWithFrame:(CGRect)frame
									  Coordinate:(CLLocationCoordinate2D)coord
                                       ZoomLevel:(float)level {
  return [[XBMKMapView alloc] initMapViewWithFrame:frame Coordinate:coord ZoomLevel:level];
}

- (nonnull id<XMarkerProtocol>)markerWithView:(nonnull UIView *)view
								   Coordinate:(CLLocationCoordinate2D)coord
                                     UserData:(nonnull NSDictionary *)userData {
  return [[XBMKMarker alloc] initMarkerViewWithView:view Coordinate:coord UserData:userData];
}

- (nonnull id<XPolylineProtocol>)polylineWithCoordinates:(nonnull CLLocationCoordinate2D *)coords
                                                   Count:(NSUInteger)count
                                             StrokeColor:(UIColor *)strokeColor
                                             StrokeWidth:(CGFloat)strokeWidth {
  return [[XBMKPolyline alloc] initPolylineWithCoordinates:coords
                                                     Count:count
                                               StrokeColor:strokeColor
                                               StrokeWidth:strokeWidth];
}

//联网
- (void)onGetNetworkState:(int)iError {
  if (0 != iError) {
    NSLog(@"onGetNetworkState %d", iError);
  }
}

//授权
- (void)onGetPermissionState:(int)iError {
  if (0 != iError) {
    NSLog(@"onGetPermissionState %d", iError);
  }
}

@end
