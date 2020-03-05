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

  [self.view addSubview:self.mMapViewProtocol.mapView];
//    [self addMarker];
  [self addMarkerClusters];
  //  [self addOverlay];

//  /* 添加街景 */
//  [self.view addSubview:self.mPanoramaViewProtocol.panoramaView];
//  [self.mPanoramaViewProtocol
//      moveNearCoordinate:CLLocationCoordinate2DMake(kCameraLatitude, kCameraLongitude)];


}

/**
 *添加标注
 */
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

/**
 *添加标注并开启点聚合
 */
- (void)addMarkerClusters {
  UIView *view1 = [[UIView alloc] init];
  view1.backgroundColor = [UIColor redColor];
  view1.frame = CGRectMake(0, 0, 40, 40);
  NSDictionary *userData1 = @{};

  UIView *view2 = [[UIView alloc] init];
  view2.backgroundColor = [UIColor blueColor];
  view2.frame = CGRectMake(0, 0, 40, 40);
  NSDictionary *userData2 = @{};

  UIView *view3 = [[UIView alloc] init];
  view3.backgroundColor = [UIColor greenColor];
  view3.frame = CGRectMake(0, 0, 40, 40);
  NSDictionary *userData3 = @{};

  UIView *view4 = [[UIView alloc] init];
  view4.backgroundColor = [UIColor grayColor];
  view4.frame = CGRectMake(0, 0, 40, 40);
  NSDictionary *userData4 = @{};

  UIView *view5 = [[UIView alloc] init];
  view5.backgroundColor = [UIColor orangeColor];
  view5.frame = CGRectMake(0, 0, 40, 40);
  NSDictionary *userData5 = @{};

  NSArray *lat = @[ @"34.270", @"30.524", @"28.497", @"22.917", @"39.968" ];
  NSArray *lng = @[ @"109.028", @"104.106", @"116.015", @"113.510", @"116.490" ];

  NSArray *views = @[ view1, view2, view3, view4, view5 ];
  NSArray *dicts = @[ userData1, userData2, userData3, userData4, userData5 ];

  NSMutableArray *temp = [[NSMutableArray alloc] initWithCapacity:5];
  for (int i = 0; i < 5; i++) {
    id<XMarkerProtocol> markerProtocol = [self.mMapProtocol
        markerWithView:views[i]
            Coordinate:CLLocationCoordinate2DMake([lat[i] doubleValue], [lng[i] doubleValue])
              UserData:dicts[i]];
    [temp addObject:markerProtocol.marker];
  }
  [self.mMapViewProtocol addMarkers:[temp copy]];
}

/**
 *添加覆盖物
 */
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

/**
 *mapProtocol
 */
- (id<XMapProtocol>)mMapProtocol {
  if (_mMapProtocol == nil) {
    _mMapProtocol = [[XMapLib shareInstance] mapProtocol];
  }
  return _mMapProtocol;
}

/**
 *mapViewProtocol
 */
- (id<XMapViewProtocol>)mMapViewProtocol {
  if (_mMapViewProtocol == nil) {
    _mMapViewProtocol = [self.mMapProtocol
        mapViewWithFrame:self.view.bounds
              Coordinate:CLLocationCoordinate2DMake(kCameraLatitude, kCameraLongitude)
               ZoomLevel:15.0f];
  }
  return _mMapViewProtocol;
}

/**
 *panoramaViewProtocol
 */
- (id<XPanoramaViewProtocol>)mPanoramaViewProtocol {
  if (_mPanoramaViewProtocol == nil) {
    _mPanoramaViewProtocol = [self.mMapProtocol panoramaViewWithFrame:self.view.bounds
                                                                  Key:[[XMapLib shareInstance] mapKey]];
  }
  return _mPanoramaViewProtocol;
}

@end
