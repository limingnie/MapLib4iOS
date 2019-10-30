//
//  XBMKMapViewFactory.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/28.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKMapComponent.h>
#import "XBMKMapView.h"

#import "XYZBMKMarker.h"
#import "XYZBMKMarkerView.h"

#import "XYZBMKPolyline.h"

@interface XBMKMapView () <BMKMapViewDelegate>
@property(nonatomic, strong) BMKMapView *mMapView;
@end

@implementation XBMKMapView

#pragma mark - XMapViewProtocol

- (nonnull instancetype)initMapViewWithFrame:(CGRect)frame
								  Coordinate:(CLLocationCoordinate2D)coord
                                   ZoomLevel:(float)level {
  self = [super init];
  if (self) {
    self.mMapView.frame = frame;
    self.mMapView.centerCoordinate = coord;
    self.mMapView.zoomLevel = level;
    self.mMapView.userTrackingMode = BMKUserTrackingModeHeading;
  }
  return self;
}

- (id)mapView {
  return self.mMapView;
}

- (void)addMarker:(nonnull id)marker {
  [self.mMapView addAnnotation:(id<BMKAnnotation>)marker];
}

- (void)addOverlay:(nonnull id)polyline {
  [self.mMapView addOverlay:(id<BMKOverlay>)polyline];
}

#pragma mark - BMKMapViewDelegate

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView
             viewForAnnotation:(id<BMKAnnotation>)annotation {
  if ([annotation isKindOfClass:[XYZBMKMarker class]]) {
    NSString *identifier = @"kAnnotation";
    XYZBMKMarkerView *view =
        (XYZBMKMarkerView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (view == nil) {
      XYZBMKMarker *m = annotation;
      view = [[XYZBMKMarkerView alloc] initWithAnnotation:annotation
                                          reuseIdentifier:identifier
                                           annotationView:m.markerView];
      view.centerOffset = CGPointMake(0, -view.frame.size.height / 2);
    }
    return view;
  }
  return nil;
}

- (BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id<BMKOverlay>)overlay {
  if ([overlay isKindOfClass:[XYZBMKPolyline class]]) {
    BMKPolylineView *polylineView = [[BMKPolylineView alloc] initWithPolyline:overlay];
    XYZBMKPolyline *p = overlay;
    polylineView.strokeColor = p.strokeColor;
    polylineView.lineWidth = p.strokeWidth;
    return polylineView;
  }
  return nil;
}

#pragma mark - view

- (BMKMapView *)mMapView {
  if (_mMapView == nil) {
    _mMapView = [[BMKMapView alloc] init];
    _mMapView.delegate = self;
  }
  return _mMapView;
}

@end
