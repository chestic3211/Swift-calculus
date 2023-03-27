import SwiftUI
import PlaygroundSupport

func limitedTextField(text: Binding<String>, maxLength: Int) -> some View {
    return TextField("0", text: text, onEditingChanged: { (isChanged) in
        // Do something when editing status changed
    })
    .frame(width: 20, height: 30, alignment: .center)
    .padding(.horizontal, 10)
    .overlay(
        RoundedRectangle(cornerRadius: 8)
            .stroke(Color.gray, lineWidth: 1)
    )
    .onChange(of: text.wrappedValue) { newValue in
        if newValue.count > maxLength {
            text.wrappedValue = String(newValue.prefix(maxLength))
        }
    }
    .keyboardType(.numberPad)
}

func makePicker(selectedOption: Binding<String>) -> some View {
    Picker("", selection: selectedOption) {
        Text("+").tag("+")
        Text("-").tag("-")
    }
}



func first(five: Int, four: Int, three: Int, two: Int, one: Int, s1: String, s2: String, s3: String, s4: String, s5: String) -> String {
    var x = ""
    if five != 0 {
        x += "\(s1)\(five * 5)x^4"
    }
    if four != 0 {
        x += "\(s2)\(four * 4)x^3"
    }
    if three != 0 {
        x += "\(s3)\(three * 3)x^2"
    }
    if two != 0 {
        x += "\(s4)\(two * 2)x"
    }
    if one != 0 {
        x += "\(s5)\(one)"
    }
    return x
}


func second(five: Int, four: Int, three: Int, two: Int, s1: String, s2: String, s3: String, s4: String) -> String {
    var x = ""
    if five != 0 {
        x += "\(s1)\(five * 20)x^3"
    }
    if four != 0 {
        x += "\(s2)\(four * 12)x^2"
    }
    if three != 0 {
        x += "\(s3)\(three * 6)x"
    }
    if two != 0 {
        x += "\(s4)\(two * 2)"
    }
    return x
}


func third(five: Int, four: Int, three: Int, two: Int, one: Int, zero: Int, s1: String, s2: String, s3: String, s4: String, s5: String, s6: String) -> String {
    var x = ""
    if five != 0 {
        x += "\(s1)\(five)*x*x*x*x*x"
    }
    if four != 0 {
        x += "\(s2)\(four)*x*x*x*x"
    }
    if three != 0 {
        x += "\(s3)\(three)*x*x*x"
    }
    if two != 0 {
        x += "\(s4)\(two)*x*x"
    }
    if one != 0 {
        x += "\(s5)\(one)*x"
    }
    if zero != 0 {
        x += "\(s6)\(zero)"
    }
    if x.first == "+" {
        x.removeFirst()
        return x
    }
    return x
}

func firstfunction(five: Int, four: Int, three: Int, two: Int, one: Int, s1: String, s2: String, s3: String, s4: String, s5: String) -> String {
    var x = ""
    if five != 0 {
        x += "\(s1)\(five * 5)*x*x*x*x"
    }
    if four != 0 {
        x += "\(s2)\(four * 4)*x*x*x"
    }
    if three != 0 {
        x += "\(s3)\(three * 3)*x*x"
    }
    if two != 0 {
        x += "\(s4)\(two * 2)*x"
    }
    if one != 0 {
        x += "\(s5)\(one)"
    }
    if x.first == "+" {
        x.removeFirst()
        return x
    }
    return x
}
