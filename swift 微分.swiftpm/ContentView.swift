import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @State var text5 = "0"
    @State var text4 = "0"
    @State var text3 = "0"
    @State var text2 = "0"
    @State var text1 = "0"
    @State var text = "0"
    @State var selectedOption = "+"
    @State var selectedOption1 = "+"
    @State var selectedOption2 = "+"
    @State var selectedOption3 = "+"
    @State var selectedOption4 = "+"
    @State var selectedOption5 = "+"
    @State var n1 = "0"
    @State var n2 = "1"
    @State var statue = false
    @State var statue1 = false
    @State var statue2 = true
    
    let maxLength = 2
    
    var body: some View {
        VStack (spacing:20){
            if statue2{
                Text("Enter Function Number")
                    .font(.system(size: 50))
                HStack{
                    makePicker(selectedOption: $selectedOption)
                    limitedTextField(text: $text5, maxLength: 2)
                    Text("x^5")
                    HStack{
                        makePicker(selectedOption: $selectedOption1)
                        limitedTextField(text: $text4, maxLength: 2)
                        Text("x^4")
                        makePicker(selectedOption: $selectedOption2)
                        limitedTextField(text: $text3, maxLength: 2)
                        Text("x^3")
                        makePicker(selectedOption: $selectedOption3)
                    }
                    HStack{
                        limitedTextField(text: $text2, maxLength: 2)
                        Text("x^2")
                        makePicker(selectedOption: $selectedOption4)
                        limitedTextField(text: $text1, maxLength: 2)
                        Text("x")
                        makePicker(selectedOption: $selectedOption5)
                        limitedTextField(text: $text, maxLength: 2)
                    }
                }
                HStack{
                    Text("區間")
                    Text("[")
                    limitedTextField(text: $n1, maxLength: 2)
                    Text(",")
                    limitedTextField(text: $n2, maxLength: 2)
                    Text("]")
                }
                Button(action: {
                    statue = true
                }) {
                    Text("Submit")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                if statue{
                    Text("一階導函數：\(first(five: Int(text5) ?? 0, four: Int(text4) ?? 0, three: Int(text3) ?? 0, two: Int(text2) ?? 0, one: Int(text1) ?? 0, s1: selectedOption, s2: selectedOption1, s3: selectedOption2, s4: selectedOption3, s5: selectedOption4))")
                        .font(.system(size: 25))
                    Text("二階導函數：\(second(five: Int(text5) ?? 0, four: Int(text4) ?? 0, three: Int(text3) ?? 0, two: Int(text2) ?? 0, s1: selectedOption, s2: selectedOption1, s3: selectedOption2, s4: selectedOption3))")
                        .font(.system(size: 25))
                    HStack {
                        let funct = firstfunction(five: Int(text5) ?? 0, four: Int(text4) ?? 0, three: Int(text3) ?? 0, two: Int(text2) ?? 0, one: Int(text1) ?? 0, s1: selectedOption, s2: selectedOption1, s3: selectedOption2, s4: selectedOption3, s5: selectedOption4)
                        let rawfunct = third(five: Int(text5) ?? 0, four: Int(text4) ?? 0, three: Int(text3) ?? 0, two: Int(text2) ?? 0, one: Int(text1) ?? 0, zero: Int(text) ?? 0, s1: selectedOption, s2: selectedOption1, s3: selectedOption2, s4: selectedOption3, s5: selectedOption4, s6: selectedOption5)
                        let extrema = evaluateFunction(function: funct, rawFunction: rawfunct, lowerBound: Double(n1) ?? 0, upperBound: Double(n2) ?? 0)
                        if let maxV = extrema.maxValue {
                            Text("極大值：\(maxV)")
                                .font(.system(size: 25))
                        } else {
                            Text("極大值：N/A")
                                .font(.system(size: 25))
                        }
                        if let minV = extrema.minValue {
                            Text("極小值：\(minV)")
                                .font(.system(size: 25))
                        } else {
                            Text("極小值：N/A")
                                .font(.system(size: 25))
                        }
                        
                    }
                    Button(action: {
                        statue1 = true
                        statue2 = false
                    }) {
                        Text("Graph")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(10)
                    }
                }
            }
            if statue1{
                HStack{
                    ZStack {
                        let rawfunct = third(five: Int(text5) ?? 0, four: Int(text4) ?? 0, three: Int(text3) ?? 0, two: Int(text2) ?? 0, one: Int(text1) ?? 0, zero: Int(text) ?? 0, s1: selectedOption, s2: selectedOption1, s3: selectedOption2, s4: selectedOption3, s5: selectedOption4, s6: selectedOption5)
                        // GraphicalView
                        GraphicalView(function: rawfunct, lowerBound: -5, upperBound: 5)
                            .frame(width: 50, height: 50, alignment: .center)
                            .padding()
                    }
                    Button(action: {
                        statue1 = false
                        statue2 = true
                    }) {
                        Text("Back")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.yellow)
                            .cornerRadius(10)
                    }
                }    
                }
        }
    }
}

 
