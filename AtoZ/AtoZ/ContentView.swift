//
//  ContentView.swift
//  AtoZ
//
//  Created by Maria Alattas on 15/06/1444 AH.
//

import SwiftUI

struct ContentView: View {
    
   

    var body: some View {
      
        VStack{
            
           // Gauge(value: 50, in: 0...100) {
            Gauge(value: 0.5) {
                        Text("Gauge")
                    }                   .gaugeStyle(CustomGaugeStyle())
    
        
        }//Vs
        }//body
    
}//all


struct CustomGaugeStyle: GaugeStyle {
    
    @State private var selectedHouers = 0
    @State private var selectedMinutes = 2
    @State private var selectedSecondes = 2
    
    func makeBody(configuration: GaugeStyleConfiguration) -> some View {
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: 10)
                .frame(width: 300, height: 300)
            Circle()
            
                .trim(from: 0, to: CGFloat(configuration.value))
                .stroke(Color.blue, lineWidth: 10)
                .frame(width: 300, height: 300)
                .rotationEffect(Angle(degrees: 90))
//            Text("\(Int(configuration.value * 100))%")
//                .font(.title)
            
           HStack() {
                //houer
                Picker(selection: $selectedHouers, label: Text("C1")) {
                    ForEach(0..<12) { n in
                        Text("\(n) ").tag(n)
                    }
                }
                .pickerStyle(.wheel)
                .frame(minWidth: 0)
                .clipped()
                // min
                Picker(selection: $selectedMinutes, label: Text("C1")) {
                    ForEach(0..<60) { n in
                        Text("\(n) ").tag(n)
                    }
                }
                .pickerStyle(.wheel)
                .frame(minWidth: 0)
                .clipped()
                //sec
                Picker(selection: $selectedMinutes, label: Text("C1")) {
                    ForEach(0..<60) { n in
                        Text("\(n) ").tag(n)
                    }
                }
                .pickerStyle(.wheel)
                .frame(minWidth: 0)
                .clipped()
                
            }
           .frame(width: /*@START_MENU_TOKEN@*/240.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/240.0/*@END_MENU_TOKEN@*/)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
