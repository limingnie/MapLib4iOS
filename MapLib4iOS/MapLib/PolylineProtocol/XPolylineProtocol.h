//
//  XPolylineProtocol.h
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/29.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XPolylineProtocol <NSObject>

- (instancetype)initPolylineWithCoordinates:(CLLocationCoordinate2D *)coords
                                      Count:(NSUInteger)count
								StrokeColor:(UIColor *)strokeColor
								StrokeWidth:(CGFloat)strokeWidth;
- (id)polyline;

@end

NS_ASSUME_NONNULL_END
