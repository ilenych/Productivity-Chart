//
//  ContentView.swift
//  Chart
//
//  Copyright © 2019 <ASi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var pickerSelectedItem = 2
    
    @State var dataPoints: [[CGFloat]] = [
        [50, 100, 130, 110, 140, 160, 180],
        [23, 176, 85, 150, 120, 170, 40],
        [45, 130, 65, 80, 90, 90, 120],
        [123, 86, 85, 140, 140, 0, 0]
    ]
    
    var body: some View {
        ZStack{
            Color("setColor").edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 16) {
                // Text
                Text("Productivity Chart ")
                    .font(.system(size: 34))
                    .fontWeight(.heavy)
                .foregroundColor(Color(#colorLiteral(red: 0.8465406299, green: 0.1195536181, blue: 0.4459758997, alpha: 1)))
                    .padding(.top, 24)
                // Image
                Image("clock")
                .resizable()
                    .scaledToFit()
//                    .frame(width: 300.0, height: 300.0)
//                    .padding(.vertical, 50)
                // Picker
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                    Text("Last Week").tag(0)
                    Text("Yesterday").tag(1)
                    Text("Today").tag(2)
                    Text("This week").tag(3)
                }
                .pickerStyle(SegmentedPickerStyle())
                .colorMultiply(Color(#colorLiteral(red: 0.8465406299, green: 0.1195536181, blue: 0.4459758997, alpha: 1)))
                .foregroundColor(.white)
                .padding(.horizontal, 24)
                // Capsule
                HStack (spacing: 16) {
                    StackedBarView(value: dataPoints[pickerSelectedItem][0], number: 0)
                    StackedBarView(value: dataPoints[pickerSelectedItem][1], number: 1)
                    StackedBarView(value: dataPoints[pickerSelectedItem][2], number: 2)
                    StackedBarView(value: dataPoints[pickerSelectedItem][3], number: 3)
                    StackedBarView(value: dataPoints[pickerSelectedItem][4], number: 4)
                    StackedBarView(value: dataPoints[pickerSelectedItem][5], number: 5)
                    StackedBarView(value: dataPoints[pickerSelectedItem][6], number: 6)
                }.padding(.top, 8)
                    .animation(.default)
            }
        }
    }
}

struct StackedBarView: View {
    
    var value: CGFloat
    var number: Int
    
    @State var nameDaysOfWeek: [String] = ["M", "T", "W", "TH", "F", "Su", "Sa"]
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                    .foregroundColor(Color("capsule"))
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(Color(#colorLiteral(red: 0.8465406299, green: 0.1195536181, blue: 0.4459758997, alpha: 1)))
            }
            Text(nameDaysOfWeek[number]).padding(.vertical, 16)
                .foregroundColor(Color("daysOfWeek"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
