//
//  TestGeoTests.swift
//  TestGeoTests
//
//  Created by Diego Leon Puerta on 7/14/21.
//

import XCTest
import CoreLocation
@testable import TestGeo

class TestGeoTests: XCTestCase {
    
    var locationHelper:HelperLocationManager!
    var locationMgr:CLLocationManager!
    
    override func setUp() {
        super.setUp()
        locationMgr = CLLocationManager()
        locationHelper = HelperLocationManager(mgr: locationMgr)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLocationManagerIsSet(){
        
        XCTAssertNotNil(locationHelper.locationManager)
    }
    
    func testLocationManagerDelegateIsSet(){
        
        XCTAssertNotNil(locationHelper.locationManager.delegate)
        XCTAssert((locationHelper.locationManager.delegate!.isKind(of: HelperLocationManager.self)))
    }
    
    func testDidUpdateLocationCallsOnAuthorizationStatusAllowed(){
        
        class FakeLocationManager:CLLocationManager{
            
        }
        let fakeLocationManager = FakeLocationManager()
        locationHelper = HelperLocationManager(mgr: fakeLocationManager)
        locationHelper.locationManager.delegate!.locationManager!(fakeLocationManager, didChangeAuthorization: .authorizedWhenInUse)
    }
    
    func testPopUpMessageShownWhenStatusDeniend(){
        
        class FakeLocationManager:CLLocationManager{
            
        }
        let fakeLocationManager = FakeLocationManager()
        locationHelper = HelperLocationManager(mgr: fakeLocationManager)
        locationHelper.locationManager.delegate!.locationManager!(fakeLocationManager, didChangeAuthorization: .denied)
    }
    
    func testWhwnLocationIsSetToNepal(){
        
        class FakeLocationManager:CLLocationManager{
            
        }
        
        class FakeLocationManagerDelegate:NSObject, CLLocationManagerDelegate{
            
            func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
                
                let loc = locations.first!
                print("mock location is \(loc.coordinate.latitude), \(loc.coordinate.longitude)")
            }
        }
        
        let fakeDelegate = FakeLocationManagerDelegate()
        let fakeLocationManager = FakeLocationManager()
        locationHelper = HelperLocationManager(mgr: fakeLocationManager)
        locationHelper.locationManager.delegate = fakeDelegate
        ((locationHelper.locationManager.delegate) as! FakeLocationManagerDelegate).locationManager(locationHelper.locationManager, didUpdateLocations:  [CLLocation(latitude:21.2,longitude:23.22)])
    }
    
}
