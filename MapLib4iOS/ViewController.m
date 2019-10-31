//
//  ViewController.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/28.
//  Copyright © 2019 xyz. All rights reserved.
//

#import "ViewController.h"
#import "XMapLib.h"

@interface ViewController ()
@property(nonatomic, strong) id<XMapProtocol> mMapProtocol;
@property(nonatomic, strong) id<XMapViewProtocol> mMapViewProtocol;
@property(nonatomic, strong) id<XPanoramaViewProtocol> mPanoramaViewProtocol;

@end

@implementation ViewController

static const double kCameraLatitude = 22.532378;
static const double kCameraLongitude = 113.924789;

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"mapDemo";
  self.view.backgroundColor = [UIColor whiteColor];

  //  [self.view addSubview:self.mMapViewProtocol.mapView];
  //  [self addMarker];
  //  [self addOverlay];

  [self.view addSubview:self.mPanoramaViewProtocol.panoramaView];
  [self.mPanoramaViewProtocol
      moveNearCoordinate:CLLocationCoordinate2DMake(kCameraLatitude, kCameraLongitude)];
}

- (void)addMarker {
  UIView *view = [[UIView alloc] init];
  view.backgroundColor = [UIColor redColor];
  view.frame = CGRectMake(0, 0, 40, 40);
  NSDictionary *userData = @{};

  id<XMarkerProtocol> markerProtocol = [self.mMapProtocol
      markerWithView:view
          Coordinate:CLLocationCoordinate2DMake(kCameraLatitude, kCameraLongitude)
            UserData:userData];
  [self.mMapViewProtocol addMarker:markerProtocol.marker];
}

- (void)addOverlay {
  CLLocationCoordinate2D coords[5] = {0};
  coords[0] = CLLocationCoordinate2DMake(39.968, 116.260);
  coords[1] = CLLocationCoordinate2DMake(39.912, 116.324);
  coords[2] = CLLocationCoordinate2DMake(39.968, 116.373);
  coords[3] = CLLocationCoordinate2DMake(39.912, 116.439);
  coords[4] = CLLocationCoordinate2DMake(39.968, 116.490);

  id<XPolylineProtocol> polylineProtocol =
      [self.mMapProtocol polylineWithCoordinates:coords
                                           Count:5
                                     StrokeColor:[UIColor blueColor]
                                     StrokeWidth:3.0f];
  [self.mMapViewProtocol addOverlay:polylineProtocol.polyline];
}

- (id<XMapProtocol>)mMapProtocol {
  if (_mMapProtocol == nil) {
    _mMapProtocol = [[XMapLib shareInstance] mapProtocol];
  }
  return _mMapProtocol;
}

- (id<XMapViewProtocol>)mMapViewProtocol {
  if (_mMapViewProtocol == nil) {
    _mMapViewProtocol = [self.mMapProtocol
        mapViewWithFrame:self.view.bounds
              Coordinate:CLLocationCoordinate2DMake(kCameraLatitude, kCameraLongitude)
               ZoomLevel:15.0f];
  }
  return _mMapViewProtocol;
}

- (id<XPanoramaViewProtocol>)mPanoramaViewProtocol {
  if (_mPanoramaViewProtocol == nil) {
    _mPanoramaViewProtocol = [self.mMapProtocol panoramaViewWithFrame:self.view.bounds
                                                                  Key:BMKMapKey];
  }
  return _mPanoramaViewProtocol;
}

@end
