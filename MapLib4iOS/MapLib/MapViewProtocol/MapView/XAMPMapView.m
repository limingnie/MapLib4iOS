//
//  XAMPMapView.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/28.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MAMapKit/MAMapKit.h>
#import "XAMPMapView.h"

#import "XYZAMPMarker.h"
#import "XYZAMPMarkerView.h"

@interface XAMPMapView () <MAMapViewDelegate>
@property(nonatomic, strong) MAMapView *mMapView;
@end

@implementation XAMPMapView

- (nonnull instancetype)initMapViewWithFrame:(CGRect)frame
                                   LocationX:(double)x
                                   LocationY:(double)y
                                   ZoomLevel:(float)level {
  self = [super init];
  if (self) {
    self.mMapView.frame = frame;
    self.mMapView.centerCoordinate = CLLocationCoordinate2DMake(x, y);
    self.mMapView.zoomLevel = level;
  }
  return self;
}

- (nonnull id)mapView {
  return self.mMapView;
}

- (void)addMarker:(nonnull id)marker {
  [self.mMapView addAnnotation:(id<MAAnnotation>)marker];
}

- (void)addOverlay:(nonnull id)polyline {
  [self.mMapView addOverlay:(id<MAOverlay>)polyline];
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation {
  if ([annotation isKindOfClass:[XYZAMPMarker class]]) {
    static NSString *pointReuseIndetifier = @"pointReuseIndetifier";
    XYZAMPMarkerView *annotationView = (XYZAMPMarkerView *)[mapView
        dequeueReusableAnnotationViewWithIdentifier:pointReuseIndetifier];
    if (annotationView == nil) {
      XYZAMPMarker *m = annotation;
      annotationView = [[XYZAMPMarkerView alloc] initWithAnnotation:annotation
                                                    reuseIdentifier:pointReuseIndetifier
                                                     annotationView:m.markerView];
    }
    annotationView.centerOffset = CGPointMake(0, -annotationView.frame.size.height / 2);

    return annotationView;
  }

  return nil;
}

- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id<MAOverlay>)overlay {
  if ([overlay isKindOfClass:[MAPolyline class]]) {
    MAPolylineRenderer *polylineRenderer = [[MAPolylineRenderer alloc] initWithPolyline:overlay];

    polylineRenderer.lineWidth = 8.f;
    polylineRenderer.strokeColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.6];
    polylineRenderer.lineJoinType = kMALineJoinRound;
    polylineRenderer.lineCapType = kMALineCapRound;

    return polylineRenderer;
  }
  return nil;
}

- (MAMapView *)mMapView {
  if (_mMapView == nil) {
    _mMapView = [[MAMapView alloc] init];
    _mMapView.delegate = self;
  }
  return _mMapView;
}

@end
