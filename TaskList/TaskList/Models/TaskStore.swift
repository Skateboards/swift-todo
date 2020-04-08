//
//  TaskStore.swift
//  TaskList
//
//  Created by Charlie.Collier on 4/8/20.
//  Copyright © 2020 Charlie.Collier. All rights reserved.
//


import Combine

class TaskStore: ObservableObject {
  
  @Published var prioritizedTasks = [
    PrioritizedTasks(
      priority: .high,
      names: [
        "Code todo App",
        "Laundry",
        "Feed cats",
        "Make lunch"
      ]
    ),
    PrioritizedTasks(
      priority: .medium,
      names: [
        "Make dinner",
        "get dressed",
        "brush teeth",
        "make coffee"
      ]
    ),
    PrioritizedTasks(
      priority: .low,
      names: ["make bed"]
    ),
    PrioritizedTasks(
      priority: .no,
      names: ["finish course"])
  ]

  func getIndexForPriority(for priority: Task.Priority) -> Int {
    prioritizedTasks.firstIndex { $0.priority == priority }!
  }
}

extension TaskStore.PrioritizedTasks {
  init(priority: Task.Priority, names: [String]) {
    self.init(priority: priority,
              tasks: names.map { Task(name: $0) }
    )
  }
}
