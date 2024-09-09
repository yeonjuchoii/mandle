//
//  CLLocationCoordinate2D+Extension.swift
//  Mandle
//
//  Created by 정지혁 on 9/9/24.
//

import CoreLocation

extension CLLocationCoordinate2D: Equatable {}

public func ==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
    return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
}
