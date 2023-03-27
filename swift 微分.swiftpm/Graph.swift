import SwiftUI
import PlaygroundSupport

struct FunctionGraphView: View {
    let functionString: String
    let lowerBound: String
    let upperBound: String
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            Path { path in
                if let coefficients = parsePolynomial(function: functionString),
                   let lower = Double(lowerBound),
                   let upper = Double(upperBound),
                   lower < upper {
                    let step = (upper - lower) / Double(width)
                    var x = lower
                    var y = evaluatePolynomial(coefficients, x: x)
                    path.move(to: CGPoint(x: 0, y: height - CGFloat(y)))
                    
                    for xPos in 1..<Int(width) {
                        x += step
                        y = evaluatePolynomial(coefficients, x: x)
                        path.addLine(to: CGPoint(x: CGFloat(xPos), y: height - CGFloat(y)))
                    }
                }
            }
            .stroke(Color.blue)
        }
    }
    
    func parsePolynomial(function: String) -> [Double]? {
        let components = function.split(separator: " ").filter { $0 != "+" }
        var coefficients = [Double]()
        
        for component in components {
            guard let coefficient = Double(component) else { return nil }
            coefficients.append(coefficient)
        }
        
        return coefficients
    }
    
    func evaluatePolynomial(_ coefficients: [Double], x: Double) -> Double {
        return coefficients.enumerated().reduce(0) { result, item in
            let (index, coefficient) = item
            return result + coefficient * pow(x, Double(index))
        }
    }
}

