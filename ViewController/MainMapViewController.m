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


#pragma mark - 地图代理

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    
    NSLog(@"%@", userLocation);
}


@end
