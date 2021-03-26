import SwiftUI

struct ContentView: View {
    
    @State var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Šaptinovci")
            
                WeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 13)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "tornado",
                                   temperature: 26)
                    
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "cloud.sun.fill",
                                   temperature: 12)
                    
                    WeatherDayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: -23)
                    
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "cloud.bolt.rain.fill",
                                   temperature: 0)
                    
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "thermometer.sun.fill",
                                   temperature: 44)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,  isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
        
    }
}
