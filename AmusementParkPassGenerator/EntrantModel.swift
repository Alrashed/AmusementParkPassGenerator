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
    case tooOld
    case tooYoung
    
    var alertTitle: String {
        switch self {
        case .missingFirstName: return "Missing First Name"
        case .missingLastName: return " Missing Last Name"
        case .missingStreetAddress: return "Missing Street Address"
        case .missingCity: return "Missing City"
        case .missingState: return "Missing State"
        case .missingZipCode: return "Missing ZipCode"
        case .invalidDateOfBirth: return "Invalid Date of Birth"
        case .tooOld: return "Entrant is Too Old"
        case .tooYoung: return "Entrant is Too Young"
        }
    }
    
    var alertMessage: String {
        switch self {
        case .missingFirstName: return "Please fill in the first name field."
        case .missingLastName: return " Please fill in the last name field."
        case .missingStreetAddress: return "Please fill in the street address field."
        case .missingCity: return "Please fill in the city field."
        case .missingState: return "Please fill in the state field."
        case .missingZipCode: return "Please fill in the zip code field."
        case .invalidDateOfBirth: return "Please retype the date of birth."
        case .tooOld: return "Please choose another pass."
        case .tooYoung: return "Please choose another pass."
        }
    }
}

//enum DateOfBirthError: Error {
//    case tooOld
//    case tooYoung
//}

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
    var fullName: FullName { get set }
}

protocol Addressable {
    var fullAddress: FullAddress { get set }
}

protocol Ageable {
    var dateOfBirth: Date { get set }
}

protocol Dateable {
    var dateOfVisit: Date? { get set }
}

// MARK: Entrant Protocols

protocol EntrantType {}

protocol GuestType: EntrantType, AllRideAccessible, ParkAccessible {}

protocol EmployeeType: EntrantType, Nameable, Addressable, ParkAccessible {}

protocol HourlyEmployeeType: EmployeeType, AllRideAccessible, FoodDiscountAccessible, MerchandiseDiscountAccessible {}

protocol ContractorType: EntrantType, Nameable, Addressable {}

protocol VendorType: EntrantType, Nameable, Dateable, Ageable {}


// MARK: - Entrant classes

// Guests
class ClassicGuest: GuestType {}

class VIPGuest: GuestType, SkipRideLineAccessible, FoodDiscountAccessible, MerchandiseDiscountAccessible {
    let merchandiseDiscountPercentage: Int = 10
    let foodDiscountPercentage: Int = 20
}

class FreeChildGuest: GuestType, Ageable {
    var dateOfBirth: Date
    
    init(month: Int, day: Int, year: Int) throws {
        guard let dateOfBirth = Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) else {
            throw InformationError.invalidDateOfBirth
        }
        
        if let age = Calendar.current.dateComponents([.month], from: dateOfBirth, to: Date()).month {
            let years = age / 12
            
            if years >= 5 {
                throw InformationError.tooOld
            }
        }
        
        self.dateOfBirth = dateOfBirth
    }
}

class SeasonPassGuest: GuestType, Nameable, Addressable, SkipRideLineAccessible, FoodDiscountAccessible, MerchandiseDiscountAccessible {
    let foodDiscountPercentage: Int = 10
    let merchandiseDiscountPercentage: Int = 20
    var fullName: FullName
    var fullAddress: FullAddress
    
    init(fullName: FullName, fullAddress: FullAddress) {
        self.fullName = fullName
        self.fullAddress = fullAddress
    }
}

class SeniorGuest: GuestType, Nameable, Ageable, SkipRideLineAccessible, FoodDiscountAccessible, MerchandiseDiscountAccessible {
    let foodDiscountPercentage: Int = 10
    let merchandiseDiscountPercentage: Int = 20
    var fullName: FullName
    var dateOfBirth: Date
    
    init(fullName: FullName, month: Int, day: Int, year: Int) throws {
        self.fullName = fullName
        
        guard let dateOfBirth = Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) else {
            throw InformationError.invalidDateOfBirth
        }
        
        if let age = Calendar.current.dateComponents([.month], from: dateOfBirth, to: Date()).month {
            let years = age / 12
            
            if years < 60 {
                throw InformationError.tooYoung
            }
        }
        
        self.dateOfBirth = dateOfBirth
    }
}

// Hourly Employees
class Employee: HourlyEmployeeType {
    var foodDiscountPercentage: Int = 15
    let merchandiseDiscountPercentage: Int = 25
    var fullName: FullName
    var fullAddress: FullAddress

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

// Contractors
class Contractor: ContractorType {
    var fullName: FullName
    var fullAddress: FullAddress
    
    init(fullName: FullName, fullAddress: FullAddress) {
        self.fullName = fullName
        self.fullAddress = fullAddress
    }
}

class ContractorProject1001: Contractor, ParkAccessible, RideControlAccessible {}

class ContractorProject1002: Contractor, ParkAccessible, RideControlAccessible, MaintenanceAccessible {}

class ContractorProject1003: Contractor, ParkAccessible, RideControlAccessible, KitchenAccessible, MaintenanceAccessible, OfficeAccessible {}

class ContractorProject2001: Contractor, OfficeAccessible {}

class ContractorProject2002: Contractor, KitchenAccessible, OfficeAccessible {}

// Vendors
class Vendor: VendorType {
    var fullName: FullName
    var dateOfBirth: Date
    var dateOfVisit: Date?
    
    init(fullName: FullName, month: Int, day: Int, year: Int) throws {
        self.fullName = fullName
        
        guard let dateOfBirth = Calendar.current.date(from: DateComponents(year: year, month: month, day: day)) else {
            throw InformationError.invalidDateOfBirth
        }
        self.dateOfBirth = dateOfBirth
    }
}

class Acme: Vendor, KitchenAccessible {}

class Orkin: Vendor, ParkAccessible, RideControlAccessible, KitchenAccessible {}

class Fedex: Vendor, MaintenanceAccessible, OfficeAccessible {}

class NWElectrical: Vendor, ParkAccessible, RideControlAccessible, KitchenAccessible, MaintenanceAccessible, OfficeAccessible {}

