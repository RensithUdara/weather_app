import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    @State private var isCelsius = true
    
    var body: some View {
        ZStack {
            BackGroundView(isNight: isNight, temp: isCelsius ? 24 : 76)
                .animation(.easeInOut(duration: 1.0), value: isNight)
            
            VStack {
                CityView(cityName: "Galle, Sri Lanka")
                    .padding()
                
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                temp: isCelsius ? 24 : 76,
                                isCelsius: isCelsius)
                    .padding(.bottom, 95)
                
                HStack(spacing: 25) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temp: isCelsius ? 20 : 68)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.moon.fill", temp: isCelsius ? 19 : 66)
                    WeatherDayView(dayOfWeek: "THU", imageName: "sun.max.fill", temp: isCelsius ? 28 : 82)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temp: isCelsius ? 22 : 72)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "wind.snow", temp: isCelsius ? 10 : 50)
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    Button {
                        isNight.toggle()
                    } label: {
                        WeatherButtonView(buttonName: "Change Day Time", textColor: .blue, backgroundColor: .white)
                    }
                    
                    Button {
                        isCelsius.toggle()
                    } label: {
                        WeatherButtonView(buttonName: isCelsius ? "Switch to °F" : "Switch to °C", textColor: .blue, backgroundColor: .white)
                    }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temp)°")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackGroundView: View {
    
    var isNight: Bool
    var temp: Int
    
    var body: some View {
        let backgroundColor = isNight ? Color.black : dynamicBackgroundColor(temp: temp)
        
        ContainerRelativeShape()
            .fill(backgroundColor.gradient)
            .ignoresSafeArea()
    }
    
    func dynamicBackgroundColor(temp: Int) -> Color {
        switch temp {
        case ..<15:
            return Color.blue
        case 15..<25:
            return Color.orange
        default:
            return Color.red
        }
    }
}

struct CityView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
    }
}

struct MainWeatherView: View {
    
    var imageName: String
    var temp: Int
    var isCelsius: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
                .animation(.easeInOut, value: imageName)
            
            Text("\(temp)° \(isCelsius ? "C" : "F")")
                .font(.system(size: 40, weight: .medium))
                .foregroundColor(.white)
                .animation(.easeInOut, value: temp)
        }
    }
}
