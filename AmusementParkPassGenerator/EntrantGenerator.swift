//
//  EntrantGenerator.swift
//  AmusementParkPassGenerator
//
//  Created by Khalid Alrashed on 8/16/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import Foundation

enum Guest: String {
    case classic
    case VIP
    case FreeChild
    case SeasonPass
    case Senior
}

enum HourlyEmployee: String {
    case foodServices
    case rideServices
    case maintenance
    case manager
}

enum ContractorProject: String {
    case p1001
    case p1002
    case p1003
    case p2001
    case p2002
}

enum VendorCompany: String {
    case acme
    case orkin
    case fedex
    case nwElectric
}

class EntrantGenerator {
    
    let fullName = try! FullName(firstName: "Khalid", lastName: "Alrashed")
    let fullAddress = try! FullAddress(streetAddress: "123 street", city: "SF", state: "CA", zipCode: 12345)
    
    func generateGuest(_ guest: Guest) -> GuestType {
        switch guest {
        case .classic: return ClassicGuest()
        case .VIP: return VIPGuest()
        case .FreeChild: return try! FreeChildGuest(month: 1, day: 1, year: 2017)
        case .SeasonPass: return SeasonPassGuest(fullName: fullName, fullAddress: fullAddress)
        case .Senior: return try! SeniorGuest(fullName: fullName, month: 1, day: 1, year: 1950)
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
