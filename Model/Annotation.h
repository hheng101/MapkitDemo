//
//  Annotation.h
//  MapKitDemo
//
//  Created by 戴雨恒 on 16/8/10.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation>

@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end
