//
//  ListRowTaskView.swift
//  TrackYourDay
//
//  Created by Poonam on 15/03/25.
//
import SwiftUI

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
                                if(currentTask.isCompleted == true) {
                                    currentTask.isCompleted = false
                                    let index = dailyTasksListViewModel.completedTasks.firstIndex { item in
                                        item.id == currentTask.id
                                    }

                                    dailyTasksListViewModel.toddlerTasks.append(currentTask)
                                    let _ = print(index)
                                    let _ = print(dailyTasksListViewModel.toddlerTasks)
                                    let _ = print(dailyTasksListViewModel.completedTasks)
                                    dailyTasksListViewModel.completedTasks.remove(at: index ?? -1)

                                } else  {
                                    currentTask.isCompleted = true
                                    let index = dailyTasksListViewModel.toddlerTasks.firstIndex { item in
                                        item.id == currentTask.id
                                    }
                                    
                                    dailyTasksListViewModel.completedTasks.append(currentTask)
                                    dailyTasksListViewModel.toddlerTasks.remove(at: index ?? -1)
                                }
                                
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
