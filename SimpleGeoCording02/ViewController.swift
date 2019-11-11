//
//  ViewController.swift
//  SimpleGeoCording02
//
//  Created by D7703_22 on 2019. 10. 14..
//  Copyright © 2019년 ParkSunjae. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var locationManger = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        //CLLocationMangerDelegete ViewController
        locationManger.delegate = self
        
        // 위치 트래킹 시작
        locationManger.startUpdatingHeading()
        locationManger.requestAlwaysAuthorization()
        
        //현재 위치 표시
        mapView.showsUserLocation = true

        //Pin 꼽기
        let anno01 = MKPointAnnotation()
        anno01.coordinate.latitude = 35.166197
        anno01.coordinate.longitude = 129.072594
        anno01.title = "DIT 동의과학대학교"
        anno01.subtitle = "나의 꿈이 자라는 곳"
        mapView.addAnnotation(anno01)
       
        let anno02 = MKPointAnnotation()
        anno02.coordinate.latitude = 35.168444
        anno02.coordinate.longitude = 129.057832
        anno02.title = "부산시민공원"
        anno02.subtitle = "부산시민들의 휴식처"
        mapView.addAnnotation(anno02)
        
        let anno03 = MKPointAnnotation()
        anno03.coordinate.latitude = 35.164238
        anno03.coordinate.longitude = 129.064925
        anno03.title = "부산 송상현 광장"
        anno03.subtitle = "송상현 광장"
        mapView.addAnnotation(anno03)
        //CLLocationMangerDelegete
    }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
           
            let userLocation = locations[0]
            let cLat = userLocation.coordinate.latitude
            let cLong = userLocation.coordinate.longitude
            
            let center = CLLocationCoordinate2D(latitude: cLat, longitude: cLong)
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: center, span: span)
            mapView.setRegion(region, animated: true)
        }
    
}
        
        
  /*      geocoder.geocodeAddressString(addr){Placemark, error in
            
            if error != nil {
                print(error!)
            }
            if let myPlacemark = Placemark {
                let myPlacemark = myPlacemark.first
                print(myPlacemark?.country)
                print(myPlacemark!.location?.coordinate.latitude)
                
                let pin = MKPointAnnotation()
                pin.coordinate = (myPlacemark?.location!.coordinate)!
                pin.title = "동의과학대학교"
                pin.subtitle = "숨이 쉬어지는곳"
                pins.append(pin)
                self.mapView.showAnnotations(pins, animated: true)
                
            } else {
                print("nil qkftod")
            }
        }
 */



