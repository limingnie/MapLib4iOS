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
								  Coordinate:(CLLocationCoordinate2D)coord
                                   ZoomLevel:(float)level {
  self = [super init];
  if (self) {
    self.mMapView.frame = frame;
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:coord.latitude longitude:coord.longitude zoom:level];
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

- (void)addMarkers:(NSArray *)markers {
	for (GMSMarker *m in markers) {
		m.map = self.mMapView;
	}
}

- (void)addOverlay:(nonnull id)polyline {
	GMSPolyline *p = polyline;
	p.map = self.mMapView;
}

- (GMSMapView *)mMapView {
  if (_mMapView == nil) {
    _mMapView = [[GMSMapView alloc] init];
    _mMapView.delegate = self;
  }
  return _mMapView;
}

@end
