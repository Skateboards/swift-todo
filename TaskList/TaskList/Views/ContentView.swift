//
//  ContentView.swift
//  TaskList
//
//  Created by Charlie.Collier on 4/8/20.
//  Copyright © 2020 Charlie.Collier. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var taskStore: TaskStore
  @State var modalIsPresented = false

  var body: some View {
    //      List(taskStore.tasks.indices) { task in
    //        Text("\(self.taskStore.tasks[task].name)")
    //      }

    NavigationView {
      List {
        ForEach(taskStore.tasks) { task in
          Text(task.name)
        }
        .onMove {
          sourceIndeces, destinationIndex in self.taskStore.tasks.move(fromOffsets: sourceIndeces, toOffset: destinationIndex)
        }
        .onDelete {
          indexSet in self.taskStore.tasks.remove(atOffsets: indexSet)
        }
      }
      .navigationBarTitle("Tasks")
      .navigationBarItems(
        leading: EditButton(),
        trailing: Button(action: {
          self.modalIsPresented = true
        }) {
          Image(systemName: "plus")
        }
      )
    }
    .sheet(isPresented: $modalIsPresented) {
      NewTaskView(taskStore: TaskStore())
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(taskStore: TaskStore())
  }
}
