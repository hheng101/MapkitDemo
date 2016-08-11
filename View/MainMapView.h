//
//  MainMapView.h
//  MapKitDemo
//
//  Created by 戴雨恒 on 16/8/11.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "MainMapViewModel.h"
#import "FacilitatorModel.h"

@interface MainMapView : MKMapView

- (void)addAnnotationWithCoordinate:(CLLocationCoordinate2D)coordinate
                              title:(NSString *)title
                           subtitle:(NSString *)subtitle;

- (void)addAnnotationWithFacilitatorModel:(FacilitatorModel *)model;

@end
