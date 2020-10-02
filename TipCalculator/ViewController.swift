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
    
    var foodCost = 0.0
    var tipPercent = 0.0
    var tip = 0.0
    var costTotal = 0.0
    var costPerPerson = 0.0
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MAIN FUNCTION
    @IBAction func procentSliderAction(_ sender: UISlider){
        let procentAsString = String(format: "%.0f", sender.value)
        procentLabel.text = procentAsString + "%"
        
        calculation()
        
    }
    
    @IBAction func procentButtonAction(_ sender: UIButton){
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
        
        calculation()
    }
    
    func calculation(){
        if !(amountTextField.text!.isEmpty) && !(amountPeopleTextField.text!.isEmpty) {
            foodCost = Double(amountTextField.text!)!
            tipPercent = Double(procentSlider.value)
            
            tip = (foodCost * tipPercent) / 100
            costTotal = foodCost + tip
            
            costPerPerson = costTotal / Double(amountPeopleTextField.text!)!
            
            printUIElements()
            
        } else {
            notification(msg: "Please provide the cost and the amount of persons")
        }
        
    }
    
    func notification(msg: String){
        let alert = UIAlertController(title: "Oh no...", message: msg, preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "OK", style: .default){ (action) in}
        
        alert.addAction(action1)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func printUIElements(){
        let stringTip = String(format: "%.2f", tip)
        let stringCostTotal = String(format: "%.2f", costTotal)
        let stringCostPerPerson = String(format: "%.2f", costPerPerson)
        
        tipLabel.text = "Tip: " + stringTip + "€"
        amountLabel.text = "Amount: " + stringCostTotal + "€"
        amountPerPersonLabel.text = "Amount per person: " + stringCostPerPerson + "€"
        
    }
    
}

