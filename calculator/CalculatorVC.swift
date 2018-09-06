//
//  ViewController.swift
//  calculator
//
//  Created by mr Yacine on 04/09/2018.
//  Copyright © 2018 mr Yacine. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {
    var isDot : Bool = false
    @IBOutlet weak var label: UILabel!
    
    @IBAction func dots(_ sender: UIButton) {
        if isDot == false {
            label.text = label.text! + "."
            isDot = true
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    let brain = CalculatorBrain()
    @IBAction func NumBouttons(_ sender: UIButton) {
        if self.label.text == "0" { self.label.text = "" }
        self.label.text = self.label.text! + (sender.titleLabel?.text!)!
    }
    @IBAction func operationsButton(_ sender: UIButton) {
        brain.add(Number: Double(self.label.text!)!, Op: Character((sender.titleLabel?.text!)!))
        self.label.text = "0"
        isDot = false
        if sender.titleLabel!.text == "=" {
            self.label.text = brain.Result()
            brain.Restart()
        }
    }
    @IBAction func AC(_ sender: UIButton) {
        isDot = false
        brain.Restart()
        label.text = "0"
    }
    @IBAction func plusSous(_ sender: UIButton) {
        var number = Double(label.text!)!
        number = number * -1
        label.text = String(number)
    }
    
    @IBAction func pourcent(_ sender: UIButton) {
        var number = Double(label.text!)!
        number = number / 100
        label.text = String(number)
    }
}

