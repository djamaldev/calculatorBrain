//
//  CalculatorBrain.swift
//  calculator
//
//  Created by mr Yacine on 04/09/2018.
//  Copyright © 2018 mr Yacine. All rights reserved.
//

import Foundation
class CalculatorBrain {
    
    
    typealias CalcElement = (Num : Double, Op : Character)
    
    var NumwithOpArray : [CalcElement] = []
    
    func  Restart() { NumwithOpArray = [] }
    func add (Number : Double, Op : Character) {
        self.NumwithOpArray.append((Number, Op))
    }
    
    func  multipleAnddevise() {
        
        for (index , one) in NumwithOpArray.enumerated() {
            if one.Op == "×" || one.Op == "÷" {
                let afterCurrent = NumwithOpArray[index+1]
                var result : CalcElement!
                if one.Op == "×" { result = ( one.Num * afterCurrent.Num , afterCurrent.Op) }
                else if one.Op == "÷" { result = (one.Num / afterCurrent.Num, afterCurrent.Op)}
                NumwithOpArray.remove(at: index) ; NumwithOpArray.remove(at: index)
                NumwithOpArray.insert(result, at: index)
                multipleAnddevise()
                break
            }
            
        }
    
    }
    
    func soustract() {
        for (index , one) in NumwithOpArray.enumerated() {
            if one.Op == "-" {
                let afterCurrent = NumwithOpArray[index+1]
                NumwithOpArray.remove(at: index) ; NumwithOpArray.remove(at: index)
                let NewCal = (one.Num - afterCurrent.Num, afterCurrent.Op)
                NumwithOpArray.insert(NewCal, at: index)
                soustract()
                break
            }
        }
    }
    
    func Result() -> String
    
    {
        multipleAnddevise()
        soustract()
        let result = self.NumwithOpArray.reduce(0, {$0 + $1.Num})
        return checkNumber(Number: result)
    
    }
    func checkNumber(Number : Double) -> String {
        if floor(Number) == Number { return String(Int(Number)) }
        else { return String(Number) }
    }
}
