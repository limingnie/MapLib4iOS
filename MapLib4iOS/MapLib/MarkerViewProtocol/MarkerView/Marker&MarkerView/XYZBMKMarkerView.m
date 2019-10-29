//
//  XYZBMKMarkerView.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/28.
//  Copyright © 2019 xyz. All rights reserved.
//

#import "XYZBMKMarkerView.h"

@implementation XYZBMKMarkerView

- (id)initWithAnnotation:(id<BMKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier annotationView:(UIView *)annotationView {
	self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
	if (self) {
		self.frame = CGRectMake(0, 0, annotationView.frame.size.width, annotationView.frame.size.height);
		[self addSubview:annotationView];
		self.canShowCallout = NO;
	}
	return self;
}

@end
