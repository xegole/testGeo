//
//  MockLocationManager.swift
//  TestGeoTests
//
//  Created by Diego Leon Puerta on 7/14/21.
//

import CoreLocation

class MockLocationManager : CLLocationManager {
    var mockLocation: CLLocation?
    override var location: CLLocation? {
        return mockLocation
    }
    override init() {
        super.init()
    }
}
