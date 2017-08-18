//
//  TestPassViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Khalid Alrashed on 8/17/17.
//  Copyright © 2017 Khalid Alrashed. All rights reserved.
//

import UIKit

class TestPassViewController: UIViewController {
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var passDescriptionLabel: UILabel!
    @IBOutlet weak var rideDescriptionLabel: UILabel!
    @IBOutlet weak var foodDiscountLabel: UILabel!
    @IBOutlet weak var merchDiscountLabel: UILabel!
    @IBOutlet weak var testResultsLabel: UILabel!
    
    @IBOutlet weak var testAccessButton0: UIButton!
    @IBOutlet weak var testAccessButton1: UIButton!
    @IBOutlet weak var testAccessButton2: UIButton!
    @IBOutlet weak var testAccessButton3: UIButton!
    @IBOutlet weak var testAccessButton4: UIButton!
    
    var testAccessButtons = [UIButton]()
    
    let passScanner = PassScanner()
    var entrant: EntrantType!
    var passDescription: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        testAccessButtons = [testAccessButton0, testAccessButton1, testAccessButton2, testAccessButton3, testAccessButton4]
        
        configurePassLabels()
    }
    
    @IBAction func createNewPass(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showAreaAccessTests(_ sender: UIButton) {
        
    }
    
    @IBAction func showRideAccessTests(_ sender: UIButton) {
        
    }
    
    @IBAction func showDiscountAccessTests(_ sender: UIButton) {
        
    }
    
    @IBAction func accessTestSelected(_ sender: UIButton) {
        
    }
    
    func configurePassLabels() {
        if let entrant = entrant as? Nameable {
            fullNameLabel.text = "\(entrant.fullName.firstName) \(entrant.fullName.lastName)"
        } else {
            fullNameLabel.text = ""
        }
        
        passDescriptionLabel.text = passDescription
        
        if entrant is AllRideAccessible {
            rideDescriptionLabel.text = "• Unlimited Rides"
        } else {
            rideDescriptionLabel.text = ""
        }
        
        if let entrant = entrant as? FoodDiscountAccessible {
            foodDiscountLabel.text = "• \(entrant.foodDiscountPercentage)% Food Discount"
        } else {
            foodDiscountLabel.text = ""
        }
        
        if let entrant = entrant as? MerchandiseDiscountAccessible {
            merchDiscountLabel.text = "• \(entrant.merchandiseDiscountPercentage)% Merch Discount"
        } else {
            merchDiscountLabel.text = ""
        }
    }
}
