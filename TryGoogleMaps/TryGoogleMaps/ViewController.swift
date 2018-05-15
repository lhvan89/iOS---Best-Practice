//
//  ViewController.swift
//  TryGoogleMaps
//
//  Created by Van on 5/15/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    
    let lat = 10.8029594
    let long = 106.72102180000002

    override func viewDidLoad() {
        super.viewDidLoad()
        initMap()
    }
    func initMap(){
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
}

