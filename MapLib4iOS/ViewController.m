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
@end

@implementation ViewController

static const double kCameraLatitude = 22.532378;
static const double kCameraLongitude = 113.924789;

- (void)viewDidLoad {
  [super viewDidLoad];

  self.title = @"mapDemo";
  self.view.backgroundColor = [UIColor whiteColor];

  [self.view addSubview:self.mMapViewProtocol.mapView];
  [self addMarker];
}

- (void)addMarker {
  UIView *view = [[UIView alloc] init];
  view.backgroundColor = [UIColor redColor];
  view.frame = CGRectMake(0, 0, 40, 40);
  NSDictionary *userData = @{};

  id<XMarkerProtocol> markerProtocol = [self.mMapProtocol markerWithView:view
                                                               LocationX:kCameraLatitude
                                                               LocationY:kCameraLongitude
                                                                UserData:userData];
  [self.mMapViewProtocol addMarker:markerProtocol.marker];
}

- (id<XMapProtocol>)mMapProtocol {
  if (_mMapProtocol == nil) {
    _mMapProtocol = [[XMapLib shareInstance] mapProtocol];
  }
  return _mMapProtocol;
}

- (id<XMapViewProtocol>)mMapViewProtocol {
  if (_mMapViewProtocol == nil) {
    _mMapViewProtocol = [self.mMapProtocol mapViewWithFrame:self.view.bounds
                                                  LocationX:kCameraLatitude
                                                  LocationY:kCameraLongitude
                                                  ZoomLevel:15.0f];
  }
  return _mMapViewProtocol;
}

@end
