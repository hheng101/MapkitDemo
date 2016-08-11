//
//  MainMapView.m
//  MapKitDemo
//
//  Created by 戴雨恒 on 16/8/11.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import "MainMapView.h"
#import "Annotation.h"

@interface MainMapView () <MKMapViewDelegate>

@property (nonatomic, strong) MainMapViewModel *mapModel;

@end

@implementation MainMapView

- (instancetype)init {
    
    if (self) {
        self = [super init];
        self.delegate = self;
    }
    
    return self;
}


#pragma mark - MKMapView Delegate

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    NSLog(@"%@", userLocation);
    
}


- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    
    CLLocationCoordinate2D centerCoordinate = mapView.region.center;
    //可以用这个方法实现中心点的大头针效果
    NSLog(@" regionDidChangeAnimated %f,%f",centerCoordinate.latitude, centerCoordinate.longitude);
}


- (void)addAnnotationWithCoordinate:(CLLocationCoordinate2D)coordinate
                              title:(NSString *)title
                           subtitle:(NSString *)subtitle {
    Annotation *annotation = [[Annotation alloc] init];
    annotation.title = title;
    annotation.subtitle = subtitle;
    annotation.coordinate = coordinate;
    
    [self addAnnotation:annotation];
}


- (void)addAnnotationWithFacilitatorModel:(FacilitatorModel *)model {
    
    
    NSLog(@"添加成功");
}


- (MainMapViewModel *)mapModel {
    
    if (!_mapModel) {
        _mapModel = [MainMapViewModel model];
    }
    return _mapModel;
}

@end
