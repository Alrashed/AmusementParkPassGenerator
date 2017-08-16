//
//  PassScanner.swift
//  AmusementParkPassGenerator
//
//  Created by Khalid Alrashed on 8/16/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import Foundation

enum AccessType {
    case park, kitchen, rideControl, maintenance, office
    case allRides, skipAllLines
    case foodDiscount, merchandiseDiscount
}

class PassScanner {
    
    func swipe(entrant: EntrantType, accessType: AccessType) {
        
        var access = false
        
        switch accessType {
        case .park:
            access = entrant is ParkAccessible
        case .kitchen:
            access = entrant is KitchenAccessible
        case .rideControl:
            access = entrant is RideControlAccessible
        case .maintenance:
            access = entrant is MaintenanceAccessible
        case .office:
            access = entrant is OfficeAccessible
        case .allRides:
            access = entrant is AllRideAccessible
        case .skipAllLines:
            access = entrant is SkipRideLineAccessible
        case .foodDiscount:
            access = entrant is FoodDiscountAccessible
        case .merchandiseDiscount:
            access = entrant is MerchandiseDiscountAccessible
        }
        
        if access {
            print("Access granted to \(accessType)")
        } else {
            print("Access denied to \(accessType)")
        }
    }
}
