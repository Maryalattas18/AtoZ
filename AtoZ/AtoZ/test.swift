//
//  test.swift
//  AtoZ
//
//  Created by Doaa on 12/01/2023.
//
//apple 
import SwiftUI

struct test: View {
    
    @State private var date = Date()
    let dateRange: ClosedRange<Date> = {
        let calendar = Calendar.current
        let startComponents = DateComponents(year: 2021, month: 1, day: 1)
        let endComponents = DateComponents(year: 2021, month: 12, day: 31, hour: 23, minute: 59, second: 59)
        return calendar.date(from:startComponents)!
            ...
            calendar.date(from:endComponents)!
    }()

    var body: some View {
        DatePicker(
            "Start Date",
             selection: $date,
             in: dateRange,
            displayedComponents: [ .hourAndMinute]
        )
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
