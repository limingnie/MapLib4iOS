//
//  XYZBMKMarkerView.h
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/28.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <BaiduMapAPI_Map/BMKAnnotationView.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYZBMKMarkerView : BMKAnnotationView

- (id)initWithAnnotation:(id<BMKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier annotationView:(UIView *)annotationView;

@end

NS_ASSUME_NONNULL_END
