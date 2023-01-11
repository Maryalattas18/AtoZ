//
//  ContentView.swift
//  AtoZ
//
//  Created by Maria Alattas on 15/06/1444 AH.
//

import SwiftUI

struct ContentView: View {
    
    @State var hoursSelection = 0
    @State var minSelection = 0
    @State var secSelection = 0
    @State var countDowonTimer = 10

       @State var timerRunning = false
       
    var hours = [Int](0..<24)
    var min = [Int](0..<60)
    var sec = [Int](0..<60)
    
    
    @State var task:String = ""
    @State private var  alarm = 1
    
    let timer = Timer.publish(every:1 , on: .main , in: .common ).autoconnect()
    
    
    var body: some View {
        
        VStack{
            Text("\(countDowonTimer)")
                           .onReceive(timer) { _ in
                               if countDowonTimer > 0 && timerRunning{
                                   countDowonTimer -= 1
                               }else{
                                   timerRunning = false
                               }
                           }
                           .font(.system(size : 80, weight : .bold))
                           .opacity(0.80)
                       
                       HStack(){
                           Button("Start") {
                               timerRunning = true
                           }
                           
                           Button("Reset") {
                               countDowonTimer = 5
                           }
                        }//v
            ZStack {
                
                Circle()
                    .stroke(Color.gray, lineWidth: 20)
                    .frame(width: 300, height: 300)
                
                TimelineView(.animation){ context in
                    let date = context.date
                    let seconds = Calendar.current.component(.second, from: date)
                    Circle()
                        .trim(from: 0, to: Double(seconds)/60.0)
                    
                        .stroke(Color("Color"), lineWidth: 10)
                        .frame(width: 300, height: 300)
                        .rotationEffect(Angle(degrees: 270))
                    
                                    }//contec=xt
                                    .padding()
                    
                        HStack{
                            
                            Picker(selection: self.$hoursSelection, label: Text("")) {
                                ForEach(0 ..< self.hours.count) { index in
                                    Text("\(self.hours[index])  H").tag(index)
                                }//for
                            }//pic
                            .pickerStyle(WheelPickerStyle())
                            
                            Picker(selection: self.$minSelection, label: Text("")) {
                                ForEach(0 ..< self.min.count) { index in
                                    Text("\(self.min[index])  M").tag(index)
                                }//for
                            }//pic
                            .pickerStyle(WheelPickerStyle())
                            
                            Picker(selection: self.$secSelection, label: Text("")) {
                                ForEach(0 ..< self.sec.count) { index in
                                    Text("\(self.sec[index])  S").tag(index)
                                }//for
                            }//pic
                            .pickerStyle(WheelPickerStyle())
                        }//h
                        .frame(width: 200,height: 200)
                
    
                }//Z
            
            TextField("Task", text: $task)
                .frame(width: 270.0, height: 50.0)
                .foregroundColor(Color.gray)
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth:1))
            
            HStack{
                Picker("Alarm In", selection: $alarm) { Text("5 M")
                        .tag(0)
                    Text("10 M")
                    .tag(1)}
                .pickerStyle(SegmentedPickerStyle())
            }
            .cornerRadius(8)
            .frame(width: 270.0, height: 50.0)
            
            Button {

            } label: {
                Text("Start")
            }//button
            .padding()
            .frame(maxWidth: 200)
            .font(.callout)
            .foregroundColor(.white)
            .background(Color("Color"))
            .cornerRadius(8)

            
        }//v
    }//body
}//all
    




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
