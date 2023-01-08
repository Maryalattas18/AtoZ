//
//  ContentView.swift
//  AtoZ
//
//  Created by Maria Alattas on 15/06/1444 AH.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedHouers = 0
    @State private var selectedMinutes = 2
    @State private var selectedSecondes = 2

    var body: some View {
      
        VStack{
            
            Gauge(value: 50, in: 0...100) {
                
        
                HStack(spacing: 0) {
                    //houer
                    Picker(selection: $selectedHouers, label: Text("H")) {
                        ForEach(0..<12) { n in
                            Text("\(n) ").tag(n)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(minWidth: 0)
                    .clipped()
                    // min
                    Picker(selection: $selectedMinutes, label: Text("M")) {
                        ForEach(0..<60) { n in
                            Text("\(n) ").tag(n)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(minWidth: 0)
                    .clipped()
                    //sec
                    Picker(selection: $selectedMinutes, label: Text("S")) {
                        ForEach(0..<95) { n in
                            Text("\(n) ").tag(n)
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(minWidth: 0)
                    .clipped()
                }
            }
          .gaugeStyle(.accessoryCircularCapacity)
           
        }//Vs
        }//body
    
}//all

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
