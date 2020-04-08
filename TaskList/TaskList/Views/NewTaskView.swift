//
//  NewTaskView.swift
//  TaskList
//
//  Created by Charlie.Collier on 4/8/20.
//  Copyright © 2020 Charlie.Collier. All rights reserved.
//

import SwiftUI

struct NewTaskView: View {
  var taskStore: TaskStore

  @State var text = ""
  @State var priority: Task.Priority = .medium
  @Environment(\.presentationMode) var presentationMode

  var body: some View {
    Form {
      TextField("Task Name", text: $text)
      VStack {
        Text("Priority")
        Picker("Priority", selection: $priority.caseIndex){
          ForEach(Task.Priority.allCases.indices) { priorityIndex in
            Text(
              Task.Priority.allCases[priorityIndex].rawValue.capitalized
            )
              .tag(priorityIndex)
          }
        }.pickerStyle(SegmentedPickerStyle())
      }
      Button("Add") {
        let priorityIndex = self.taskStore.getIndexForPriority(for: self.priority)
        self.taskStore.prioritizedTasks[priorityIndex].tasks.append(
          Task(name: self.text)
        )
        self.presentationMode.wrappedValue.dismiss()
      }.disabled(text.isEmpty)
    }
  }
}

struct NewTaskView_Previews: PreviewProvider {
  static var previews: some View {
    NewTaskView(taskStore: TaskStore())
  }
}
