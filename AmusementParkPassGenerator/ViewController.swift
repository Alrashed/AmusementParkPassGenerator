//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Khalid Alrashed on 8/7/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let hourlyEmployee = Manager(firstName: "Khalid", lastName: "Alrashed", streetAddress: "123", city: "SF", state: "CA", zipCode: 123)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipe(entrant: hourlyEmployee, accessType: .maintenance)
    }
    
    func swipe(entrant: Entrant, accessType: AccessType) {
        
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

