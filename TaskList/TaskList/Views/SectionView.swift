//
//  SectionView.swift
//  TaskList
//
//  Created by Charlie.Collier on 4/8/20.
//  Copyright © 2020 Charlie.Collier. All rights reserved.
//

import SwiftUI

struct SectionView: View {
  @Binding var prioritizedTask: TaskStore.PrioritizedTasks

    var body: some View {
      Section(header: Text(
        "\(prioritizedTask.priority.rawValue.capitalized) Priority"
      )){
        ForEach(prioritizedTask.tasks) { index in
          RowView(task: self.$prioritizedTask.tasks[index])
        }
        .onMove {
          sourceIndeces, destinationIndex in self.prioritizedTask.tasks.move(fromOffsets: sourceIndeces, toOffset: destinationIndex)
        }
        .onDelete {
          indexSet in self.prioritizedTask.tasks.remove(atOffsets: indexSet)
        }
      }

    }
}
