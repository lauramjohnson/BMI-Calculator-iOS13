//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        heightSlider.minimumValue = 0
        heightSlider.maximumValue = 100
        heightSlider.value = 50
        
        weightSlider.minimumValue = 0
        weightSlider.maximumValue = 400
        weightSlider.value = 200
        
        heightLabel.text = (String(format: "%.2f", heightSlider.value)) + "in"
        weightLabel.text = (String(format: "%.0f", weightSlider.value )) + "lb"
        
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        
        heightLabel.text = (String(format: "%.2f", sender.value)) + "in"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        
        weightLabel.text = (String(format: "%.0f", sender.value)) + "lb"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(weight: weight, height: height)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = (calculatorBrain.getColor() as! UIColor)
        }
    }
    

}

