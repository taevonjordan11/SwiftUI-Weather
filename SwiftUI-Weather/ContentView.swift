//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Taevon Jordan on 7/7/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack{
                CityTextView(cityName: "New York, NY")
                
                MainWeatherView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 75)
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "MON", imageName: "cloud.sun.fill", temperature: 77)
                    
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 87)
                    
                    WeatherDayView(dayOfWeek: "WED", imageName: "sun.rain.fill", temperature: 96)
                    
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.sun.fill", temperature: 85)
                    
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.rain.fill", temperature: 83)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Mode",
                                  textColor: .blue,
                                  backgroundColor: .white)
                        
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
    var temperature: Int
    
    var body: some View {
        VStack{
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
    
//    var topColor: Color
//    var bottomColor: Color
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body : some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
        
    }
}

struct MainWeatherView: View {
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°F")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
        
    }
}


