//
//  InterfaceController.swift
//  MathWatch Extension
//
//  Created by Alejandro Ibarra on 10/4/18.
//  Copyright © 2018 Alejandro Ibarra. All rights reserved.
//

import WatchKit
import Foundation

extension Double {
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var Label: WKInterfaceLabel!
    @IBOutlet weak var Label2: WKInterfaceLabel!
    @IBOutlet weak var Calcular: WKInterfaceButton!
    
    @IBOutlet weak var suma: WKInterfaceLabel!
    @IBOutlet weak var resta: WKInterfaceLabel!
    @IBOutlet weak var multi: WKInterfaceLabel!
    @IBOutlet weak var division: WKInterfaceLabel!
    var num1 = 0.0
    var num2 = 0.0
    
    @IBAction func numero1() {
        presentTextInputController(withSuggestions: ["1", "2", "3"], allowedInputMode:   WKTextInputMode.plain) { (arr: [Any]?) in
            if let answers = arr as? [String] {
                if let answer = answers[0] as? String {
                    self.Label.setText(String(answer))
                    self.num1 = Double(answer) ?? 0.0
                }
            }
        }
    }
    
    @IBAction func numero2() {
        presentTextInputController(withSuggestions: ["1", "2", "3"], allowedInputMode:   WKTextInputMode.plain) { (arr: [Any]?) in
            if let answers = arr as? [String] {
                if let answer = answers[0] as? String {
                    self.Label2.setText(answer)
                    self.num2 = Double(answer) ?? 0.0
                }
            }
        }
    }
    
    @IBAction func calcular() {
        let num1:Double = Double(self.num1)
        let num2:Double = Double(self.num2)
        
        let mas = (num1 + num2).cleanValue
        let menos = (num1 - num2).cleanValue
        let por = (num1 * num2).cleanValue
        let dividido = (num1 / num2).cleanValue

        self.suma.setText("+ " + String(mas))
        self.resta.setText("- " + String(menos))
        self.multi.setText("x " + String(por))
        self.division.setText("÷ " + String(dividido))
    }
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
