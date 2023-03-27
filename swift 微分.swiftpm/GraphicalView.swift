import SwiftUI

struct GraphicalView: View {
    var function: String
    var lowerBound: Double
    var upperBound: Double
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                let step = 1.0 / Double(width)
                let xOrigin = width / 2.0
                let yOrigin = height / 2.0
                
                // Move to the starting point
                var x = self.lowerBound
                let y = self.evaluateFunction(x: x, width: width, height: height)
                path.move(to: CGPoint(x: xOrigin + (CGFloat(x)-CGFloat(self.lowerBound)) * width / CGFloat(self.upperBound-self.lowerBound), y: yOrigin - CGFloat(y)))
                
                // Plot the function
                while x <= self.upperBound {
                    x += step
                    let y = self.evaluateFunction(x: x, width: width, height: height)
                    path.addLine(to: CGPoint(x: xOrigin + (CGFloat(x)-CGFloat(self.lowerBound)) * width / CGFloat(self.upperBound-self.lowerBound), y: yOrigin - CGFloat(y)))
                }
            }
            .stroke(Color.blue, lineWidth: 2)
        }
    }
    
    func evaluateFunction(x: Double, width: CGFloat, height: CGFloat) -> Double {
        let expression = NSExpression(format: self.function)
        let context = NSMutableDictionary()
        context["x"] = x
        if let result = expression.expressionValue(with: context, context: nil) as? Double {
            return result * Double(height) / 2.0 / (self.upperBound - self.lowerBound)
        }
        return 0
    }
}
