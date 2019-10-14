//
//  ViewController.swift
//  SimpleGeoCording02
//
//  Created by D7703_22 on 2019. 10. 14..
//  Copyright © 2019년 ParkSunjae. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var pins = [MKPointAnnotation]()
        let lat = 35.16587040
        let lng = 129.07284610
        let loc = CLLocation(latitude: lat, longitude: lng)
        
        
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(loc) { CLPlacemark, error in
            if error != nil {
                print(error!)
            }
            if let myPlacemark = CLPlacemark {
                let myPlacemark = myPlacemark.first
                print(myPlacemark?.country)
                print(myPlacemark?.administrativeArea)
                print(myPlacemark?.name)
                print(myPlacemark?.areasOfInterest)
                
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
    }



