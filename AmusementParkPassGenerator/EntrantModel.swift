//
//  EntrantModel.swift
//  AmusementParkPassGenerator
//
//  Created by Khalid Alrashed on 8/8/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import Foundation

// MARK: enums and structs

enum InformationError: Error {
    case missingFirstName
    case missingLastName
    case missingStreetAddress
    case missingCity
    case missingState
    case missingZipCode
    case invalidDateOfBirth
    case invalidAge
}

struct FullName {
    let firstName: String
    let lastName: String
    
    init(firstName: String, lastName: String) throws {
        if firstName.isEmpty {
            throw InformationError.missingFirstName
        }
        if lastName.isEmpty {
            throw InformationError.missingLastName
        }
        
        self.firstName = firstName
        self.lastName = lastName
    }
}

struct FullAddress {
    let streetAddress: String
    let city: String
    let state: String
    let zipCode: Int
    
    init(streetAddress: String, city: String, state: String, zipCode: Int = 0) throws {
        if streetAddress.isEmpty {
            throw InformationError.missingStreetAddress
        }
        if city.isEmpty {
            throw InformationError.missingCity
        }
        if state.isEmpty {
            throw InformationError.missingState
        }
        if zipCode == 0 {
            throw InformationError.missingZipCode
        }
        
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
    }
}

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
    var fullName: FullName { get }
}

protocol Addressable {
    var fullAddress: FullAddress { get }
}

protocol Ageable {
    var dateOfBirth: Date { get }
}

protocol Dateable {
    var dateOfVisit: Date { get }
}

// MARK: Entrant Protocols

protocol EntrantType {}

protocol GuestType: EntrantType, AllRideAccessible, ParkAccessible {}

protocol EmployeeType: EntrantType, Nameable, Addressable, ParkAccessible {}

protocol HourlyEmployeeType: EmployeeType, AllRideAccessible, FoodDiscountAccessible, MerchandiseDiscountAccessible {}


// MARK: - Entrant classes

// Guests
class ClassicGuest: GuestType {}

class VIPGuest: GuestType, SkipRideLineAccessible, FoodDiscountAccessible, MerchandiseDiscountAccessible {
    let merchandiseDiscountPercentage: Int = 10
    let foodDiscountPercentage: Int = 20
}

class FreeChildGuest: GuestType, Ageable {
    let dateOfBirth: Date
    
    init(month: Int, day: Int, year: Int) throws {
        guard let dateOfBirth = Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) else {
            throw InformationError.invalidDateOfBirth
        }
        
        if let age = Calendar.current.dateComponents([.month], from: dateOfBirth, to: Date()).month {
            let years = age / 12
            
            if years >= 5 {
                throw InformationError.invalidAge
            }
        }
        
        self.dateOfBirth = dateOfBirth
    }
}

// Employees
class Employee: HourlyEmployeeType {
    var foodDiscountPercentage: Int = 15
    let merchandiseDiscountPercentage: Int = 25
    let fullName: FullName
    let fullAddress: FullAddress

    init(fullName: FullName, fullAddress: FullAddress) {
        self.fullName = fullName
        self.fullAddress = fullAddress
    }
}

class FoodServicesEmployee: Employee, KitchenAccessible {}

class RideServicesEmployee: Employee, RideControlAccessible {}

class MaintenanceEmployee: Employee, KitchenAccessible, RideControlAccessible, MaintenanceAccessible {}

class Manager: Employee, KitchenAccessible, RideControlAccessible, MaintenanceAccessible, OfficeAccessible {
    override init(fullName: FullName, fullAddress: FullAddress) {
        super.init(fullName: fullName, fullAddress: fullAddress)
        self.foodDiscountPercentage = 25
    }
}


