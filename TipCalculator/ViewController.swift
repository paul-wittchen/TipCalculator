//
//  ViewController.swift
//  TipCalculator
//
//  Created by Paul Wittchen on 02.10.20.
// Copyright 2020 Paul Wittchen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var amountPeopleTextField: UITextField!
    
    @IBOutlet weak var procentLabel: UILabel!
    @IBOutlet weak var procentSlider: UISlider!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var amountPerPersonLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func procentSliderAction(_ sender: UISlider) {
        let procentAsString = String(format: "%.0f", sender.value)
        procentLabel.text = procentAsString + "%"
    }
    
    @IBAction func procentButtonAction(_ sender: UIButton) {
        if sender.titleLabel?.text == "5%" {
            procentSlider.value = 5.0
            procentLabel.text = "5%"
        } else if sender.titleLabel?.text == "10%" {
            procentSlider.value = 10.0
            procentLabel.text = "10%"
        } else {
            procentSlider.value = 15.0
            procentLabel.text = "15%"
        }
    }
    
}

