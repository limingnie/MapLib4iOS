//
//  XYZAMPMarkerView.m
//  MapLib4iOS
//
//  Created by yinqiante on 2019/10/29.
//  Copyright © 2019 xyz. All rights reserved.
//

#import "XYZAMPMarkerView.h"

@implementation XYZAMPMarkerView

- (id)initWithAnnotation:(id<MAAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier annotationView:(UIView *)annotationView {
	self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
	if (self) {
		self.frame = CGRectMake(0, 0, annotationView.frame.size.width, annotationView.frame.size.height);
		[self addSubview:annotationView];
		self.canShowCallout = NO;
	}
	return self;
}

@end
