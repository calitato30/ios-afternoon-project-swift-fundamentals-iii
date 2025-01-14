//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Ben Gohlke on 8/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
enum Currency {
    case cad
    case mxn
}
var currency : Currency = .cad

class ViewController: UIViewController {

    
    // MARK: - Outlets/Properties
    
    @IBOutlet weak var fromCurrencyTextField: UITextField!
    @IBOutlet weak var toCurrencyTextField: UITextField!
    
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    @IBOutlet weak var cadButton: UIButton!
    @IBOutlet weak var mxnButton: UIButton!

    // MARK: - Actions
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        
        guard let userInput = fromCurrencyTextField.text else { return }

        
                 guard let convertedInput = Double(userInput) else {
                    print("This is not a valid input")
                    return
                }

                 var convertedCurrency: Double

                 if cadButton.isSelected {
                    convertedCurrency = convert(convertedInput)
                    toCurrencyTextField.text = "\(userInput) US dollars in Canadian dollars is \(convertedCurrency)"
                } else {
                    convertedCurrency = convert(convertedInput)
                    toCurrencyTextField.text = "\(userInput) US dollars in Mexican pesos is \(convertedCurrency)"
                }
            }
    
    @IBAction func cadButtonTapped(_ sender: UIButton) {
        
        cadButton.isSelected.toggle()
        mxnButton.isSelected.toggle()
        if cadButton.isSelected {
        currency = .cad
        toCurrencyLabel.text = "Currency (CAD)"    }
    }
    
    @IBAction func mxnButtonTapped(_ sender: UIButton) {
        mxnButton.isSelected.toggle()
        cadButton.isSelected.toggle()
        if mxnButton.isSelected {
        currency = .mxn
        toCurrencyLabel.text = "Currency (MXN)"
                }
    }
    
    // MARK: - Helper Methods
}

func convert(_ dollars: Double) -> Double {
        var convertedCurrency: Double

         if currency == .cad {
            convertedCurrency = dollars * 1.32
        } else {
            convertedCurrency = dollars * 19.11
        }

         return convertedCurrency
    }

