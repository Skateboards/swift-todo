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
  @Environment(\.presentationMode) var presentationMode

  var body: some View {
    Form {
      TextField("Task Name", text: $text)
      Button("Add") {
        self.taskStore.tasks.append(
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
