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

/* 点聚合管理类 */
#import "BMKClusterManager.h"
#import "ClusterAnnotation.h"

@interface XBMKMapView () <BMKMapViewDelegate>
@property(nonatomic, strong) BMKMapView *mMapView;
@property(nonatomic, strong) BMKClusterManager *mClusterManager;
@property(nonatomic, assign) NSUInteger clusterZoom;
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

- (void)addMarkers:(NSArray *)markers {
  [self.mMapView addAnnotations:markers];
}

- (void)addOverlay:(nonnull id)polyline {
  [self.mMapView addOverlay:(id<BMKOverlay>)polyline];
}

#pragma mark - BMKMapViewDelegate

/**
 *根据anntation生成对应的View
 */
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

	if ([annotation isKindOfClass:[ClusterAnnotation class]]) {
		ClusterAnnotation *cluster = (ClusterAnnotation *)annotation;
		BMKPinAnnotationView *annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"com.Baidu.BMKClusterAnnotation"];
			UILabel *annotationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 22, 22)];
			annotationLabel.textColor = [UIColor whiteColor];
			annotationLabel.font = [UIFont systemFontOfSize:11];
			annotationLabel.textAlignment = NSTextAlignmentCenter;
			annotationLabel.hidden = NO;
			annotationLabel.text = [NSString stringWithFormat:@"%ld", (long)cluster.size];
			annotationLabel.backgroundColor = [UIColor greenColor];
			annotationView.alpha = 0.8;
			[annotationView addSubview:annotationLabel];

			if (cluster.size == 1) {
				annotationLabel.hidden = YES;
				annotationView.pinColor = BMKPinAnnotationColorRed;
			}
			if (cluster.size > 20) {
				annotationLabel.backgroundColor = [UIColor redColor];
			} else if (cluster.size > 10) {
				annotationLabel.backgroundColor = [UIColor purpleColor];
			} else if (cluster.size > 5) {
				annotationLabel.backgroundColor = [UIColor blueColor];
			} else {
				annotationLabel.backgroundColor = [UIColor greenColor];
			}
			[annotationView setBounds:CGRectMake(0, 0, 22, 22)];
			annotationView.draggable = YES;
			annotationView.annotation = annotation;
			return annotationView;
	}


  return nil;
}

/**
 *根据overlay生成对应的View
 */
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

/**
 *地图加载完成时会调用此方法
 */
- (void)mapViewDidFinishLoading:(BMKMapView *)mapView {
    [self updateClusters];
}

/**
 *地图渲染每一帧画面过程中，以及每次需要重新绘制地图时(例如添加覆盖物)都会调用此方法
 */
- (void)mapView:(BMKMapView *)mapView onDrawMapFrame:(BMKMapStatus *)status {
    if (_clusterZoom != 0 && _clusterZoom != (NSInteger)mapView.zoomLevel) {
        [self updateClusters];
    }
}

#pragma mark - view

- (BMKMapView *)mMapView {
  if (_mMapView == nil) {
    _mMapView = [[BMKMapView alloc] init];
    _mMapView.delegate = self;
  }
  return _mMapView;
}

- (BMKClusterManager *)mClusterManager {
	if (_mClusterManager == nil) {
		_mClusterManager = [[BMKClusterManager alloc] init];
	}
	return _mClusterManager;
}

#pragma mark - clusters
- (void)updateClusters {
	_clusterZoom = (NSInteger)self.mMapView.zoomLevel;
	@synchronized (self.mClusterManager.clusterCaches) {
		NSMutableArray *clusters = [self.mClusterManager.clusterCaches objectAtIndex:(_clusterZoom - 3)];
		if (clusters.count > 0) {
			[self.mMapView removeAnnotations:self.mMapView.annotations];
			[self.mMapView addAnnotations:clusters];
		} else {
			dispatch_async(dispatch_get_global_queue(0, 0), ^{
				__block NSArray *array = [self.mClusterManager getClusters:self->_clusterZoom];
				dispatch_async(dispatch_get_main_queue(), ^{
					for (BMKCluster *item in array) {
						ClusterAnnotation *annotation = [[ClusterAnnotation alloc] init];
						annotation.coordinate = item.coordinate;
						annotation.size = item.size;
						annotation.title = [NSString stringWithFormat:@"我是%lu个", (unsigned long)item.size];
						[clusters addObject:annotation];
					}
					[self.mMapView removeAnnotations:self.mMapView.annotations];
					[self.mMapView addAnnotations:clusters];
				});
			});
		}
	}
}

@end
