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
    
    var entrant: EntrantType!
    var passDescription: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        
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
}
