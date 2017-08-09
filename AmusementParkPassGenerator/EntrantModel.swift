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


// MARK: - Entrant classes

// Guests
class ClassicGuest: Guest {}

class VIPGuest: Guest, SkipRideLineAccessible, FoodDiscountAccessible, MerchandiseDiscountAccessible {
    let merchandiseDiscountPercentage: Int = 10
    let foodDiscountPercentage: Int = 20
}

class FreeChildGuest: Guest, Ageable {
    let dateOfBirth: Date
    
    init(month: Int, day: Int, year: Int) {
        let dateOfBirth = Calendar.current.date(from: DateComponents(year: year, month: month, day: day))!
        self.dateOfBirth = dateOfBirth
    }
}

// Employees
class ParkEmployee: HourlyEmployee {
    var foodDiscountPercentage: Int = 15
    let merchandiseDiscountPercentage: Int = 25
    let firstName: String
    let lastName: String
    let streetAddress: String
    let city: String
    let state: String
    let zipCode: Int
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}

class FoodServicesEmployee: ParkEmployee, KitchenAccessible {}

class RideServicesEmployee: ParkEmployee, RideControlAccessible {}

class MaintenanceEmployee: ParkEmployee, KitchenAccessible, RideControlAccessible, MaintenanceAccessible {}

class Manager: ParkEmployee, KitchenAccessible, RideControlAccessible, MaintenanceAccessible, OfficeAccessible {
    
    override init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: Int) {
        super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode)
        self.foodDiscountPercentage = 25
    }
}


