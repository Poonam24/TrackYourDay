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
        
        
        Form {
               

            Section {
                    SectionHeaderView()

                        List($dailyTaskViewModel.toddlerTasks, id: \.id) { $task in
                            ListRowTaskView(currentTask: $task).environmentObject(dailyTaskViewModel)
                        }
                }
            
            if($dailyTaskViewModel.completedTasks.count > 0) {
                Section(header: Text("Tasks Completed")
                    .foregroundColor(.green)
                    .font(.headline)) {

                        List($dailyTaskViewModel.completedTasks, id: \.id) { doneTask in
                            ListRowTaskView(currentTask: doneTask)
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

struct ListRowTaskView: View {
    
    @EnvironmentObject var dailyTasksListViewModel: TaskViewModel
    @Binding var currentTask : Task
    
    var body: some View {
        HStack {
            currentTask.image!
                .resizable()
                .frame(width: 30, height: 30)
                .padding()
           
            Text(currentTask.title!)
            
            
                .swipeActions {
                    Button {
                        //refreshList(currentTask)
                        currentTask.isCompleted = true
                        let index = dailyTasksListViewModel.toddlerTasks.firstIndex { item in
                            item.id == currentTask.id
                        }
                        
                        dailyTasksListViewModel.completedTasks.append(currentTask)
                        
                        dailyTasksListViewModel.toddlerTasks.remove(at: index ?? -1)
                        
                    } label: {
                        Text("Hurray!! I did it!")
                    }
                }
            }
    }
    
    
}


struct CheckboxToggleStyle : ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 24.0, height: 24.0)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

#Preview {
    ContentView()
}
