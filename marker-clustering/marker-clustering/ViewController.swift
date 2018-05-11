//
//  ViewController.swift
//  marker-clustering
//
//  Created by Van on 5/11/18.
//  Copyright © 2018 Van. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, GMUClusterManagerDelegate, GMSMapViewDelegate {
    
    let lat = 10.8029594
    let long = 106.72102180000002
    
    private var mapView: GMSMapView!
    private var clusterManager: GMUClusterManager!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        marker.title = "BCONS TOWER"
        marker.snippet = "Đường D1, Phường 25, Bình Thạnh, Ho Chi Minh City, Vietnam"
        marker.map = mapView
        
        
        // Set up the cluster manager with the supplied icon generator and
        // renderer.
        let iconGenerator = GMUDefaultClusterIconGenerator()
        let algorithm = GMUNonHierarchicalDistanceBasedAlgorithm()
        let renderer = GMUDefaultClusterRenderer(mapView: mapView, clusterIconGenerator: iconGenerator)
        clusterManager = GMUClusterManager(map: mapView, algorithm: algorithm, renderer: renderer)
        
        // Generate and add random items to the cluster manager.
        generateClusterItems()
        
        // Call cluster() after items have been added to perform the clustering
        // and rendering on map.
        clusterManager.cluster()
        
        
        // Register self to listen to both GMUClusterManagerDelegate and
        // GMSMapViewDelegate events.
        clusterManager.setDelegate(self, mapDelegate: self)
    }
    
    /// Randomly generates cluster items within some extent of the camera and
    /// adds them to the cluster manager.
    private func generateClusterItems() {
        let extent = 0.2
        let kClusterItemCount = 5000
//        for index in 1...kClusterItemCount {
//            let lat = self.lat + extent * randomScale()
//            let lng = self.long + extent * randomScale()
//            let name = "Item \(index)"
//            let item =
//                POIItem(position: CLLocationCoordinate2DMake(lat, lng), name: name)
//            clusterManager.add(item)
//
//        }
        
        for index in 1...kClusterItemCount {
            
            let lat = self.lat + extent * randomScale()
            let lng = self.long + extent * randomScale()
            
            let position = CLLocationCoordinate2DMake(lat, lng)
            let marker = GMSMarker(position: position)
            
            marker.icon = UIImage(named: "marker1")
            let item = POIItem(position: position, marker: marker)
            self.clusterManager.add(item)
        }
    }
    
    /// Returns a random value between -1.0 and 1.0.
    private func randomScale() -> Double {
        return Double(arc4random()) / Double(UINT32_MAX) * 2.0 - 1.0
    }
    
    // MARK: - GMUClusterManagerDelegate
    
    func clusterManager(clusterManager: GMUClusterManager, didTapCluster cluster: GMUCluster) {
        let newCamera = GMSCameraPosition.camera(withTarget: cluster.position,
                                                           zoom: mapView.camera.zoom + 1)
        let update = GMSCameraUpdate.setCamera(newCamera)
        mapView.moveCamera(update)
    }
    
    // MARK: - GMUMapViewDelegate
    
    func mapView(mapView: GMSMapView, didTapMarker marker: GMSMarker) -> Bool {
        if let poiItem = marker.userData as? POIItem {
            NSLog("Did tap marker for cluster item \(poiItem.marker)")
        } else {
            NSLog("Did tap a normal marker")
        }
        return false
    }
}

