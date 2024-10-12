import SwiftUI

struct WeatherButtonView: View {
    
    var buttonName: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(buttonName)
            .frame(width: 150, height: 50)
            .background(backgroundColor.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 16, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

