import SwiftUI
import Foundation

func evaluateFunction(function: String, rawFunction: String, lowerBound: Double, upperBound: Double) -> (maxValue: Double?, minValue: Double?) {
    var maxValue: Double = -Double.infinity
    var minValue: Double = Double.infinity
    let expression = NSExpression(format: function)
    let context = NSMutableDictionary()
    for i in stride(from: lowerBound, to: upperBound, by: 0.1) {
        context["x"] = Double(i)
        if let result = expression.expressionValue(with: context, context: nil) as? Double {
            if result == 0 {
                if countFunction(function, num: (Double(i)+0.1)) < 0{
                    maxValue = max(maxValue, countFunction(rawFunction, num: Double(i)))
                }else if countFunction(function, num: (Double(i)+0.1)) > 0{
                    minValue = min(minValue, countFunction(rawFunction, num: Double(i)))
                }
            }
        }
    }
    return (maxValue == -Double.infinity ? nil : maxValue, minValue == Double.infinity ? nil : minValue)
}

func countFunction(_ function: String, num: Double) -> Double{
    let expression = NSExpression(format: function)
    let context = NSMutableDictionary()
    context["x"] = Double(num)
    if let result = expression.expressionValue(with: context, context: nil) as? Double {
        return result
    }
    return 0
}

