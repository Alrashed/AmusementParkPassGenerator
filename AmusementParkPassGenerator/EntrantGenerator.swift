//
//  EntrantGenerator.swift
//  AmusementParkPassGenerator
//
//  Created by Khalid Alrashed on 8/16/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import Foundation

enum Guest: String {
    case classic    = "Classic"
    case vip        = "VIP"
    case freeChild  = "Child"
    case seasonPass = "Season"
    case senior     = "Senior"
    
    var passDescription: String {
        switch self {
        case .classic, .vip, .freeChild, .seasonPass, .senior:
            return "\(self.rawValue) Guest Pass"
        }
    }
}

enum HourlyEmployee: String {
    case foodServices = "Food Services"
    case rideServices = "Ride Services"
    case maintenance  = "Maintenance"
    case manager      = "Manager"
    
    var passDescription: String {
        switch self {
        case .foodServices, .rideServices, .maintenance:
            return "\(self.rawValue) Employee Pass"
        case .manager:
            return "\(self.rawValue) Pass"
        }
    }
}

enum ContractorProject: String {
    case p1001 = "1001"
    case p1002 = "1002"
    case p1003 = "1003"
    case p2001 = "2001"
    case p2002 = "2002"
    
    var passDescription: String {
        switch self {
        case .p1001, .p1002, .p1003, .p2001, .p2002:
            return "Project \(self.rawValue) Contractor Pass"
        }
    }
}

enum VendorCompany: String {
    case acme       = "Acme"
    case orkin      = "Orkin"
    case fedex      = "Fedex"
    case nwElectric = "NW Electrical"
    
    var passDescription: String {
        switch self {
        case .acme, .orkin, .fedex, .nwElectric:
            return "\(self.rawValue) Vendor Pass"
        }
    }
}

class EntrantGenerator {
    
    private let fullName = try! FullName(firstName: "Khalid", lastName: "Alrashed")
    private let fullAddress = try! FullAddress(streetAddress: "123 street", city: "SF", state: "CA", zipCode: 12345)
    
    func generateGuest(_ guest: Guest) -> GuestType {
        switch guest {
        case .classic: return ClassicGuest()
        case .vip: return VIPGuest()
        case .freeChild: return try! FreeChildGuest(month: 1, day: 1, year: 2017)
        case .seasonPass: return SeasonPassGuest(fullName: fullName, fullAddress: fullAddress)
        case .senior: return try! SeniorGuest(fullName: fullName, month: 1, day: 1, year: 1950)
        }
    }
    
    func generateEmployee(_ employee: HourlyEmployee) -> HourlyEmployeeType {
        switch employee {
        case .foodServices: return FoodServicesEmployee(fullName: fullName, fullAddress: fullAddress)
        case .rideServices: return RideServicesEmployee(fullName: fullName, fullAddress: fullAddress)
        case .maintenance: return MaintenanceEmployee(fullName: fullName, fullAddress: fullAddress)
        case .manager: return Manager(fullName: fullName, fullAddress: fullAddress)
        }
    }
    
    func generateContractor(_ contractor: ContractorProject) -> ContractorType {
        switch contractor {
        case .p1001: return ContractorProject1001(fullName: fullName, fullAddress: fullAddress)
        case .p1002: return ContractorProject1002(fullName: fullName, fullAddress: fullAddress)
        case .p1003: return ContractorProject1003(fullName: fullName, fullAddress: fullAddress)
        case .p2001: return ContractorProject2001(fullName: fullName, fullAddress: fullAddress)
        case .p2002: return ContractorProject2002(fullName: fullName, fullAddress: fullAddress)
        }
    }
    
    func generateVendor(_ vendor: VendorCompany) -> VendorType {
        switch vendor {
        case .acme: return try! Acme(fullName: fullName, month: 1, day: 1, year: 1980)
        case .orkin: return try! Orkin(fullName: fullName, month: 1, day: 1, year: 1980)
        case .fedex: return try! Fedex(fullName: fullName, month: 1, day: 1, year: 1980)
        case .nwElectric: return try! NWElectrical(fullName: fullName, month: 1, day: 1, year: 1980)
        }
    }
}
