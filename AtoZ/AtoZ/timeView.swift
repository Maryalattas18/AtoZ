//
//  timeView.swift
//  AtoZ
//
//  Created by Doaa on 12/01/2023.
//

import SwiftUI

struct timeView: View {
    
    @State var user_Date : Date = .now
    @State var nowDate : Date = Date()
   
   
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.nowDate = Date()
        }
    }
    
    
    
    func TimerFunction(from date: Date) -> String {
        
        let calender = Calendar(identifier: .gregorian)
        let timeValue = calender
            
            .dateComponents([.hour, .minute, .second], from: nowDate, to: user_Date)
        return String(format: " %02d:%02d:%02d",
//        return String(format: "%02d days left - %02d:%02d:%02d",
                      //timeValue.day!,
                      timeValue.hour!,
                      timeValue.minute!,
                      timeValue.second!
        )
    }

    
    
    
    
    var body: some View {
        VStack{
            
          //  Text(Date.now.formatted( date: .omitted, time: .standard))
            
            
            HStack {
                DatePicker("Date", selection: $user_Date)
                
                //.datePickerStyle(.graphical)
                    .foregroundColor(.black)
                    .colorMultiply(.red)
            }
            .padding()
            
            
            
          
            VStack {
                Text(TimerFunction(from:user_Date))
                    .font(.system(size: 20).bold())
                    .foregroundColor(.indigo)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(.red.opacity(0.2))
            )
            .padding(.top, 20)
            .padding(.bottom, 5)
            
            
            Button {
                self.timer // Click the button to start the timer
            } label: {
                Text("Start Timer")
                    .font(.system(size: 18).bold())
                    .padding(.vertical,18)
                    .frame(maxWidth: .infinity)
                    .background(Color("Color"))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .foregroundColor(Color.white)
            } // MARK: Button
            .padding(.horizontal,30)
            .padding(.top, 1)
            
            
            
            
        }
    }
}




struct timeView_Previews: PreviewProvider {
    static var previews: some View {
        timeView()
    }
}





extension Date {
    var displayFormat: String{
        self.formatted(
            .dateTime
             //   .year(.twoDigits)
              //  .month()
                .day()
                .hour()
                .minute()
                .second()
        )
    }
}
