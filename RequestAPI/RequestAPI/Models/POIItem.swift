//
//  POIItem.swift
//  HushCity
//
//  Created by Van Le on 5/14/18.
//  Copyright © 2018 Edge Works Software. All rights reserved.
//

import Foundation

class POIItem: NSObject, GMUClusterItem {
    var position: CLLocationCoordinate2D
    @objc var marker: GMSMarker!
    
    
    init(position: CLLocationCoordinate2D, marker: GMSMarker) {
        self.position = position
        self.marker = marker
    }
}
