//
//  MainMapViewController.m
//  MapKitDemo
//
//  Created by 戴雨恒 on 16/8/10.
//  Copyright © 2016年 Darren. All rights reserved.
//

#import "MainMapViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "Annotation.h"

@interface MainMapViewController () <MKMapViewDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) MKMapView *mapView;

@end

@implementation MainMapViewController


#pragma mark - 生命周期

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self initViewController];
    [self addAnnotaions];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - 初始化

- (void)initViewController {
    
    self.title = @"假装是个搜索栏";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self requestLocation];
    
    self.mapView = [[MKMapView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.mapView.delegate = self;
    
    self.mapView.userTrackingMode = MKUserTrackingModeFollow;
    self.mapView.mapType = MKMapTypeStandard;
    
    [self.view addSubview:self.mapView];
}


- (void)requestLocation {
    
    self.locationManager = [[CLLocationManager alloc] init];
    if (![CLLocationManager locationServicesEnabled] || [CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManager requestWhenInUseAuthorization];
        
        if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse) {
            NSLog(@"请求成功");
        }
        else {
            NSLog(@"请求失败");
        }
    }
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
}


#pragma mark - 实例方法

///添加大头针
- (void)addAnnotaions {
    
    CLLocationCoordinate2D location1 = CLLocationCoordinate2DMake(39, 117);
    Annotation *annotation1 = [[Annotation alloc] init];
    annotation1.title = @"老司机培训基地";
    annotation1.subtitle = @"老司机培训基地";
    annotation1.coordinate = location1;
    [self.mapView addAnnotation:annotation1];
    
    CLLocationCoordinate2D location2 = CLLocationCoordinate2DMake(39.1, 117.1);
    Annotation *annotation2 = [[Annotation alloc] init];
    annotation2.title = @"老司机培训基地";
    annotation2.subtitle = @"老司机培训基地";
    annotation2.coordinate = location2;
    [self.mapView addAnnotation:annotation2];
}


#pragma mark - 地图代理

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    NSLog(@"%@", userLocation);
}


@end
