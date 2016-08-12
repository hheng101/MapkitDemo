//
//  MainMapView.m
//  MapKitDemo
//
//  Created by 戴雨恒 on 16/8/11.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import "MainMapView.h"
#import "Annotation.h"
#import "CalloutAnnotationView.h"

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

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    
    if ([annotation isKindOfClass:[Annotation class]]) {
        static NSString *key1=@"annotation";
        MKAnnotationView *annotationView=[self dequeueReusableAnnotationViewWithIdentifier:key1];
        if (!annotationView) {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:key1];
            //annotationView.calloutOffset = CGPointMake(0, 50);
        }
        annotationView.annotation = annotation;
        annotationView.image = ((Annotation *)annotation).image;
        return annotationView;
    }
    else if ([annotation isKindOfClass:[CalloutAnnotation class]]) {
        //static NSString *key2=@"CalloutAnnotationView";
        
        CalloutAnnotationView *calloutView = [CalloutAnnotationView calloutAnnotationViewWithMapView:self];
        //CalloutAnnotationView *calloutView = [CalloutAnnotationView calloutAnnotationView];
        calloutView.annotation = annotation;
        return calloutView;
        //return nil;
    }
    else return nil;
}

///选中大头针时触发
- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    
    Annotation *annotation = view.annotation;
    
    if ([view.annotation isKindOfClass:[Annotation class]]) {
        //添加详情大头针
        CalloutAnnotation *calloutAnnotation = [[CalloutAnnotation alloc] init];
        calloutAnnotation.detail = annotation.detail;
        calloutAnnotation.price = annotation.price;
        calloutAnnotation.sellNumber = annotation.sellNumber;
        calloutAnnotation.name = annotation.name;
        calloutAnnotation.coordinate = view.annotation.coordinate;
        //calloutAnnotation.coordinate.latitude += 50; nnotation.coordinate
        [self addAnnotation:calloutAnnotation];
    }
}


///取消选中大头针时触发
- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    
    [self removeCustomAnnotations];
}

- (void)removeCustomAnnotations {
    
    [self.annotations enumerateObjectsUsingBlock:^(id<MKAnnotation>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[CalloutAnnotation class]]) {
            [self removeAnnotation:obj];
        }
    }];
}


- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    NSLog(@"%@", userLocation);
    
}


- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    
    CLLocationCoordinate2D centerCoordinate = mapView.region.center;
    [self.mapModel loadNearbyFacilitators];
    NSLog(@" regionDidChangeAnimated %f,%f",centerCoordinate.latitude, centerCoordinate.longitude);
}




- (void)addAnnotationWithCoordinate:(CLLocationCoordinate2D)coordinate
                              title:(NSString *)title
                           subtitle:(NSString *)subtitle
                             detail:(NSString *)detail
                              price:(NSString *)price
                         sellNumber:(NSString *)sellNumber
                               name:(NSString *)name
                              image:(UIImage *)image{
    
    Annotation *annotation = [[Annotation alloc] init];
    annotation.title = title;
    annotation.subtitle = subtitle;
    annotation.coordinate = coordinate;
    annotation.detail= detail;
    annotation.price = price;
    annotation.sellNumber = sellNumber;
    annotation.name = name;
    annotation.image = image;
    
    [self addAnnotation:annotation];
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
