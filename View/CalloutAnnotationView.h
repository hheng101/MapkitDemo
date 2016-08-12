//
//  CalloutAnnotationView.h
//  MapKitDemo
//
//  Created by 戴雨恒 on 16/8/12.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "CalloutAnnotation.h"

@interface CalloutAnnotationView : MKAnnotationView


@property (nonatomic, strong) CalloutAnnotation *annotation;

+ (instancetype) calloutAnnotationView;

+ (instancetype) calloutAnnotationViewWithMapView:(MKMapView *)mapView;


@end
