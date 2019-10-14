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
        let addr = "부산 광역시 양정동 429-29 "
       let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(addr){Placemark, error in
            
            if error != nil {
                print(error!)
            }
            if let myPlacemark = Placemark {
                let myPlacemark = myPlacemark.first
                print(myPlacemark?.country)
                print(myPlacemark!.location?.coordinate.latitude)
                
                let pin = MKPointAnnotation()
                pin.coordinate = (myPlacemark?.location!.coordinate)!
                pin.title = "hd"
                pin.subtitle = "dd"
                pins.append(pin)
                self.mapView.showAnnotations(pins, animated: true)
                
            } else {
                print("nil qkftod")
            }
        }
    }

}

