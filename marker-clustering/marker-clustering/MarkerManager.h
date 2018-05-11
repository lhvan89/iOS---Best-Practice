//
//  MarkerManager.h
//  marker-clustering
//
//  Created by Van on 5/11/18.
//  Copyright © 2018 Van. All rights reserved.
//

#ifndef MarkerManager_h
#define MarkerManager_h


#endif /* MarkerManager_h */

#import <Foundation/Foundation.h>
@import CoreLocation;
#import "GMUClusterItem.h"
#import <GoogleMaps/GoogleMaps.h>


@interface MarkerManager: NSObject

@property (nonatomic) CLLocationCoordinate2D location;
@property (nonatomic, strong) GMSMarker *marker;

@end
