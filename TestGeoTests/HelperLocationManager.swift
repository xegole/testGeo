//
//  HelperLocationManager.swift
//  TestGeoTests
//
//  Created by Diego Leon Puerta on 7/14/21.
//

import Foundation
import CoreLocation

class HelperLocationManager:NSObject{
    
    let locationManager:CLLocationManager
    
    init(mgr:CLLocationManager) {
        
        self.locationManager = mgr
        super.init()
        self.locationManager.delegate = self
    }
}

extension HelperLocationManager:CLLocationManagerDelegate{
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        print("authorization calling in real helper class")
        switch status {
            
        case CLAuthorizationStatus.notDetermined:
            
            locationManager.requestWhenInUseAuthorization()
            
        case CLAuthorizationStatus.restricted:
            
            print("Restricted Access to location")
            
        case CLAuthorizationStatus.denied:
            
            print("User denied access to location")
            
        case CLAuthorizationStatus.authorizedWhenInUse:
            
            self.locationManager.startUpdatingLocation()
            
        default:
            
            print("default authorization")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("locations calling in real helper class")
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        print("error ----", error)
        
    }
}
