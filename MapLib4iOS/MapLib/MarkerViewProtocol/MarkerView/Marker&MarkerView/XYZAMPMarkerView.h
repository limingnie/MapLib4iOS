//
//  XYZAMPMarkerView.h
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/29.
//  Copyright © 2019 xyz. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYZAMPMarkerView : MAPinAnnotationView

- (id)initWithAnnotation:(id<MAAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier annotationView:(UIView *)annotationView;

@end

NS_ASSUME_NONNULL_END
