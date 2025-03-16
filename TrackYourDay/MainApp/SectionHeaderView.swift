//
//  SectionHeaderView.swift
//  TrackYourDay
//
//  Created by Poonam on 15/03/25.
//

import SwiftUI


struct SectionHeaderView: View {
    
    @State private var currentDate : Date = Date()
    @State private var isDatePickerVisible: Bool = false
    
    var body: some View {
        
        let dateFormatter = formatDate()
        let _ =  print(dateFormatter.string(from: currentDate))

        HStack {
            Text("Task For, \(dateFormatter.string(from: currentDate))")
                .foregroundColor(.blue)
                .font(.headline)
            Spacer()
            Image(systemName: "calendar").onTapGesture {
                withAnimation {
                    isDatePickerVisible.toggle()
                }
            }
        }
        
        if isDatePickerVisible {
            DatePicker("Select Date", selection: $currentDate, in: ...Date(), displayedComponents: .date)
                .padding()
                .datePickerStyle(.graphical)
                .transition(.move(edge: .bottom))

        }
    }

    
    
    func formatDate() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        //dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "dd MMMM yyyy"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        return dateFormatter
    }
}
