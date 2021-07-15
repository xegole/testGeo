//
//  ViewController.swift
//  TestGeo
//
//  Created by Diego Leon Puerta on 7/14/21.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    lazy var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        initGeofences()
    }
    
    func initGeofences() {
        let region = self.regionToMonitor()
        print("startMonitoring")
        locationManager.startMonitoring(for: region)
    }
    
    func regionToMonitor() -> CLCircularRegion {
        let salgarRegion = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 5.463497, longitude: -74.651901), radius: 100, identifier: "Puerto Salgar")
        salgarRegion.notifyOnExit = true
        salgarRegion.notifyOnEntry = true
        return salgarRegion
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("didEnterRegion")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("didExitRegion")
    }
}
