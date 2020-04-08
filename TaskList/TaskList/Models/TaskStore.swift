//
//  TaskStore.swift
//  TaskList
//
//  Created by Charlie.Collier on 4/8/20.
//  Copyright © 2020 Charlie.Collier. All rights reserved.
//


import Combine

class TaskStore: ObservableObject {
  @Published var tasks = [
    "Code todo App",
    "Laundry",
    "Feed cats",
    "Make lunch",
    "Make dinner",
    "get dressed",
    "brush teeth",
    "make coffee",
    "make bed",
    "finish course"
    ].map { Task(name: $0) }
  
}
