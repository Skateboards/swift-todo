//
//  TaskStore.PrioritizedTasks.swift
//  TaskList
//
//  Created by Charlie.Collier on 4/8/20.
//  Copyright © 2020 Charlie.Collier. All rights reserved.
//

extension TaskStore {
  struct PrioritizedTasks {
    let priority: Task.Priority
    var tasks: [Task]
  }
}

extension TaskStore.PrioritizedTasks : Identifiable {
  var id: Task.Priority {priority}
}
