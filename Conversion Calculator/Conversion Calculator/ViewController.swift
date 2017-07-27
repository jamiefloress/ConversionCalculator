//
//  ViewController.swift
//  Conversion Calculator
//
//  Created by Jamie Flores on 7/26/17.
//  Copyright © 2017 Jamie Flores. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //ALL CONVERSION FUNCTIONS__________________________________________________
    //Kilometers To Miles - 1km equals 0.621371miles
    func kilometersToMiles(_ kilometers: String) -> String {
        let conversionToMiles: Double = Double(kilometers)!
        let finalAnswerKM = conversionToMiles * 0.621371
        return String(finalAnswerKM ) + "mi"
    }
    
    //Miles To Kilometers - 1mile equals 1.60934km
    func milesToKilometers(_ miles: String) -> String {
        let conversionToKilometers: Double = Double(miles)!
        let finalAnswerMK = conversionToKilometers * 1.60934
        return String(finalAnswerMK ) + "km"
    }
    
    //Fahrenheit To Celsius - The temperature °C is equal to the temperature °F minus 32, times 5/9
    func fahrenheitToCelsius(_ fahrenheit: String) -> String {
        let conversionToCelsius: Double = Double(fahrenheit)!
        let FinalAnswerFC = (conversionToCelsius - 32) * (5/9)
        return String(FinalAnswerFC ) + "°C"
    }
    
    //Celsius To Fahrenheit - The temperature °F is equal to the temperature °C times 9/5 plus 32
    func celsiusToFahrenheit(_ celcius: String) -> String {
        let conversionToFahrenheit: Double = Double(celcius)!
        let FinalAnswerCF = (conversionToFahrenheit * (9/5)) + 32
        return String(FinalAnswerCF ) + "°F"
    }
    //__________________________________________________________________________
    
    //Conversion Input/Output
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var conversionOutput: UITextField!
    
    var outputsDisplayed = ["°F", "°C", "mi", "km"]
    var inputsDisplayed = ["°C", "°F", "km", "mi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInput.text = inputsDisplayed[selection]
        conversionOutput.text = outputsDisplayed[selection]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var NumbersToConvert: String = ""
    var converstionType: String = ""
    var selection: Int = 1
    
    @IBAction func inputNumberSelection(_ sender: UIButton) {
    
        NumbersToConvert = NumbersToConvert + String(sender.tag)
        converstionType = inputsDisplayed[selection]
        
        userInput.text = NumbersToConvert + "" + inputsDisplayed[selection]
        
        switch selection {
        
        case 1:
            self.conversionOutput.text = self.kilometersToMiles(NumbersToConvert)
        
        case 2:
            self.conversionOutput.text = self.milesToKilometers(NumbersToConvert)
        
        case 3:
            self.conversionOutput.text = self.fahrenheitToCelsius(NumbersToConvert)
        
        case 4:
            self.conversionOutput.text = self.celsiusToFahrenheit(NumbersToConvert)
        
        default:
            self.conversionOutput.text = "default"
        }
    }
    
   
    @IBAction func clickConverterButton(_ sender: UIButton) {
    
    
    let alert = UIAlertController(title: "Choose Converter", message: " ", preferredStyle: UIAlertControllerStyle.actionSheet)
    
    alert.addAction(UIAlertAction(title: "Fahrenheit to Celcius", style: UIAlertActionStyle.default, handler: {
    (alertAction) -> Void in
    // handle choice Fahrenheit to Celcius
        self.selection = 3
        self.conversionOutput.text = self.fahrenheitToCelsius(self.NumbersToConvert)
        self.userInput.text = self.NumbersToConvert
    }))
    
    alert.addAction(UIAlertAction(title: "Celcius to Fahrenheit", style: UIAlertActionStyle.default, handler: {
    (alertAction) -> Void in
    // handle choice Celcius to Fahrenheit
        self.selection = 4
        self.conversionOutput.text = self.celsiusToFahrenheit(self.NumbersToConvert)

    }))
        
    alert.addAction(UIAlertAction(title: "Miles to Kilometers", style: UIAlertActionStyle.default, handler: {
    (alertAction) -> Void in
    // handle choice Miles to Kilometers
        self.selection = 2
        self.conversionOutput.text = self.milesToKilometers(self.NumbersToConvert)
    }))
        
    alert.addAction(UIAlertAction(title: "Kilometers to Miles", style: UIAlertActionStyle.default, handler: {
    (alertAction) -> Void in
    // handle choice Kilometers to Miles
        self.selection = 1
        self.conversionOutput.text = self.kilometersToMiles(self.NumbersToConvert)
    }))
        
    self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func clickClear(_ sender: UIButton) {
        userInput.text = inputsDisplayed[selection]
        conversionOutput.text = outputsDisplayed[selection]
    }
    
    @IBAction func clickAddSubtract(_ sender: UIButton) {
        var negPosNumber = Int(NumbersToConvert)
        negPosNumber = negPosNumber! * -1
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

