//
//  EntrantModel.swift
//  AmusementParkPassGenerator
//
//  Created by Khalid Alrashed on 8/8/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import Foundation

// MARK: - Access Protocols

// Area Access
protocol AreaAccessible {}

protocol ParkAccessible: AreaAccessible {}

protocol KitchenAccessible: AreaAccessible {}

protocol RideControlAccessible: AreaAccessible {}

protocol MaintenanceAccessible: AreaAccessible {}

protocol OfficeAccessible: AreaAccessible {}

// Ride Acess
protocol AllRideAccessible {}

protocol SkipRideLineAccessible: AllRideAccessible {}

// Discount Access
protocol DiscountAccessible {}

protocol FoodDiscountAccessible: DiscountAccessible {
    var foodDiscountPercentage: Int { get }
}

protocol MerchandiseDiscountAccessible: DiscountAccessible {
    var merchandiseDiscountPercentage: Int { get }
}

// MARK: Personal/Business Information Protocols

protocol Nameable {
    var firstName: String { get }
    var lastName: String { get }
}

protocol Ageable {
    var dateOfBirth: Date { get }
}

protocol Addressable {
    var streetAddress: String { get }
    var city: String { get }
    var state: String { get }
    var zipCode: Int { get }
}

// MARK: Entrant Protocols

protocol Guest: AllRideAccessible, ParkAccessible {}

protocol Employee: Nameable, Addressable, ParkAccessible {}

protocol HourlyEmployee: Employee, AllRideAccessible, FoodDiscountAccessible, MerchandiseDiscountAccessible {}


