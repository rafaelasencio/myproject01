//
//  Locations.swift
//  proyecto01
//
//  Created by Rafael Asencio on 10/03/2019.
//  Copyright © 2019 Rafael Asencio. All rights reserved.
//

import Foundation

class User {
    var username: String?
    var email: String?
    var lat: Double?
    var long: Double?
    
    init(name: String, email: String, latitude: Double, longitude: Double) {
        self.username = name
        self.lat = latitude
        self.long = longitude
    }
        
}

