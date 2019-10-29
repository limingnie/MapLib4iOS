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
  if ([overlay isKindOfClass:[BMKPolyline class]]) {
    BMKPolylineView *polylineView = [[BMKPolylineView alloc] initWithPolyline:overlay];
    //设置polylineView的画笔颜色为蓝色
    polylineView.strokeColor = [[UIColor alloc] initWithRed:19 / 255.0
                                                      green:107 / 255.0
                                                       blue:251 / 255.0
                                                      alpha:1.0];
    //设置polylineView的画笔宽度为16
    polylineView.lineWidth = 3;
    //圆点虚线，V5.0.0新增
    //        polylineView.lineDashType = kBMKLineDashTypeDot;
    //方块虚线，V5.0.0新增
    //       polylineView.lineDashType = kBMKLineDashTypeSquare;
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
