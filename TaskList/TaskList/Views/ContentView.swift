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
        ForEach(taskStore.prioritizedTasks) { index in
          SectionView(prioritizedTask: self.$taskStore.prioritizedTasks[index])
        }
      }
      .listStyle(GroupedListStyle())
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
      NewTaskView(taskStore: self.taskStore)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(taskStore: TaskStore())
  }
}


