//
//  XGMSMapViewFactory.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/28.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <GoogleMaps/GoogleMaps.h>
#import "XGMSMapView.h"

@interface XGMSMapView () <GMSMapViewDelegate>
@property(nonatomic, strong) GMSMapView *mMapView;
@end

@implementation XGMSMapView

- (nonnull instancetype)initMapViewWithFrame:(CGRect)frame
                                   LocationX:(double)x
                                   LocationY:(double)y
                                   ZoomLevel:(float)level {
  self = [super init];
  if (self) {
    self.mMapView.frame = frame;
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:x longitude:y zoom:level];
    self.mMapView.camera = camera;
  }
  return self;
}

- (nonnull id)mapView {
  return self.mMapView;
}

- (void)addMarker:(nonnull id)marker {
  GMSMarker *m = marker;
  m.map = self.mMapView;
}

- (GMSMapView *)mMapView {
  if (_mMapView == nil) {
    _mMapView = [[GMSMapView alloc] init];
    _mMapView.delegate = self;
  }
  return _mMapView;
}

@end
