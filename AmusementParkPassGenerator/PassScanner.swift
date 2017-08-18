//
//  PassScanner.swift
//  AmusementParkPassGenerator
//
//  Created by Khalid Alrashed on 8/16/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import Foundation

enum AccessType: String {
    case park, kitchen, rideControl, maintenance, office
    case allRides, skipAllLines
    case foodDiscount, merchandiseDiscount
    
    var accessDescription: String {
        switch self {
        case .park: return "Amusement Park"
        case .kitchen: return "Kitchen"
        case .rideControl: return "Ride Control"
        case .maintenance: return "Maintenance"
        case .office: return "Office"
        case .allRides: return "All Rides"
        case .skipAllLines: return "Skip Ride Lines"
        case .foodDiscount: return "Food Discounts"
        case .merchandiseDiscount: return "Merchandise Discounts"
        }
    }
}

class PassScanner {
    
    func swipe(entrant: EntrantType, accessType: AccessType) -> Bool {
        
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
        
        return access
    }
}
