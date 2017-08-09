//
//  ViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Khalid Alrashed on 8/7/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            // Test 1
//            let employee1Name = try FullName(firstName: "", lastName: "")
//            let employee1Address = try FullAddress(streetAddress: "123", city: "SF", state: "CA", zipCode: 1234)
//            let employee1 = Manager(fullName: employee1Name, fullAddress: employee1Address)
//            swipe(entrant: employee1, accessType: .maintenance)
            
            // Test 2
//            let employee2Name = try FullName(firstName: "", lastName: "")
//            let employee2Address = try FullAddress(streetAddress: "123", city: "SF", state: "CA", zipCode: 1234)
//            let employee2 = FoodServicesEmployee(fullName: employee2Name, fullAddress: employee2Address)
//            swipe(entrant: employee2, accessType: .office)
            
            // Test 3
//            let freeChildGuest1 = try FreeChildGuest(month: 4, day: 9, year: 2005)
//            swipe(entrant: freeChildGuest1, accessType: .park)
            
            // Test 4
//            let freeChildGuest2 = try FreeChildGuest(month: 4, day: 9, year: 2016)
//            swipe(entrant: freeChildGuest2, accessType: .park)
            
        } catch {
            print("Error: \(error)")
        }
        
        // Test 5
//        let classicGuest1 = ClassicGuest()
//        swipe(entrant: classicGuest1, accessType: .foodDiscount)
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

