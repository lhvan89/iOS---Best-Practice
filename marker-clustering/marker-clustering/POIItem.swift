//
//  POIItem.swift
//  marker-clustering
//
//  Created by Van on 5/11/18.
//  Copyright © 2018 Van. All rights reserved.
//

import Foundation

/// Point of Interest Item which implements the GMUClusterItem protocol.

//class POIItem: NSObject, GMUClusterItem {
//    var position: CLLocationCoordinate2D
//    var name: String!
//
//    init(position: CLLocationCoordinate2D, name: String) {
//        self.position = position
//        self.name = name
//    }
//}

class POIItem: NSObject, GMUClusterItem {
    var position: CLLocationCoordinate2D
    @objc var marker: GMSMarker!
    
    
    init(position: CLLocationCoordinate2D, marker: GMSMarker) {
        self.position = position
        self.marker = marker
    }
}
