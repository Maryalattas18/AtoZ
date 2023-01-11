//
//  SwiftUIView.swift
//  AtoZ
//
//  Created by Maria Alattas on 18/06/1444 AH.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State var hoursSelection = 0
    @State var minSelection = 0
    @State var secSelection = 0
    
    var hours = [Int](0..<24)
    var min = [Int](0..<60)
    var sec = [Int](0..<60)
    
    var body: some View {
        
        
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

    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
