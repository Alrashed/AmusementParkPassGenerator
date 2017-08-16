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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func guestCategorySelected(_ sender: UIButton) {
    }
    
    @IBAction func employeeCategorySelected(_ sender: UIButton) {
    }
    
    @IBAction func managerCategorySelected(_ sender: UIButton) {
    }
    
    @IBAction func contractorCategorySelected(_ sender: UIButton) {
    }
    
    @IBAction func vendorCategorySelected(_ sender: UIButton) {
    }
    
    
    @IBAction func subCategorySelected(_ sender: UIButton) {
    }
    
    
    @IBAction func generatePass() {
    }
    
    @IBAction func populateData() {
    }
    
}

