//
//  ContentView.swift
//  TrackYourDay
//
//  Created by Poonam on 13/03/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var dailyTaskViewModel = TaskViewModel()
        
    var body: some View {
        
        let todayDate = Date()
        let dateFormatter = formatDate()
        let _ =  print(dateFormatter.string(from: todayDate))
        NavigationView {
            Form {
                    SectionHeaderView()
                    List($dailyTaskViewModel.toddlerTasks, id: \.id) { $task in
                        NavigationLink {
                            Text("yet to design")
                        } label: {
                            ListRowTaskView(currentTask: $task).environmentObject(dailyTaskViewModel)
                        }
                    }
                    
                if($dailyTaskViewModel.completedTasks.count > 0) {
                    Section(header: Text("Tasks Completed")
                        .foregroundColor(.green)
                        .font(.headline)) {
                            List($dailyTaskViewModel.completedTasks, id: \.id) { doneTask in
                                ListRowTaskView(currentTask: doneTask).environmentObject(dailyTaskViewModel)
                                
                            }
                        }
                }
            }
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



#Preview {
    ContentView()
}
