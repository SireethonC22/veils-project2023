//
//  BeaconDetector.swift
//  snp65-project
//
//
//

import Combine
import CoreLocation
import Foundation

class BeaconDetector: NSObject, ObservableObject,
    CLLocationManagerDelegate {
    var didChange = PassthroughSubject<Void, Never>()
    var locationManager: CLLocationManager?
    var beaconID = UUID().self
    var beaconFound = false

    @Published var lastDistance = CLProximity.unknown

    override init() {
        super.init()

        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()

    }

    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
        }
    }

    
    func startScanning() {
        let uuid = UUID(uuidString: "00000000-0000-0000-0000-000000000000")!
        let constraint = CLBeaconIdentityConstraint(uuid: uuid, major: 10011, minor: 11011)
        let beconRegion = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: "MyBeacon")


        locationManager?.startMonitoring(for: beconRegion)
        locationManager?.startRangingBeacons(satisfying: constraint)
    }

    
    class func getBeaconID() -> String {
        let uuid = "00000000-0000-0000-0000-000000000000"
        return uuid
    }

    
    
    func locationManager(_ manager: CLLocationManager, didRange beacons:
        [CLBeacon], satisfying beaconConstraint: CLBeaconIdentityConstraint) {
        if let beacon = beacons.first {
            update(distance: beacon.proximity)
            print("beacon")

        } else {
            update(distance: .unknown)
            print("unknown")
        }
    }

    
    
    func update(distance: CLProximity) {
        lastDistance = distance
        didChange.send(())
    }
}
