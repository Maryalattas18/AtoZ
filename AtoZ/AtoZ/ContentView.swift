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
    

     
       
    var hours = [Int](0..<24)
    var min = [Int](0..<60)
    var sec = [Int](0..<60)
    
    
    @State var task:String = ""
    
    @State var countDowonTimer = 10
    @State private var  alarm = 1
    @State var timerRunning = false
    
    let timer = Timer.publish(every:1 , on: .main , in: .common ).autoconnect()
    
    
    
    var body: some View {
        
        VStack{
            HStack{
                
                Text("\(hoursSelection)")
                    .onReceive(timer) { _ in
                        
                            if hoursSelection > 0 && timerRunning{
                                if minSelection == 0 && secSelection == 0 {
        
                                hoursSelection -= 1
                            }
                        }else{
                            timerRunning = false
                        }
                    }
                    .font(.system(size : 80, weight : .bold))
                    .opacity(0.80)
                
                
                
                
                
                
                
                
                
                Text("\(minSelection)")
                    .onReceive(timer) { _ in
                        if minSelection > 0 && timerRunning{
                            minSelection -= 1
                        }else{
                            timerRunning = false
                        }
                    }
                    .font(.system(size : 80, weight : .bold))
                    .opacity(0.80)
               
                
                
                
                
                
                Text("\(secSelection)")
                    .onReceive(timer) { _ in
                        if secSelection > 0 && timerRunning{
                            secSelection -= 1
                        }else{
                            timerRunning = false
                        }
                    }
                    .font(.system(size : 80, weight : .bold))
                    .opacity(0.80)
                
            }
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
                            Text("\(hoursSelection)")
                            

                            Picker(selection: self.$minSelection, label: Text("")) {
                                ForEach(0 ..< self.min.count) { index in
                                    Text("\(self.min[index])  M").tag(index)
                                }//for
                            }//pic
                            .pickerStyle(WheelPickerStyle())
                            Text("\(minSelection)")
                            
                            
                            Picker(selection: self.$secSelection, label: Text("")) {
                                ForEach(0 ..< self.sec.count) { index in
                                    Text("\(self.sec[index])  S").tag(index)
                                }//for
                            }//pic
                            .pickerStyle(WheelPickerStyle())
                            Text("\(secSelection)")
                        }//h
                        .frame(width: 300,height: 300)
                
    
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
