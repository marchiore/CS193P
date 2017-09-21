//
//  CalculatorBrain.swift
//  CS193PCalc
//
//  Created by Matheus Marchiore on 20/09/17.
//  Copyright © 2017 Matheus Marchiore. All rights reserved.
//

import Foundation

class CalculatorBrain {
    
    private var accumulator: Double?
    
    private enum Operation {
        case constant(Double)
        case unaryOperation((Double) -> Double)
    }
    
    private var operations: Dictionary<String,Operation> =
    [
        "π" : Operation.constant(Double.pi),
        "e" : Operation.constant(M_E),
        "√" : Operation.unaryOperation(sqrt),
        "cos" : Operation.unaryOperation(cos),
        // "±" : Operation.unaryOperation(changeSign)
    ]
    
    func performOperation(_ symbol: String) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unaryOperation(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
                break
            }
        }
    }
    
    func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double?{
        get {
            return accumulator
        }
    }
}
