//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Laura Johnson on 9/2/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var bmi: BMI?

    mutating func calculateBMI(weight: Float, height: Float) -> Void {
        let bmiValue = Double(weight / pow(height, 2) * 703)
        switch bmiValue {
        case _ where bmiValue < 18.5:
            bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))
        case 18.5...24.9:
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))
        case _ where bmiValue > 24.9:
            bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1))
        default:
            print("Error")
        }
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "Don't know what to tell you"
    }
    
    func getColor() -> Any {
        return bmi?.color ?? #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
}
