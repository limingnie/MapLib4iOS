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

@interface XBMKMapView () <BMKMapViewDelegate>
@property(nonatomic, strong) BMKMapView *mMapView;
@end

@implementation XBMKMapView

#pragma mark - XMapViewProtocol

- (nonnull instancetype)initMapViewWithFrame:(CGRect)frame
                                   LocationX:(double)x
                                   LocationY:(double)y
                                   ZoomLevel:(float)level {
  self = [super init];
  if (self) {
    self.mMapView.frame = frame;
    self.mMapView.centerCoordinate = CLLocationCoordinate2DMake(x, y);
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

#pragma mark - view

- (BMKMapView *)mMapView {
  if (_mMapView == nil) {
    _mMapView = [[BMKMapView alloc] init];
    _mMapView.delegate = self;
  }
  return _mMapView;
}

@end
