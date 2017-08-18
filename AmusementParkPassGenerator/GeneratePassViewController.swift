//
//  GeneratePassViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Khalid Alrashed on 8/7/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import UIKit

class GeneratePassViewController: UIViewController {
    @IBOutlet weak var guestCategoryButton: UIButton!
    @IBOutlet weak var employeeCategoryButton: UIButton!
    @IBOutlet weak var managerCategoryButton: UIButton!
    @IBOutlet weak var contractorCategoryButton: UIButton!
    @IBOutlet weak var vendorCategoryButton: UIButton!
    
    @IBOutlet weak var subCategoryButton0: UIButton!
    @IBOutlet weak var subCategoryButton1: UIButton!
    @IBOutlet weak var subCategoryButton2: UIButton!
    @IBOutlet weak var subCategoryButton3: UIButton!
    @IBOutlet weak var subCategoryButton4: UIButton!
    
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var projectTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    var categoryButtons = [UIButton]()
    var subCategoryButtons = [UIButton]()
    
    var generator = EntrantGenerator()
    var entrant: EntrantType!
    var passDescription = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryButtons = [guestCategoryButton, employeeCategoryButton, managerCategoryButton, contractorCategoryButton, vendorCategoryButton]
        subCategoryButtons = [subCategoryButton0, subCategoryButton1, subCategoryButton2, subCategoryButton3, subCategoryButton4]
        
        subCategorySelected(subCategoryButton0)
    }
    
    @IBAction func guestCategorySelected(_ sender: UIButton) {
        configureSubCategoryButtons(["Classic", "Child", "Senior", "VIP", "Season"])
        subCategorySelected(sender)
    }
    
    @IBAction func employeeCategorySelected(_ sender: UIButton) {
        configureSubCategoryButtons(["Food Services", "Ride Services", "Maintenance"])
        subCategorySelected(sender)
    }
    
    @IBAction func managerCategorySelected(_ sender: UIButton) {
        configureSubCategoryButtons([])
        subCategorySelected(sender)
    }
    
    @IBAction func contractorCategorySelected(_ sender: UIButton) {
        configureSubCategoryButtons(["1001", "1002", "1003", "2001", "2002"])
        subCategorySelected(sender)
    }
    
    @IBAction func vendorCategorySelected(_ sender: UIButton) {
        configureSubCategoryButtons(["Acme", "Orkin", "Fedex", "NW Electrical"])
        subCategorySelected(sender)
    }
    
    
    @IBAction func subCategorySelected(_ sender: UIButton) {
        guard let selectedCategory = sender.titleLabel?.text else { return }
        
        enableTextFields([projectTextField, companyTextField], enabled: false)
        
        switch selectedCategory {
            
        case "Guest", "Classic":
            entrant = generator.generateGuest(.classic)
            passDescription = Guest.classic.passDescription
            
        case "Child":
            entrant = generator.generateGuest(.freeChild)
            passDescription = Guest.freeChild.passDescription
            
        case "Senior":
            entrant = generator.generateGuest(.senior)
            passDescription = Guest.senior.passDescription
            
        case "VIP":
            entrant = generator.generateGuest(.vip)
            passDescription = Guest.vip.passDescription
            
        case "Season":
            entrant = generator.generateGuest(.seasonPass)
            passDescription = Guest.seasonPass.passDescription
            
        case "Employee", "Food Services":
            entrant = generator.generateEmployee(.foodServices)
            passDescription = HourlyEmployee.foodServices.passDescription
            
        case "Ride Services":
            entrant = generator.generateEmployee(.rideServices)
            passDescription = HourlyEmployee.rideServices.passDescription
            
        case "Maintenance":
            entrant = generator.generateEmployee(.maintenance)
            passDescription = HourlyEmployee.maintenance.passDescription
            
        case "Manager":
            entrant = generator.generateEmployee(.manager)
            passDescription = HourlyEmployee.manager.passDescription
            
        case "Contractor", "1001":
            entrant = generator.generateContractor(.p1001)
            passDescription = ContractorProject.p1001.passDescription
            projectTextField.text = ContractorProject.p1001.rawValue
            
        case "1002", "1003", "2001", "2002":
            entrant = generator.generateContractor(ContractorProject(rawValue: selectedCategory)!)
            passDescription = ContractorProject(rawValue: selectedCategory)!.passDescription
            projectTextField.text = ContractorProject(rawValue: selectedCategory)!.rawValue
            
        case "Vendor", "Acme":
            entrant = generator.generateVendor(.acme)
            passDescription = VendorCompany.acme.passDescription
            companyTextField.text = VendorCompany.acme.rawValue
            
        case "Orkin", "Fedex", "NW Electrical":
            entrant = generator.generateVendor(VendorCompany(rawValue: selectedCategory)!)
            passDescription = VendorCompany(rawValue: selectedCategory)!.passDescription
            companyTextField.text = VendorCompany(rawValue: selectedCategory)!.rawValue
            
        default: print("Error selecting a category")
        }
        
        enableRequirdTextFields(for: entrant)
    }
    
    
    @IBAction func populateData() {
        if dateOfBirthTextField.isEnabled && dateOfBirthTextField.text!.isEmpty {
            dateOfBirthTextField.text = "11/25/1950"
        }
        
        if firstNameTextField.isEnabled && firstNameTextField.text!.isEmpty {
            firstNameTextField.text = "Khalid"
        }
        
        if lastNameTextField.isEnabled && lastNameTextField.text!.isEmpty {
            lastNameTextField.text = "Alrashed"
        }
        
        if streetAddressTextField.isEnabled && streetAddressTextField.text!.isEmpty {
            streetAddressTextField.text = "123 street"
        }
        
        if cityTextField.isEnabled && cityTextField.text!.isEmpty {
            cityTextField.text = "SF"
        }
        
        if stateTextField.isEnabled && stateTextField.text!.isEmpty {
            stateTextField.text = "CA"
        }
        
        if zipCodeTextField.isEnabled && zipCodeTextField.text!.isEmpty {
            zipCodeTextField.text = "12345"
        }
    }
    
    @IBAction func generatePass() {
        
    }
    
    
    func configureSubCategoryButtons(_ buttonLabels: [String]) {
        for (index, label) in buttonLabels.enumerated() {
            subCategoryButtons[index].setTitle(label, for: .normal)
        }
        
        for buttonIndex in 0..<buttonLabels.count {
            subCategoryButtons[buttonIndex].isHidden = false
        }
        
        for buttonIndex in buttonLabels.count..<subCategoryButtons.count {
            subCategoryButtons[buttonIndex].isHidden = true
        }
    }
    
    func enableRequirdTextFields(for entrant: EntrantType) {
        enableTextFields([dateOfBirthTextField], enabled: entrant is Ageable)
        enableTextFields([firstNameTextField, lastNameTextField], enabled: entrant is Nameable)
        enableTextFields([streetAddressTextField, cityTextField, stateTextField, zipCodeTextField], enabled: entrant is Addressable)
    }
    
    func enableTextFields(_ textFields: [UITextField], enabled: Bool) {
        for textField in textFields {
            if enabled == true {
                textField.isEnabled = true
                textField.backgroundColor = UIColor.white
            } else {
                textField.isEnabled = false
                textField.backgroundColor = UIColor.clear
                textField.text = ""
            }
        }
    }
}

