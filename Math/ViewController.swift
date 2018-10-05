//
//  ViewController.swift
//  Math
//
//  Created by Alejandro Ibarra on 10/2/18.
//  Copyright © 2018 Alejandro Ibarra. All rights reserved.
//

import UIKit

extension Float {
    var cleanValue: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var box1: UITextField!
    
    @IBOutlet weak var box2: UITextField!
    
    @IBOutlet weak var suma: UILabel!
    
    @IBOutlet weak var resta: UILabel!
    
    @IBOutlet weak var multiplicacion: UILabel!
    
    @IBOutlet weak var division: UILabel!
    
    // Calcula suma, resta, multiplicacion y division y los muestra en interfaz.
    @IBAction func calcular(_ sender: Any) {
        let num1:Float = Float(box1.text!) ?? 0
        let num2:Float = Float(box2.text!) ?? 0
        
        let mas = (num1 + num2).cleanValue
        let menos = (num1 - num2).cleanValue
        let por = (num1 * num2).cleanValue
        let dividido = (num1 / num2).cleanValue
        
        self.suma.text = "Suma: " + String(mas)
        self.resta.text = "Resta: " + String(menos)
        self.multiplicacion.text = "Multiplicación: " + String(por)
        self.division.text = "División: " + String(dividido)
        
    }

}

