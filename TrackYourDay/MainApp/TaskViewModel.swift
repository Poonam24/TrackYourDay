//
//  Tasks.swift
//  TrackYourDay
//
//  Created by Poonam on 13/03/25.
//

import SwiftUICore


class TaskViewModel: Identifiable, ObservableObject {
    
    @Published var toddlerTasks : [Task] = [Task(id: "1", title: "Wake up", image: Image(systemName: "sunrise"), isCompleted: false),
                                            Task(id: "2", title: "Eat breakfast", image: Image(systemName: "flame.fill"), isCompleted: false),
                                            Task(id: "3", title: "Brush teeth", image: Image(systemName: "tooth.fill"), isCompleted: false),
                                            Task(id: "4", title: "Playtime", image: Image(systemName: "gamecontroller.fill"), isCompleted: false),
                                            Task(id: "5", title: "Take a nap", image: Image(systemName: "moon.stars.fill"), isCompleted: false),
                                            Task(id: "6", title: "Snack time", image: Image(systemName: "applelogo"), isCompleted: false),
                                            Task(id: "7", title: "Storytime", image: Image(systemName: "book.fill"), isCompleted: false),
                                            Task(id: "8", title: "Dinner", image: Image(systemName: "plate.fill"), isCompleted: false),
                                            Task(id: "9", title: "Bath time", image: Image(systemName: "shower.fill"), isCompleted: false),
                                            Task(id: "10", title: "Bedtime", image: Image(systemName: "moon.fill"), isCompleted: false)
    ]
    
    
    @Published var completedTasks : [Task] = []
}


