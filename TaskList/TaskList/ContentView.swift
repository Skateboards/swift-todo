//
//  ContentView.swift
//  TaskList
//
//  Created by Charlie.Collier on 4/8/20.
//  Copyright © 2020 Charlie.Collier. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var taskStore: TaskStore

    var body: some View {
//      List(taskStore.tasks.indices) { task in
//        Text("\(self.taskStore.tasks[task].name)")
//      }

      List(taskStore.tasks) { task in
        Text(task.name)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      ContentView(taskStore: TaskStore())
    }
}
